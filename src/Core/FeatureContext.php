<?php

namespace Youthweb\Api\Core;

use Behat\Behat\Context\Context;
use Behat\Behat\Context\SnippetAcceptingContext;
use Behat\Behat\Tester\Exception\PendingException;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;
use GuzzleHttp\Client;
use GuzzleHttp\Exception\RequestException;
use GuzzleHttp\Exception\BadResponseException;
use PHPUnit\Framework\TestCase;

/**
 * Defines application features from the specific context.
 */
class FeatureContext extends TestCase implements Context, SnippetAcceptingContext
{
	/**
	 * The Guzzle HTTP Client.
	 */
	protected $client;

	/**
	 * The current resource
	 */
	protected $resource;

	/**
	 * The request payload
	 */
	protected $requestPayload;

	/**
	 * The request headers
	 */
	protected $request_headers = array();

	/**
	 * The Guzzle HTTP Response.
	 */
	protected $response;

	/**
	 * The decoded response object.
	 */
	protected $responsePayload;

	/**
	 * The current scope within the response payload
	 * which conditions are asserted against.
	 */
	protected $scope;

	/**
	 * Initializes context.
	 * Every scenario gets it's own context object.
	 *
	 * @param array $parameters context parameters (set them up through behat.yml)
	 */
	public function __construct($baseUrl)
	{
		$this->client = new Client(array('base_uri' => $baseUrl));
	}

	/**
	 * @Given I have the payload
	 */
	public function iHaveThePayload(PyStringNode $requestPayload)
	{
		$this->requestPayload = $requestPayload;
	}

	/**
	 * @Given I have set the :arg1 header with :arg2
	 */
	public function iHaveSetTheHeaderWith($name, $content)
	{
		$this->request_headers[$name][] = $content;
	}

	/**
     * @Given I have set the correct headers without authorization
     */
    public function iHaveSetTheCorrectHeadersWithoutAuthorization()
    {
        $this->iHaveSetTheHeaderWith('Content-Type', 'application/vnd.api+json');
        $this->iHaveSetTheHeaderWith('Accept', 'application/vnd.api+json');
        $this->iHaveSetTheHeaderWith('Accept', 'application/vnd.api+json; net.youthweb.api.version=0.14');
    }

	/**
     * @Given I have set the correct headers with valid authorization
     */
    public function iHaveSetTheCorrectHeadersWithValidAuthorization()
    {
        $this->iHaveSetTheCorrectHeadersWithoutAuthorization();
        $this->iHaveSetTheHeaderWith('Authorization', 'Bearer valid_JWT');
    }

	/**
	 * @When /^I request "(GET|PUT|POST|DELETE) ([^"]*)"$/
	 */
	public function iRequest($httpMethod, $resource)
	{
		$this->resource = $resource;

		$headers = $this->request_headers;

		// Combine headers
		array_walk($headers, function(&$content, $name) {
			$content = implode(', ', $content);
		});

		$method = strtolower($httpMethod);

		try
		{
			switch ($httpMethod) {
				case 'PUT':
				case 'POST':
					$this->response = $this->client->$method($resource, ['headers' => $headers, 'body' => $this->requestPayload]);
					break;

				default:
					$this->response = $this->client->$method($resource, ['headers' => $headers]);
			}
		}
		catch (BadResponseException $e)
		{
			$response = $e->getResponse();

			// Sometimes the request will fail, at which point we have
			// no response at all. Let Guzzle give an error here, it's
			// pretty self-explanatory.
			if ($response === null)
			{
				throw $e;
			}

			$this->response = $response;
		}
	}

	/**
	 * @Then /^I get a "([^"]*)" response$/
	 */
	public function iGetAResponse($statusCode)
	{
		$bodyOutput = (string) $this->getResponse()->getBody();

		$this->assertSame((int) $statusCode, (int) $this->getResponse()->getStatusCode(), $bodyOutput);
	}

	/**
	 * @Then the Content-Type Header :arg1 exists
	 */
	public function theContentTypeHeaderExists($content_type)
	{
		$content_types = $this->getResponse()->getHeader('Content-Type');

		$this->assertTrue(in_array($content_type, $content_types), 'Content-Type: ' . implode(', ', $content_types));
	}

	/**
	 * @Then the Accept Header :arg1 exists
	 */
	public function theAcceptHeaderExists($accept_type)
	{
		$accepts = explode(',', $this->getResponse()->getHeaderLine('Accept'));

		array_walk($accepts, function(&$string, $key) {
			$string = trim($string);
		});

		$this->assertTrue(in_array($accept_type, $accepts), 'Accept: ' . implode(', ', $accepts));
	}

	/**
	 * @Then the Location Header exists
	 */
	public function theLocationHeaderExists()
	{
		$location = $this->getResponse()->getHeaderLine('Location');

		$this->assertFalse(empty($location), $location);
	}


	/**
	 * @Given /^the response contains (\d+) items$/
	 */
	public function theResponseContainsItems($count)
	{
		$payload = $this->getScopePayload();

		$this->assertCount($count, get_object_vars($payload),
			"Asserting the request contains [$count] items: ".json_encode($payload)
		);
	}

