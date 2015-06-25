Feature: _Tests
	In order to use the API
	As a visitor

Scenario: Using the API without Content-Type Json API Header
	When I request "GET /_tests/no_content_type_header"
	Then I get a "200" response
	And the Content-Type Header "application/vnd.api+json" exists
	And scope into the "meta" property
	And the "warnings" property is an array
	And the "warnings" property contains at least:
		"""
		You havn't specified the Header Content-Type: application/vnd.api+json
		"""
