Feature: Error Tests
    In order to use the API
    As a visitor

Scenario: Calling the BaseUrl
    Given I have set the "Content-Type" header with "application/vnd.api+json"
    And I have set the "Accept" header with "application/vnd.api+json"
    And I have set the "Accept" header with "application/vnd.api+json; net.youthweb.api.version=0.15"
    When I request "GET /"
    Then I get a "404" response
    And the correct headers are set
    And the "errors" property exists
    And the "errors" property is an array
    And scope into the first "errors" property
    And the "status" property equals "404"
    And the "title" property equals "Resource not found"
