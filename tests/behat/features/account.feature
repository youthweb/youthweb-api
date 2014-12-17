Feature: account
	In order to see the account stats
	As a visitor

Scenario: Viewing the stats
	When I request "GET /index.php?action=account&cat=stats"
	Then I get a "200" response
	And the response contains 2 items
	And the properties exist:
		"""
		user_total
		user_online
		"""
