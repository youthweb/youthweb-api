Feature: stats
	In order to see the stats
	As a visitor

Scenario: Viewing the account stats
	Given I have set the "Content-Type" header with "application/vnd.api+json"
	And I have set the "Accept" header with "application/vnd.api+json"
	And I have set the "Accept" header with "application/vnd.api+json; net.youthweb.api.version=0.4"
	When I request "GET /stats/account"
	Then I get a "200" response
	And the Content-Type Header "application/vnd.api+json" exists
	And scope into the "data.attributes" property
	And the response contains 8 items
	And the properties exist:
		"""
		user_total
		user_total_female
		user_total_male
		user_online
		user_online_24h
		user_online_7d
		user_online_30d
		userpics
		"""

Scenario: Viewing the forum stats
	Given I have set the "Content-Type" header with "application/vnd.api+json"
	And I have set the "Accept" header with "application/vnd.api+json"
	And I have set the "Accept" header with "application/vnd.api+json; net.youthweb.api.version=0.4"
	When I request "GET /stats/forum"
	Then I get a "200" response
	And the Content-Type Header "application/vnd.api+json" exists
	And scope into the "data.attributes" property
	And the response contains 3 items
	And the properties exist:
		"""
		authors_total
		threads_total
		posts_total
		"""

Scenario: Viewing the groups stats
	Given I have set the "Content-Type" header with "application/vnd.api+json"
	And I have set the "Accept" header with "application/vnd.api+json"
	And I have set the "Accept" header with "application/vnd.api+json; net.youthweb.api.version=0.4"
	When I request "GET /stats/groups"
	Then I get a "200" response
	And the Content-Type Header "application/vnd.api+json" exists
	And scope into the "data.attributes" property
	And the response contains 2 items
	And the properties exist:
		"""
		groups_total
		users_total
		"""
