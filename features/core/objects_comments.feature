Feature: Interact with the comments of an object
	In order to request the comments of an object
	As a user

Scenario: Requesting the comments from a post
	Given I have set the correct headers with valid authorization
	When I request "GET /posts/d5a5a2c3-041b-4985-907c-74a2131efc98/comments"
	Then I get a "200" response
	And the correct headers are set
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

Scenario: Requesting the comments from a post without comments
	Given I have set the correct headers with valid authorization
	When I request "GET /posts/0ca5a2c3-041b-4985-907c-74a2131efc98/comments"
	Then I get a "200" response
	And the correct headers are set
	And the "data" property exists
	And the "data" property is an empty array

Scenario: Requesting the comments relationships from a post
	Given I have set the correct headers with valid authorization
	When I request "GET /posts/d5a5a2c3-041b-4985-907c-74a2131efc98/relationships/comments"
	Then I get a "200" response
	And the correct headers are set
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
	And the correct headers are set
	And the "errors" property exists
	And the "errors" property is an array
	And scope into the first "errors" property
	And the "status" property exists
	And the "status" property is a string equalling "404"
	And the "title" property exists
	And the "title" property is a string equalling "Resource not found"

Scenario: Creating a comment on a post
	Given I have set the correct headers with valid authorization
	And I have the payload
		"""
		{"data":{"type":"comments","attributes":{"content":"Lorem ipsum dolor sit amet, sed libris elaboraret eu."}}}
		"""
	When I request "POST /posts/d5a5a2c3-041b-4985-907c-74a2131efc98/comments"
	Then I get a "201" response
	And the correct headers are set
	And the Location Header exists
	And the "included" property exists
	And the "included" property is an array
	And the "data" property exists
	And the "data" property is an object
	And scope into the "data" property
	And the response contains 5 items
	And the "type" property exists
	And the "type" property is a string equalling "comments"
	And the "id" property exists
	And the "links" property exists
	And the "attributes" property exists
	And scope into the "data.attributes" property
	And the response contains 2 items
	And the properties exist:
		"""
		content
		created_at
		"""
	And scope into the "data.links" property
	And the response contains 1 items
	And the properties exist:
		"""
		self
		"""

Scenario: Create a comment on a not existing post
	Given I have set the correct headers with valid authorization
	And I have the payload
		"""
		{"data":{"type":"comments","attributes":{"content":"Lorem ipsum dolor sit amet, sed libris elaboraret eu."}}}
		"""
	When I request "POST /posts/45a5a2c3-041b-4985-907c-74a2131efc98/comments"
	Then I get a "404" response
	And the correct headers are set
	And the "errors" property exists
	And the "errors" property is an array
	And scope into the first "errors" property
	And the "status" property exists
	And the "status" property is a string equalling "404"
	And the "title" property exists
	And the "title" property is a string equalling "Resource not found"

Scenario: Create a comment without permission
	Given I have set the correct headers with valid authorization
	And I have the payload
		"""
		{"data":{"type":"comments","attributes":{"content":"Lorem ipsum dolor sit amet, sed libris elaboraret eu."}}}
		"""
	When I request "POST /posts/f5a5a2c3-041b-4985-907c-74a2131efc98/comments"
	Then I get a "403" response
	And the correct headers are set
	And the "errors" property exists
	And the "errors" property is an array
	And scope into the first "errors" property
	And the "status" property exists
	And the "status" property is a string equalling "403"
	And the "title" property exists
	And the "title" property is a string equalling "Forbidden"

Scenario: Create a comment with empty content
	Given I have set the correct headers with valid authorization
	And I have the payload
		"""
		{"data":{"type":"comments","attributes":{"content":""}}}
		"""
	When I request "POST /posts/d5a5a2c3-041b-4985-907c-74a2131efc98/comments"
	Then I get a "400" response
	And the correct headers are set
	And the "errors" property exists
	And the "errors" property is an array
	And scope into the first "errors" property
	And the "status" property exists
	And the "status" property is a string equalling "422"
	And the "title" property exists
	And the "title" property is a string equalling "Unprocessable Entity"
	And the "detail" property exists
	And the "detail" property is a string equalling "The field `attributes.content` can't be empty."

Scenario: Create a comment with missing content
	Given I have set the correct headers with valid authorization
	And I have the payload
		"""
		{"data":{"type":"comments","attributes":{}}}
		"""
	When I request "POST /posts/d5a5a2c3-041b-4985-907c-74a2131efc98/comments"
	Then I get a "400" response
	And the correct headers are set
	And the "errors" property exists
	And the "errors" property is an array
	And scope into the first "errors" property
	And the "status" property exists
	And the "status" property is a string equalling "422"
	And the "title" property exists
	And the "title" property is a string equalling "Unprocessable Entity"
	And the "detail" property exists
	And the "detail" property is a string equalling "The field `attributes.content` must be set."
