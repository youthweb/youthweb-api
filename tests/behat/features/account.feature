Feature: account
	In order to see the account stats
	As a visitor

Scenario: Viewing the stats
	When I request "GET /index.php?action=stats&cat=account"
	Then I get a "200" response
	And scope into the "data" property
	And scope into the "attributes" property
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
