Feature: Interact with a post
    In order to update a post or his relationships
    As a user

Scenario: A user can update own posts
    Given an user named "Alice" with id "140001"
    And "Alice" owns a post with id "d5a5a2c3-041b-4985-907c-74a2131efc98"
    And I am authorized as Alice
    And I have the payload
        """
        {"data":{"type":"posts","id":"d5a5a2c3-041b-4985-907c-74a2131efc98","attributes":{"title":"The new post title","content":"New post content","reactions_given":[":+1:"]}}}
        """
    When I request "PATCH /posts/d5a5a2c3-041b-4985-907c-74a2131efc98"
    Then I get a "200" response
    And the correct headers are set
    And the "included" property exists
    And the "included" property is an array
    And the "data" property exists
    And the "data" property is an object
    And scope into the "data" property
    And the response contains at least 5 items
    And the "type" property exists
    And the "type" property is a string equalling "posts"
    And the "id" property exists
    And the "id" property is a string
    And the "links" property exists
    And the "attributes" property exists
    And scope into the "data.attributes" property
    And the response contains at least 10 items
    And the properties exist:
        """
        title
        content
        content_html
        view_allowed_for
        comments_allowed
        comments_count
        reactions_given
        reactions_count
        created_at
        updated_at
        """
    And the "title" property is a string equalling "The new post title"
    And the "content" property is a string equalling "New post content"
    And the "reactions_given" property is an array
    And the "reactions_count" property is an object
    And scope into the "data.links" property
    And the response contains 1 items
    And the properties exist:
        """
        self
        """
    And scope into the "data.relationships" property
    And the response contains at least 3 items
    And the properties exist:
        """
        author
        comments
        parent
        """

Scenario: A user can update the given reactions to posts of other users
    Given an user named "Alice" with id "140001"
    And "Alice" owns a post with id "d5a5a2c3-041b-4985-907c-74a2131efc98"
    And an user named "Bob" with id "140002"
    And I am authorized as Bob
    And I have the payload
        """
        {"data":{"type":"posts","id":"d5a5a2c3-041b-4985-907c-74a2131efc98","attributes":{"reactions_given":[":+1:"]}}}
        """
    When I request "PATCH /posts/d5a5a2c3-041b-4985-907c-74a2131efc98"
    Then I get a "200" response
    And the correct headers are set
    And the "included" property exists
    And the "included" property is an array
    And the "data" property exists
    And the "data" property is an object
    And scope into the "data" property
    And the response contains at least 5 items
    And the "type" property exists
    And the "type" property is a string equalling "posts"
    And the "id" property exists
    And the "id" property is a string
    And the "links" property exists
    And the "attributes" property exists
    And scope into the "data.attributes" property
    And the response contains at least 10 items
    And the properties exist:
        """
        title
        content
        content_html
        view_allowed_for
        comments_allowed
        comments_count
        reactions_given
        reactions_count
        created_at
        updated_at
        """
    And the "title" property is a string equalling "title"
    And the "content" property is a string equalling "post content"
    And the "reactions_given" property is an array
    And the "reactions_count" property is an object
    And scope into the "data.links" property
    And the response contains 1 items
    And the properties exist:
        """
        self
        """
    And scope into the "data.relationships" property
    And the response contains at least 3 items
    And the properties exist:
        """
        author
        comments
        parent
        """

Scenario: Updating a post without authorization is not possible
    Given an user named "Alice" with id "140001"
    And "Alice" owns a post with id "d5a5a2c3-041b-4985-907c-74a2131efc98"
    And I am an unauthorized user
    And I have the payload
        """
        {"data":{"type":"posts","id":"d5a5a2c3-041b-4985-907c-74a2131efc98","attributes":{"title":"The new post title","content":"New post content","reactions_given":[":+1:"]}}}
        """
    When I request "PATCH /posts/d5a5a2c3-041b-4985-907c-74a2131efc98"
    Then I get a "401" response
    And the correct headers are set
    And the "errors" property exists
    And the "errors" property is an array
    And scope into the first "errors" property
    And the "status" property exists
    And the "status" property is a string equalling "401"
    And the "title" property exists
    And the "title" property is a string equalling "Unauthorized"

Scenario: A user can not update posts of other users
    Given an user named "Alice" with id "140001"
    And "Alice" owns a post with id "d5a5a2c3-041b-4985-907c-74a2131efc98"
    And an user named "Bob" with id "140002"
    And I am authorized as Bob
    And I have the payload
        """
        {"data":{"type":"posts","id":"d5a5a2c3-041b-4985-907c-74a2131efc98","attributes":{"title":"The new post title","content":"New post content","reactions_given":[":+1:"]}}}
        """
    When I request "PATCH /posts/d5a5a2c3-041b-4985-907c-74a2131efc98"
    Then I get a "400" response
    And the correct headers are set
    And the "errors" property exists
    And the "errors" property is an array
    And the "errors" property contains 2 items
    And scope into the first "errors" property
    And the "status" property exists
    And the "status" property is a string equalling "409"
    And the "title" property exists
    And the "title" property is a string equalling "Request body has invalid attributes"
    And the "detail" property exists
    And the "detail" property is a string equalling "Matched a schema which it should not"
