Feature: Request the authorized user
	In order to request the authorized user
	As a user

Scenario: Requesting the authorized user
	Given I have set the "Content-Type" header with "application/vnd.api+json"
	And I have set the "Accept" header with "application/vnd.api+json"
	And I have set the "Accept" header with "application/vnd.api+json; net.youthweb.api.version=0.13"
	And I have set the "Authorization" header with "Bearer valid_JWT"
	When I request "GET /me"
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
	And the response contains 24 items
	And the properties exist:
		"""
		username
		first_name
		last_name
		gender
		email
		birthday
		timezone
		created_at
		last_login
		zip
		city
		contact_homepage
		contact_twitter
		description_text
		description_character
		description_jesus
		description_job
		description_hobbies
		description_motto
		description_food
		description_links
		picture_thumb_url
		picture_url
		picture_description
		"""
	And scope into the "data.links" property
	And the response contains 1 items
	And the properties exist:
		"""
		self
		"""
