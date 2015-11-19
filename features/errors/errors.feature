Feature: Error Tests
	In order to use the API
	As a visitor

Scenario: Using the API without Content-Type Json API Header
	Given I have set the "Accept" header with "application/vnd.api+json"
	Given I have set the "Accept" header with "application/vnd.api+json; net.youthweb.api.version=0.3"
	When I request "GET /stats/account"
	Then I get a "200" response
	And the Content-Type Header "application/vnd.api+json" exists
	And the Accept Header "application/vnd.api+json; net.youthweb.api.version=0.3" exists
	And scope into the "meta" property
	And the "warnings" property is an array
	And the "warnings" property contains at least:
		"""
		You havn't specified the Header Content-Type: application/vnd.api+json. This will be necessary in future releases.
		"""

Scenario: Using the API without Accept API Version Header
	Given I have set the "Content-Type" header with "application/vnd.api+json"
	When I request "GET /stats/account"
	Then I get a "200" response
	And the Content-Type Header "application/vnd.api+json" exists
	And the Accept Header "application/vnd.api+json" exists
	And the Accept Header "application/vnd.api+json; net.youthweb.api.version=0.3" exists
	And scope into the "meta" property
	And the "warnings" property is an array
	And the "warnings" property contains at least:
		"""
		You havn't specified the API version in the Accept Header. The API version will be necessary in future releases.
		"""
