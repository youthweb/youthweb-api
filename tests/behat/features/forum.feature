Feature: forum
	In order to see the forum stats
	As a visitor

Scenario: Viewing the stats
	When I request "GET /index.php?action=stats&cat=forum"
	Then I get a "200" response
	And scope into the "data.attributes" property
	And the response contains 3 items
	And the properties exist:
		"""
		authors_total
		threads_total
		posts_total
		"""
