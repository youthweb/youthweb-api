Feature: Post Error Tests
	In order to use the posts endpoint
	As a visitor

Scenario: Requesting a post without permission
	Given I have set the "Content-Type" header with "application/vnd.api+json"
	And I have set the "Accept" header with "application/vnd.api+json"
	And I have set the "Accept" header with "application/vnd.api+json; net.youthweb.api.version=0.9"
	And I have set the "Authorization" header with "Bearer valid_JWT"
	When I request "GET /posts/f5a5a2c3-041b-4985-907c-74a2131efc98"
	Then I get a "403" response
	And the Content-Type Header "application/vnd.api+json" exists
	And the Accept Header "application/vnd.api+json; net.youthweb.api.version=0.9" exists
	And the "errors" property exists
	And the "errors" property is an array
	And scope into the first "errors" property
	And the "status" property exists
	And the "status" property is a string equalling "403"
	And the "title" property exists
	And the "title" property is a string equalling "Forbidden"

Scenario: Requesting a not existing post
	Given I have set the "Content-Type" header with "application/vnd.api+json"
	And I have set the "Accept" header with "application/vnd.api+json"
	And I have set the "Accept" header with "application/vnd.api+json; net.youthweb.api.version=0.9"
	And I have set the "Authorization" header with "Bearer valid_JWT"
	When I request "GET /posts/45a5a2c3-041b-4985-907c-74a2131efc98"
	Then I get a "404" response
	And the Content-Type Header "application/vnd.api+json" exists
	And the Accept Header "application/vnd.api+json; net.youthweb.api.version=0.9" exists
	And the "errors" property exists
	And the "errors" property is an array
	And scope into the first "errors" property
	And the "status" property exists
	And the "status" property is a string equalling "404"
	And the "title" property exists
	And the "title" property is a string equalling "Resource not found"
