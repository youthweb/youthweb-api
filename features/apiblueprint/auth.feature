Feature: Request a token
	In order to request a token
	As a visitor

Scenario: Requesting a token
	Given I have set the "Content-Type" header with "application/vnd.api+json"
	And I have set the "Accept" header with "application/vnd.api+json"
	And I have set the "Accept" header with "application/vnd.api+json; net.youthweb.api.version=0.13"
	And I have the payload
		"""
		{"meta":{"username":"JohnSmith","token_secret":"valid_token"}}
		"""
	When I request "POST /auth/token"
	Then I get a "200" response
	And the Content-Type Header "application/vnd.api+json" exists
	And scope into the "meta" property
	And the response contains 3 items
	And the properties exist:
		"""
		token
		token_type
		warnings
		"""
	And the "warnings" property is an array
	And the "warnings" property contains at least:
		"""
		The resource /auth/token is deprecated and will replaced with OAuth2 authorization. Please see http://developer.youthweb.net/api_general_oauth2.html
		"""
