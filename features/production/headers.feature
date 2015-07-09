Feature: Header Tests
	In order to use the API
	As a visitor

Scenario: Using the API without Content-Type Json API Header
	When I request "GET /stats/account"
	Then I get a "200" response
	And the Content-Type Header "application/vnd.api+json" exists
	And scope into the "meta" property
	And the "warnings" property is an array
	And the "warnings" property contains at least:
		"""
		You havn't specified the Header Content-Type: application/vnd.api+json
		"""

Scenario: Using the API without Accept API Version Header
	When I request "GET /stats/account"
	Then I get a "200" response
	And the Accept Header "application/vnd.api+json; net.youthweb.api.versioni=0.3" exists
	And scope into the "meta" property
	And the "warnings" property is an array
	And the "warnings" property contains at least:
		"""
		You havn't specified the API version in the Accept Header. The API version will be necessary in future releases.
		"""
