Feature: Request a user
	In order to request a user
	As a user

Scenario: Requesting a user
	Given I have set the "Content-Type" header with "application/vnd.api+json"
	And I have set the "Accept" header with "application/vnd.api+json"
	And I have set the "Accept" header with "application/vnd.api+json; net.youthweb.api.version=0.4"
	And I have set the "Authorization" header with "Bearer valid_JWT"
	When I request "GET /users/token"
	Then I get a "200" response
	And the "data" property exists
	And the "data" property is an object
	And scope into the "data" property
	And the "type" property exists
	And the "type" property is a string equalling "users"
	And the "id" property exists
	And the "attributes" property exists
	And scope into the "attributes" property
	And the response contains 1 items
	And the properties exist:
		"""
		username
		"""
