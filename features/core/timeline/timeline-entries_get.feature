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

Scenario: Alice requests her global timeline entries
    Given I am authorized as Alice
    When I request "GET /timeline-entries?page[limit]=2"
    Then I get a "200" response
    And the correct headers are set
    And the response contains at least 1 items
    And the "data" property exists
    And the "data" property is an array
    And the "data" property contains 2 items
    And scope into the first "data" property
    And the response contains at least 4 items
    And the "type" property exists
    And the "type" property is a string equalling "timeline-entries"
    And the "id" property exists
    And the "id" property is a string
    And the "relationships" property exists
    And the "relationships" property is an object
    And the "links" property exists
    And the "links" property is an object
    And scope into the "data.0.relationships" property
    And the response contains 1 items
    And the "origin" property exists
    And the "origin" property is an object
    And scope into the "data.0.relationships.origin" property
    And the "data" property exists
    And the "data" property is an object
    And scope into the "data.0.relationships.origin.data" property
    And the "type" property exists
    And the "type" property is a string equalling "posts"
    And the "id" property exists
    And the "id" property is a string

Scenario: Alice requests her own timeline entries
    Given I am authorized as Alice
    When I request "GET /users/123456/timeline-entries?page[limit]=2"
    Then I get a "200" response
    And the correct headers are set
    And the response contains at least 1 items
    And the "data" property exists
    And the "data" property is an array
    And the "data" property contains 2 items
    And scope into the first "data" property
    And the response contains at least 4 items
    And the "type" property exists
    And the "type" property is a string equalling "timeline-entries"
    And the "id" property exists
    And the "id" property is a string
    And the "relationships" property exists
    And the "relationships" property is an object
    And the "links" property exists
    And the "links" property is an object
    And scope into the "data.0.relationships" property
    And the response contains 1 items
    And the "origin" property exists
    And the "origin" property is an object
    And scope into the "data.0.relationships.origin" property
    And the "data" property exists
    And the "data" property is an object
    And scope into the "data.0.relationships.origin.data" property
    And the "type" property exists
    And the "type" property is a string equalling "posts"
    And the "id" property exists
    And the "id" property is a string
