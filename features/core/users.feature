Feature: Interact with a user
    In order to request a user or his relationships
    As a user

Scenario: Requesting a user
    Given I am authorized as Alice
    When I request "GET /users/123456"
    Then I get a "200" response
    And the correct headers are set
    And the "data" property exists
    And the "data" property is an object
    And scope into the "data" property
    And the response contains 5 items
    And the "type" property exists
    And the "type" property is a string equalling "users"
    And the "id" property exists
    And the "attributes" property exists
    And the "links" property exists
    And the "relationships" property exists
    And scope into the "data.attributes" property
    And the response contains 24 items
    And the properties exist:
        """
        username
        first_name
        last_name
        gender
        email
        birthday
        timezone
        created_at
        last_login
        zip
        city
        contact_homepage
        contact_twitter
        description_text
        description_character
        description_jesus
        description_job
        description_hobbies
        description_motto
        description_food
        description_links
        picture_thumb_url
        picture_url
        picture_description
        """
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

Scenario: Requesting the friends of a user
    Given I am authorized as Alice
    When I request "GET /users/123456/friends"
    Then I get a "200" response
    And the correct headers are set
    And the "included" property exists
    And the "included" property is an array
    And the "data" property exists
    And the "data" property is an array
    And scope into the first "data" property
    And the response contains 5 items
    And the "type" property exists
    And the "type" property is a string equalling "friends"
    And the "id" property exists
    And the "attributes" property exists
    And the "attributes" property is an object
    And the "relationships" property exists
    And the "relationships" property is an object
    And the "links" property exists
    And the "links" property is an object
