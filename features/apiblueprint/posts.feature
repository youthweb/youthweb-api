Feature: Request a post
	In order to request a post
	As a user

Scenario: Requesting a post
	Given I have set the "Content-Type" header with "application/vnd.api+json"
	And I have set the "Accept" header with "application/vnd.api+json"
	And I have set the "Accept" header with "application/vnd.api+json; net.youthweb.api.version=0.7"
	And I have set the "Authorization" header with "Bearer valid_JWT"
	When I request "GET /posts/d5a5a2c3-041b-4985-907c-74a2131efc98"
	Then I get a "200" response
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
	And the response contains 8 items
	And the properties exist:
		"""
		uuid
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
	And scope into the "data.relationships" property
	And the response contains 2 items
	And the properties exist:
		"""
		author
		parent
		"""
