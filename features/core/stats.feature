Feature: stats
    In order to see the stats
    As a visitor

Scenario: Viewing the account stats
    Given I am an unauthorized user
    When I request "GET /stats/account"
    Then I get a "200" response
    And the correct headers are set
    And the "data" property exists
    And the "data" property is an object
    And scope into the "data" property
    And the response contains 4 items
    And the "type" property exists
    And the "type" property is a string equalling "stats"
    And the "id" property exists
    And the "id" property is a string equalling "account"
    And the "links" property exists
    And the "attributes" property exists
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
    And scope into the "data.links" property
    And the response contains 1 items
    And the properties exist:
        """
        self
        """

Scenario: Viewing the forum stats
    Given I am an unauthorized user
    When I request "GET /stats/forum"
    Then I get a "200" response
    And the correct headers are set
    And the "data" property exists
    And the "data" property is an object
    And scope into the "data" property
    And the response contains 4 items
    And the "type" property exists
    And the "type" property is a string equalling "stats"
    And the "id" property exists
    And the "id" property is a string equalling "forum"
    And the "links" property exists
    And the "attributes" property exists
    And scope into the "data.attributes" property
    And the response contains 3 items
    And the properties exist:
        """
        authors_total
        threads_total
        posts_total
        """
    And scope into the "data.links" property
    And the response contains 1 items
    And the properties exist:
        """
        self
        """

Scenario: Viewing the groups stats
    Given I am an unauthorized user
    When I request "GET /stats/groups"
    Then I get a "200" response
    And the correct headers are set
    And the "data" property exists
    And the "data" property is an object
    And scope into the "data" property
    And the response contains 4 items
    And the "type" property exists
    And the "type" property is a string equalling "stats"
    And the "id" property exists
    And the "id" property is a string equalling "groups"
    And the "links" property exists
    And the "attributes" property exists
    And scope into the "data.attributes" property
    And the response contains 2 items
    And the properties exist:
        """
        groups_total
        users_total
        """
    And scope into the "data.links" property
    And the response contains 1 items
    And the properties exist:
        """
        self
        """
