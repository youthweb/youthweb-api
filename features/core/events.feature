Feature: Interact with an event
	In order to request a event or his relationships
	As a user

Scenario: Requesting the events without specific time range
	Given I have set the correct headers with valid authorization
	When I request "GET /events"
	Then I get a "200" response
	And the correct headers are set
	And the "included" property exists
	And the "included" property is an array
	And the "data" property exists
	And the "data" property is an array
	And scope into the first "data" property
	And the response contains 5 items
	And the "type" property exists
	And the "type" property is a string equalling "events"
	And the "id" property exists
	And the "attributes" property exists
	And the "attributes" property is an object
	And the "relationships" property exists
	And the "relationships" property is an object
	And the "links" property exists
	And the "links" property is an object

Scenario: Requesting a event
	Given I have set the correct headers with valid authorization
	When I request "GET /events/4567"
	Then I get a "200" response
	And the correct headers are set
	And the "included" property exists
	And the "included" property is an array
	And the "data" property exists
	And the "data" property is an object
	And scope into the "data" property
	And the response contains 5 items
	And the "type" property exists
	And the "type" property is a string equalling "events"
	And the "id" property exists
	And the "links" property exists
	And the "attributes" property exists
	And scope into the "data.attributes" property
	And the response contains 9 items
	And the properties exist:
		"""
		name
		content
		start_datetime
		end_datetime
		timezone
		address
		comments_allowed
		comments_count
		participants_count
		"""
	And scope into the "data.links" property
	And the response contains 1 items
	And the properties exist:
		"""
		self
		"""
	And scope into the "data.relationships" property
	And the response contains 1 items
	And the properties exist:
		"""
		author
		"""

Scenario: Requesting an event without authorization
	Given I have set the correct headers without authorization
	When I request "GET /events/4567"
	Then I get a "401" response
	And the correct headers are set
	And the "errors" property exists
	And the "errors" property is an array
	And scope into the first "errors" property
	And the "status" property exists
	And the "status" property is a string equalling "401"
	And the "title" property exists
	And the "title" property is a string equalling "Unauthorized"

Scenario: Requesting a not existing event
	Given I have set the correct headers with valid authorization
	When I request "GET /events/404"
	Then I get a "404" response
	And the correct headers are set
	And the "errors" property exists
	And the "errors" property is an array
	And scope into the first "errors" property
	And the "status" property exists
	And the "status" property is a string equalling "404"
	And the "title" property exists
	And the "title" property is a string equalling "Resource not found"

Scenario: Requesting the author of an event
	Given I have set the correct headers with valid authorization
	When I request "GET /events/4567/author"
	Then I get a "200" response
	And the correct headers are set
	And the "data" property exists
	And the "data" property is an object
	And scope into the "data" property
	And the response contains 5 items
	And the "type" property exists
	And the "type" property is a string equalling "users"
	And the "id" property exists
	And the "id" property is a string
	And the "attributes" property exists
	And the "attributes" property is an object
	And the "links" property exists
	And the "links" property is an object
	And the "relationships" property exists
	And the "relationships" property is an object
	And scope into the "data.links" property
	And the response contains 1 items
	And the properties exist:
		"""
		self
		"""
	And scope into the "data.relationships" property
	And the response contains 1 items
	And the properties exist:
		"""
		posts
		"""

Scenario: Requesting the author relationship of an event
	Given I have set the correct headers with valid authorization
	When I request "GET /events/4567/relationships/author"
	Then I get a "200" response
	And the correct headers are set
	And the "data" property exists
	And the "data" property is an object
	And the "links" property exists
	And the "links" property is an object
	And scope into the "data" property
	And the response contains 2 items
	And the "type" property exists
	And the "type" property is a string equalling "users"
	And the "id" property exists
	And the "id" property is a string
	And scope into the "links" property
	And the response contains 2 items
	And the properties exist:
		"""
		self
		related
		"""
