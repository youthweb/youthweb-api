Feature: Interact with a user
	In order to request a user or his relationsships
	As a user

Scenario: Requesting a user
	Given I have set the "Content-Type" header with "application/vnd.api+json"
	And I have set the "Accept" header with "application/vnd.api+json"
	And I have set the "Accept" header with "application/vnd.api+json; net.youthweb.api.version=0.11"
	And I have set the "Authorization" header with "Bearer valid_JWT"
	When I request "GET /users/123456"
	Then I get a "200" response
	And the "data" property exists
	And the "data" property is an object
	And scope into the "data" property
	And the response contains 4 items
	And the "type" property exists
	And the "type" property is a string equalling "users"
	And the "id" property exists
	And the "links" property exists
	And the "attributes" property exists
	And scope into the "data.attributes" property
	And the response contains 15 items
	And the properties exist:
		"""
		username
		first_name
		last_name
		email
		birthday
		created_at
		last_login
		zip
		city
		description_jesus
		description_job
		description_hobbies
		description_motto
		picture_thumb_url
		picture_url
		"""
	And scope into the "data.links" property
	And the response contains 1 items
	And the properties exist:
		"""
		self
		"""

Scenario: Requesting the posts from a users pinnwall
	Given I have set the "Content-Type" header with "application/vnd.api+json"
	And I have set the "Accept" header with "application/vnd.api+json"
	And I have set the "Accept" header with "application/vnd.api+json; net.youthweb.api.version=0.11"
	And I have set the "Authorization" header with "Bearer valid_JWT"
	When I request "GET /users/123456/posts"
	Then I get a "200" response
	And the "included" property exists
	And the "included" property is an array
	And the "data" property exists
	And the "data" property is an array
	And scope into the first "data" property
	And the response contains 5 items
	And the "type" property exists
	And the "type" property is a string equalling "posts"
	And the "id" property exists
	And the "attributes" property exists
	And the "attributes" property is an object
	And the "relationships" property exists
	And the "relationships" property is an object
	And the "links" property exists
	And the "links" property is an object

Scenario: Creating a post on an users pinnwall
	Given I have set the "Content-Type" header with "application/vnd.api+json"
	And I have set the "Accept" header with "application/vnd.api+json"
	And I have set the "Accept" header with "application/vnd.api+json; net.youthweb.api.version=0.11"
	And I have set the "Authorization" header with "Bearer valid_JWT"
	And I have the payload
		"""
		{"data":{"type":"posts","attributes":{"title":"The post title","content":"Lorem ipsum dolor sit amet, sed libris elaboraret eu.","view_allowed_for":"users","comments_allowed":true}}}
		"""
	When I request "POST /users/123456/posts"
	Then I get a "201" response
	And the Location Header exists
	And the "included" property exists
	And the "included" property is an array
	And the "data" property exists
	And the "data" property is an object
	And scope into the "data" property
	And the response contains 5 items
	And the "type" property exists
	And the "type" property is a string equalling "posts"
	And the "id" property exists
	And the "links" property exists
	And the "attributes" property exists
	And scope into the "data.attributes" property
	And the response contains 7 items
	And the properties exist:
		"""
		title
		content
		view_allowed_for
		comments_allowed
		comments_count
		created_at
		updated_at
		"""
	And scope into the "data.links" property
	And the response contains 1 items
	And the properties exist:
		"""
		self
		"""
