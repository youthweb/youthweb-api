Feature: Interact with a friend
    In order to request a friend or his relationships
    As a user

Scenario: Requesting a friend
    Given Alice has set the correct headers
    When I request "GET /friends/45678"
    Then I get a "200" response
    And the correct headers are set
    And the "included" property exists
    And the "included" property is an array
    And the "data" property exists
    And the "data" property is an object
    And scope into the "data" property
    And the response contains 5 items
    And the "type" property exists
    And the "type" property is a string equalling "friends"
    And the "id" property exists
    And the "links" property exists
    And the "attributes" property exists
    And scope into the "data.attributes" property
    And the response contains 1 items
    And the properties exist:
        """
        description
        """
    And scope into the "data.relationships" property
    And the response contains 2 items
    And the properties exist:
        """
        from
        to
        """
    And scope into the "data.links" property
    And the response contains 1 items
    And the properties exist:
        """
        self
        """

Scenario: Requesting a friend without authorization
    Given an unauthorized user has set the correct headers
    When I request "GET /friends/45678"
    Then I get a "401" response
    And the correct headers are set
    And the "errors" property exists
    And the "errors" property is an array
    And scope into the first "errors" property
    And the "status" property exists
    And the "status" property is a string equalling "401"
    And the "title" property exists
    And the "title" property is a string equalling "Unauthorized"

Scenario: Requesting a not existing friend
    Given Alice has set the correct headers
    When I request "GET /friends/404"
    Then I get a "404" response
    And the correct headers are set
    And the "errors" property exists
    And the "errors" property is an array
    And scope into the first "errors" property
    And the "status" property exists
    And the "status" property is a string equalling "404"
    And the "title" property exists
    And the "title" property is a string equalling "Resource not found"

Scenario: Requesting the from-user of a friend
    Given Alice has set the correct headers
    When I request "GET /friends/45678/from"
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

Scenario: Requesting the from-user relationship of a friend
    Given Alice has set the correct headers
    When I request "GET /friends/45678/relationships/from"
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

Scenario: Requesting the to-user of a friend
    Given Alice has set the correct headers
    When I request "GET /friends/45678/to"
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

Scenario: Requesting the to-user relationship of a friend
    Given Alice has set the correct headers
    When I request "GET /friends/45678/relationships/to"
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
