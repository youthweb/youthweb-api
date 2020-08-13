Feature: Interact with a timeline
    In order to request a timeline and the entries
    As a user

Scenario: Alice requests her global timeline entries
    Given an user named "Alice" with id "140001"
    And an user named "Bob" with id "140002"
    And "Alice" owns a post with id "d5a5a2c3-041b-4985-907c-74a2131efc98"
    And the post is related to a timeline entry with id "d9a86276-6d12-462e-b63e-bf2d961e1678"
    And "Bob" owns a post with id "43deeeb0-71b7-4d4d-9dc6-cc7cb73173e0"
    And the post is related to a timeline entry with id "b66bf520-e071-4ba7-ba83-f36558486713"
    And "Bob" owns a post with id "c1ef5dda-e2ec-48da-b7ee-ac94250dbc79"
    And the post is related to a timeline entry with id "a9d43863-f65f-4517-9d14-bf8ac563e743"
    And the post can be viewed by "authors"
    And I am authorized as Alice
    When I request "GET /timeline-entries"
    Then I get a "200" response
    And the correct headers are set
    And the response contains at least 2 items
    And the "links" property exists
    And the "links" property is an object
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
    Given an user named "Alice" with id "140001"
    And "Alice" owns a post with id "d5a5a2c3-041b-4985-907c-74a2131efc98"
    And the post is related to a timeline entry with id "d9a86276-6d12-462e-b63e-bf2d961e1678"
    And "Alice" owns a post with id "75b3bbdf-61e9-4571-a48d-e1e4bc6a2ea5"
    And the post is related to a timeline entry with id "a50f4315-02e4-4907-b269-e280582d32d7"
    And I am authorized as Alice
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
