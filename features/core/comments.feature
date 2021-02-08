Feature: Interact with comments
    In order to request a comment or his relationships
    As a user

Scenario: Requesting a comment
    Given I am authorized as Alice
    When I request "GET /comments/345678"
    Then I get a "200" response
    And the correct headers are set
    And the "included" property exists
    And the "included" property is an array
    And the "meta" property exists
    And the "meta" property is an object
    And the "data" property exists
    And the "data" property is an object
    And scope into the "data" property
    And the response contains 5 items
    And the "type" property exists
    And the "type" property is a string equalling "comments"
    And the "id" property exists
    And the "links" property exists
    And the "attributes" property exists
    And scope into the "data.attributes" property
    And the response contains 2 items
    And the properties exist:
        """
        content
        created_at
        """
    And scope into the "data.links" property
    And the response contains 1 items
    And the properties exist:
        """
        self
        """
    And scope into the "meta" property
    And the "warnings" property exists
    And the "warnings" property is an array
    And the "warnings" property contains 1 items
    And the "warnings" property contains at least:
        """
        The default inclusion of "parent" and "author" relationships is deprecated since 0.18 and will be removed in future, use "?include=author,parent" in query instead.
        """

Scenario: Requesting the author of a comment
    Given I am authorized as Alice
    When I request "GET /comments/345678/author"
    Then I get a "200" response
    And the correct headers are set
    And the "data" property exists
    And the "data" property is an object
    And scope into the "data" property
    And the response contains 5 items
    And the "type" property exists
    And the "type" property is a string equalling "users"
    And the "id" property exists
    And the "id" property is a string
    And the "attributes" property exists
    And the "attributes" property is an object
    And the "links" property exists
    And the "links" property is an object
    And the "relationships" property exists
    And the "relationships" property is an object
    And scope into the "data.links" property
    And the response contains 1 items
    And the properties exist:
        """
        self
        """
    And scope into the "data.relationships" property
    And the response contains 1 items
    And the properties exist:
        """
        posts
        """

Scenario: Requesting the author relationship of a comment
    Given I am authorized as Alice
    When I request "GET /comments/345678/relationships/author"
    Then I get a "200" response
    And the correct headers are set
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

Scenario: Requesting the parent of a comment
    Given I am authorized as Alice
    When I request "GET /comments/345678/parent"
    Then I get a "200" response
    And the correct headers are set
    And the "data" property exists
    And the "data" property is an object
    And scope into the "data" property
    And the response contains at least 5 items
    And the "type" property exists
    And the "type" property is a string equalling "posts"
    And the "id" property exists
    And the "id" property is a string
    And the "attributes" property exists
    And the "attributes" property is an object
    And the "relationships" property exists
    And the "relationships" property is an object
    And the "links" property exists
    And the "links" property is an object
    And scope into the "data.links" property
    And the response contains 1 items
    And the properties exist:
        """
        self
        """

Scenario: Requesting the parent relationship of a comment
    Given I am authorized as Alice
    When I request "GET /comments/345678/relationships/parent"
    Then I get a "200" response
    And the correct headers are set
    And the "data" property exists
    And the "data" property is an object
    And scope into the "data" property
    And the response contains 2 items
    And the "type" property exists
    And the "type" property is a string equalling "posts"
    And the "id" property exists
    And the "id" property is a string
    And scope into the "links" property
    And the response contains 2 items
    And the properties exist:
        """
        self
        related
        """
