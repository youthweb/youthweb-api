Feature: groups
	In order to see the groups stats
	As a visitor

Scenario: Viewing the stats
	When I request "GET /index.php?action=groups&cat=stats"
	Then I get a "200" response
	And the response contains 2 items
	And the properties exist:
		"""
		groups_total
		users_total
		"""
