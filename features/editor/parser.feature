Feature: Interact with the parser API
    In order to parse BBCode to HTML

Scenario: I can send BBCode and receive HTML
    Given I have set the "content-type" header with "json"
    Given I have the payload
        """
        {"data":{"content-type":"text/plain","content":"[b]Bold text[/b]"}}
        """
    When I request "POST /editor/parser?target=html"
    Then I get a "200" response
    And the Content-Type Header "json" exists
    And the "data" property exists
    And the "data" property is an object
    And scope into the "data" property
    And the response contains at least 2 items
    And the "content-type" property exists
    And the "content-type" property is a string equalling "text/html"
    And the "content" property exists
    And the "content" property is a string equalling "<p><b>Bold text</b></p>"

Scenario: I send the wrong content type header
    Given I have set the "content-type" header with "text/html"
    Given I have the payload
        """
        {"data":{"content-type":"text/plain","content":"[b]Bold text[/b]"}}
        """
    When I request "POST /editor/parser?target=html"
    Then I get a "404" response
    And the Content-Type Header "text/html; charset=utf-8" exists