	/**
	 * @Given /^the "([^"]*)" property equals "([^"]*)"$/
	 */
	public function thePropertyEquals($property, $expectedValue)
	{
		$payload = $this->getScopePayload();
		$actualValue = $this->arrayGet($payload, $property);

		$this->assertEquals(
			$expectedValue,
			$actualValue,
			"Asserting the [$property] property in current scope equals [$expectedValue]: ".json_encode($payload)
		);
	}

	/**
	 * @Given /^the "([^"]*)" property exists$/
	 */
	public function thePropertyExists($property)
	{
		$payload = $this->getScopePayload();

		$message = sprintf('Asserting the [%s] property exists in the scope [%s]: %s', $property, $this->scope, json_encode($payload));

		if (is_object($payload))
		{
			$this->assertTrue(array_key_exists($property, get_object_vars($payload)), $message);
		}
		else
		{
			$this->assertTrue(array_key_exists($property, $payload), $message);
		}
	}

	/**
	 * @Given /^the "([^"]*)" property is an array$/
	 */
	public function thePropertyIsAnArray($property)
	{
		$payload = $this->getScopePayload();

		$actualValue = $this->arrayGet($payload, $property);

		$this->assertTrue(
			is_array($actualValue),
			"Asserting the [$property] property in current scope [{$this->scope}] is an array: ".json_encode($payload)
		);
	}

	/**
	 * @Given /^the "([^"]*)" property is an object$/
	 */
	public function thePropertyIsAnObject($property)
	{
		$payload = $this->getScopePayload();

		$actualValue = $this->arrayGet($payload, $property);

		$this->assertTrue(
			is_object($actualValue),
			"Asserting the [$property] property in current scope [{$this->scope}] is an object: ".json_encode($payload)
		);
	}

	/**
	 * @Given /^the "([^"]*)" property is an empty array$/
	 */
	public function thePropertyIsAnEmptyArray($property)
	{
		$payload = $this->getScopePayload();
		$scopePayload = $this->arrayGet($payload, $property);

		$this->assertTrue(
			is_array($scopePayload) and $scopePayload === [],
			"Asserting the [$property] property in current scope [{$this->scope}] is an empty array: ".json_encode($payload)
		);
	}

	/**
	 * @Given /^the "([^"]*)" property contains (\d+) items$/
	 */
	public function thePropertyContainsItems($property, $count)
	{
		$payload = $this->getScopePayload();

		$this->assertCount(
			$count,
			$this->arrayGet($payload, $property),
			"Asserting the [$property] property contains [$count] items: ".json_encode($payload)
		);
	}


	/**
	 * @Given /^the "([^"]*)" property is an integer$/
	 */
	public function thePropertyIsAnInteger($property)
	{
		$payload = $this->getScopePayload();

		$this->isType(
			'int',
			$this->arrayGet($payload, $property),
			"Asserting the [$property] property in current scope [{$this->scope}] is an integer: ".json_encode($payload)
		);
	}

	/**
	 * @Given /^the "([^"]*)" property is a string$/
	 */
	public function thePropertyIsAString($property)
	{
		$payload = $this->getScopePayload();

		$this->isType(
			'string',
			$this->arrayGet($payload, $property),
			"Asserting the [$property] property in current scope [{$this->scope}] is a string: ".json_encode($payload)
		);
	}

	/**
	 * @Given /^the "([^"]*)" property is a string equalling "([^"]*)"$/
	 */
	public function thePropertyIsAStringEqualling($property, $expectedValue)
	{
		// Workaround: Behat wandelt $expectedValue in int um, wenn ein String aus Zahlen übergeben wird
		$expectedValue = (string) $expectedValue;

		$payload = $this->getScopePayload();

		$this->thePropertyIsAString($property);

		$actualValue = $this->arrayGet($payload, $property);

		$this->assertSame(
			$expectedValue,
			$actualValue,
			"Asserting the [$property] property in current scope [{$this->scope}] is a string equalling [$expectedValue]."
		);
	}

	/**
	 * @Given /^the "([^"]*)" property is a boolean$/
	 */
	public function thePropertyIsABoolean($property)
	{
		$payload = $this->getScopePayload();

		$this->assertTrue(
			gettype($this->arrayGet($payload, $property)) == 'boolean',
			"Asserting the [$property] property in current scope [{$this->scope}] is a boolean."
		);
	}

	/**
	 * @Given /^the "([^"]*)" property is a boolean equalling "([^"]*)"$/
	 */
	public function thePropertyIsABooleanEqualling($property, $expectedValue)
	{
		$payload = $this->getScopePayload();
		$actualValue = $this->arrayGet($payload, $property);

		if (! in_array($expectedValue, ['true', 'false']))
		{
			throw new \InvalidArgumentException("Testing for booleans must be represented by [true] or [false].");
		}

		$this->thePropertyIsABoolean($property);

		$this->assertSame(
			$expectedValue == 'true',
			$actualValue,
			"Asserting the [$property] property in current scope [{$this->scope}] is a boolean equalling [$expectedValue]."
		);
	}

