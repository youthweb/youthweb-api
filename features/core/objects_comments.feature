Feature: Interact with the comments of an object
	In order to request the comments of an object
	As a user

Scenario: Requesting the comments from a post
	Given I have set the correct headers with valid authorization
	When I request "GET /posts/d5a5a2c3-041b-4985-907c-74a2131efc98/comments"
	Then I get a "200" response
	And the "included" property exists
	And the "included" property is an array
	And the "data" property exists
	And the "data" property is an array
	And scope into the first "data" property
	And the response contains 5 items
	And the "type" property exists
	And the "type" property is a string equalling "comments"
	And the "id" property exists
	And the "attributes" property exists
	And the "attributes" property is an object
	And the "relationships" property exists
	And the "relationships" property is an object
	And the "links" property exists
	And the "links" property is an object

Scenario: Requesting the comments relationships from a post
	Given I have set the correct headers with valid authorization
	When I request "GET /posts/d5a5a2c3-041b-4985-907c-74a2131efc98/relationships/comments"
	Then I get a "200" response
	And the "data" property exists
	And the "data" property is an array
	And scope into the first "data" property
	And the response contains 2 items
	And the "type" property exists
	And the "type" property is a string equalling "comments"
	And the "id" property exists

Scenario: Requesting comments from a not existing post
	Given I have set the correct headers with valid authorization
	When I request "GET /posts/45a5a2c3-041b-4985-907c-74a2131efc98/comments"
	Then I get a "404" response
	And the Content-Type Header "application/vnd.api+json" exists
	And the Accept Header "application/vnd.api+json; net.youthweb.api.version=0.14" exists
	And the "errors" property exists
	And the "errors" property is an array
	And scope into the first "errors" property
	And the "status" property exists
	And the "status" property is a string equalling "404"
	And the "title" property exists
	And the "title" property is a string equalling "Resource not found"
