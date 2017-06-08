Feature: Interact with an event
	In order to request a event or his relationships
	As a user

Scenario: Requesting a event
	Given I have set the "Content-Type" header with "application/vnd.api+json"
	And I have set the "Accept" header with "application/vnd.api+json"
	And I have set the "Accept" header with "application/vnd.api+json; net.youthweb.api.version=0.10"
	And I have set the "Authorization" header with "Bearer valid_JWT"
	When I request "GET /events/4567"
	Then I get a "200" response
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
	And the response contains 8 items
	And the properties exist:
		"""
		name
		content
		start_datetime
		end_datetime
		timezone
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

Scenario: Requesting the author of an event
	Given I have set the "Content-Type" header with "application/vnd.api+json"
	And I have set the "Accept" header with "application/vnd.api+json"
	And I have set the "Accept" header with "application/vnd.api+json; net.youthweb.api.version=0.10"
	And I have set the "Authorization" header with "Bearer valid_JWT"
	When I request "GET /events/4567/author"
	Then I get a "200" response
	And the "data" property exists
	And the "data" property is an object
	And scope into the "data" property
	And the response contains 4 items
	And the "type" property exists
	And the "type" property is a string equalling "users"
	And the "id" property exists
	And the "id" property is a string
	And the "attributes" property exists
	And the "attributes" property is an object
	And the "links" property exists
	And the "links" property is an object
	And scope into the "data.links" property
	And the response contains 1 items
	And the properties exist:
		"""
		self
		"""

Scenario: Requesting the author relationship of an event
	Given I have set the "Content-Type" header with "application/vnd.api+json"
	And I have set the "Accept" header with "application/vnd.api+json"
	And I have set the "Accept" header with "application/vnd.api+json; net.youthweb.api.version=0.10"
	And I have set the "Authorization" header with "Bearer valid_JWT"
	When I request "GET /events/4567/relationships/author"
	Then I get a "200" response
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
