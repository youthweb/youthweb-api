Feature: Index
	In order to use the API without a resource
	As a visitor

Scenario: Calling the BaseUrl
	Given I have set the "Content-Type" header with "application/vnd.api+json"
	And I have set the "Accept" header with "application/vnd.api+json"
	And I have set the "Accept" header with "application/vnd.api+json; net.youthweb.api.version=0.11"
	When I request "GET /"
	Then I get a "404" response
	And the Content-Type Header "application/vnd.api+json" exists
	And the "errors" property exists
	And the "errors" property is an array
	And scope into the first "errors" property
	And the "status" property equals "404"
	And the "title" property equals "Resource not found"

Scenario: Sending a request with invalid JSON API
	Given I have set the "Content-Type" header with "application/vnd.api+json"
	And I have set the "Accept" header with "application/vnd.api+json"
	And I have set the "Accept" header with "application/vnd.api+json; net.youthweb.api.version=0.11"
	And I have set the "Authorization" header with "Bearer valid_JWT"
	And I have the payload
		"""
		{"data":{"type":"posts","attributes":{"content":"Lorem ipsum dolor sit amet, sed libris elaboraret eu."}},"errors":[{"detail":"The members data and errors MUST NOT coexist in the same document."}]}
		"""
	When I request "POST /users/187654/posts"
	Then I get a "400" response
	And the Content-Type Header "application/vnd.api+json" exists
	And the Accept Header "application/vnd.api+json; net.youthweb.api.version=0.11" exists
	And the "errors" property exists
	And the "errors" property is an array
	And scope into the first "errors" property
	And the "status" property exists
	And the "status" property is a string equalling "400"
	And the "title" property exists
	And the "title" property is a string equalling "Bad Request"
	And the "detail" property exists
	And the "detail" property is a string equalling "Your request format must be valid JSON API. The properties `data` and `errors` MUST NOT coexist in Document."
