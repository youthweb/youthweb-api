Feature: Index
	In order to use the API without a resource
	As a visitor

Scenario: Calling the BaseUrl
	Given I have set the Content-Type Header "application/vnd.api+json"
	When I request "GET /"
	Then I get a "404" response
	And the Content-Type Header "application/vnd.api+json" exists
	And the "errors" property exists
	And the "errors" property is an array
	And scope into the first "errors" property
	And the "status" property equals "404"
	And the "title" property equals "Resource not found"