	/**
	 * @Given /^the "([^"]*)" property is a integer equalling "([^"]*)"$/
	 */
	public function thePropertyIsAIntegerEqualling($property, $expectedValue)
	{
		$payload = $this->getScopePayload();
		$actualValue = $this->arrayGet($payload, $property);

		$this->thePropertyIsAnInteger($property);

		$this->assertSame(
			(int) $expectedValue,
			$actualValue,
			"Asserting the [$property] property in current scope [{$this->scope}] is an integer equalling [$expectedValue]."
		);
	}

	/**
	 * @Given /^the "([^"]*)" property is either:$/
	 */
	public function thePropertyIsEither($property, PyStringNode $options)
	{
		$payload = $this->getScopePayload();
		$actualValue = $this->arrayGet($payload, $property);

		$valid = explode("\n", (string) $options);

		$this->assertTrue(
			in_array($actualValue, $valid),
			sprintf(
				"Asserting the [%s] property in current scope [{$this->scope}] is in array of valid options [%s].",
				$property,
				implode(', ', $valid)
			)
		);
	}

	/**
	 * @Then the :arg1 property contains at least:
	 */
	public function thePropertyContainsAtLeast($property, PyStringNode $options)
	{
		$actualValue = $this->arrayGet($this->getScopePayload(), $property);

		$valids = explode("\n", (string) $options);

		foreach ( $valids as $valid )
		{
			$this->assertTrue(
				in_array($valid, $actualValue),
				sprintf("Asserting the [%s] property in current scope [{$this->scope}] contains at least [%s].", $property, $valid)
			);
		}
	}

	/**
	 * @Given /^scope into the first "([^"]*)" property$/
	 */
	public function scopeIntoTheFirstProperty($scope)
	{
		$this->scope = "{$scope}.0";
	}

	/**
	 * @Given /^scope into the "([^"]*)" property$/
	 */
	public function scopeIntoTheProperty($scope)
	{
		$this->scope = $scope;
	}

	/**
	 * @Given /^the properties exist:$/
	 */
	public function thePropertiesExist(PyStringNode $propertiesString)
	{
		foreach (explode("\n", (string) $propertiesString) as $property) {
			$this->thePropertyExists($property);
		}
	}

	/**
	 * @Given /^reset scope$/
	 */
	public function resetScope()
	{
		$this->scope = null;
	}

	/**
	 * @Transform /^(\d+)$/
	 */
	public function castStringToNumber($string)
	{
		return intval($string);
	}

	/**
	 * Checks the response exists and returns it.
	 *
	 * @return  Guzzle\Http\Message\Response
	 */
	protected function getResponse()
	{
		if ( ! $this->response )
		{
			throw new Exception("You must first make a request to check a response.");
		}

		return $this->response;
	}

	/**
	 * Return the response payload from the current response.
	 *
	 * @return  mixed
	 */
	protected function getResponsePayload()
	{
		if ( ! $this->responsePayload )
		{
			$json = json_decode($this->getResponse()->getBody(true));

			if (json_last_error() !== JSON_ERROR_NONE) {
				$message = 'Failed to decode JSON body ';

				switch (json_last_error()) {
					case JSON_ERROR_DEPTH:
						$message .= '(Maximum stack depth exceeded).';
						break;
					case JSON_ERROR_STATE_MISMATCH:
						$message .= '(Underflow or the modes mismatch).';
						break;
					case JSON_ERROR_CTRL_CHAR:
						$message .= '(Unexpected control character found).';
						break;
					case JSON_ERROR_SYNTAX:
						$message .= '(Syntax error, malformed JSON).';
						break;
					case JSON_ERROR_UTF8:
						$message .= '(Malformed UTF-8 characters, possibly incorrectly encoded).';
						break;
					default:
						$message .= '(Unknown error).';
						break;
				}

				throw new Exception($message);
			}

			$this->responsePayload = $json;
		}

		return $this->responsePayload;
	}

	/**
	 * Returns the payload from the current scope within
	 * the response.
	 *
	 * @return mixed
	 */
	protected function getScopePayload()
	{
		$payload = $this->getResponsePayload();

		if ( ! $this->scope )
		{
			return $payload;
		}

		return $this->arrayGet($payload, $this->scope);
	}

	/**
	 * Get an item from an array using "dot" notation.
	 *
	 * @copyright   Taylor Otwell
	 * @link		http://laravel.com/docs/helpers
	 * @param	   array   $array
	 * @param	   string  $key
	 * @param	   mixed   $default
	 * @return	  mixed
	 */
	protected function arrayGet($array, $key)
	{
		if (is_null($key)) {
			return $array;
		}

		// if (isset($array[$key])) {
		//	 return $array[$key];
		// }

		foreach (explode('.', $key) as $segment) {

			if (is_object($array)) {
				if (! isset($array->{$segment})) {
					return;
				}
				$array = $array->{$segment};

			} elseif (is_array($array)) {
				if (! array_key_exists($segment, $array)) {
					return;
				}
				$array = $array[$segment];
			}
		}

		return $array;
	}
}
