Feature: Interact with a timeline
    In order to request a timeline and the entries
    As a user

Background:
    Given an user named "Alice" with id "123456"
    And an user named "Bob" with id "234567"
    And "Alice" has posted a post with message "First post"
    And "Bob" has posted a post with message "Second post"
    And "Bob" has posted a post with message "Third post"
    And "Alice" has posted a post with message "Fourth post"
    And "Alice" has posted a post with message "Fifth post"

Scenario: Alice requests a timeline entries
    Given I am authorized as Alice
    When I request "GET /timeline-entries/d9a86276-6d12-462e-b63e-bf2d961e1678"
    Then I get a "200" response
    And the correct headers are set
    And the response contains at least 1 items
    And the "data" property exists
    And the "data" property is an object
    And scope into the "data" property
    And the response contains at least 4 items
    And the "type" property exists
    And the "type" property is a string equalling "timeline-entries"
    And the "id" property exists
    And the "id" property is a string
    And the "relationships" property exists
    And the "relationships" property is an object
    And the "links" property exists
    And the "links" property is an object
    And scope into the "data.relationships" property
    And the response contains 1 items
    And the "origin" property exists
    And the "origin" property is an object
    And scope into the "data.relationships.origin" property
    And the "data" property exists
    And the "data" property is an object
    And scope into the "data.relationships.origin.data" property
    And the "type" property exists
    And the "type" property is a string equalling "posts"
    And the "id" property exists
    And the "id" property is a string

Scenario: Requesting the orign of a timeline-entry
    Given I am authorized as Alice
    When I request "GET /timeline-entries/d9a86276-6d12-462e-b63e-bf2d961e1678/origin"
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
    And the "links" property exists
    And the "links" property is an object
    And the "relationships" property exists
    And the "relationships" property is an object
    And scope into the "data.links" property
    And the response contains 1 items
    And the "self" property exists

Scenario: Requesting the origin relationship of a timeline-entries
    Given I am authorized as Alice
    When I request "GET /timeline-entries/d9a86276-6d12-462e-b63e-bf2d961e1678/relationships/origin"
    Then I get a "200" response
    And the correct headers are set
    And the "data" property exists
    And the "data" property is an object
    And the "links" property exists
    And the "links" property is an object
    And scope into the "data" property
    And the response contains 2 items
    And the "type" property exists
    And the "type" property is a string equalling "posts"
    And the "id" property exists
    And the "id" property is a string
    And scope into the "links" property
    And the response contains 2 items
    And the "self" property exists
    And the "related" property exists
