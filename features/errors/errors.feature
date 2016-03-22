Feature: Error Tests
	In order to use the API
	As a visitor

Scenario: Using the API without Content-Type Json API Header
	Given I have set the "Accept" header with "application/vnd.api+json"
	And I have set the "Accept" header with "application/vnd.api+json; net.youthweb.api.version=0.4"
	When I request "GET /stats/account"
	Then I get a "415" response
	And the Content-Type Header "application/vnd.api+json" exists
	And the Accept Header "application/vnd.api+json; net.youthweb.api.version=0.4" exists
	And the "errors" property exists
	And the "errors" property is an array
	And scope into the first "errors" property
	And the "title" property exists
	And the "title" property is a string equalling "Unsupported Media Type"
	And the "detail" property exists
	And the "detail" property is a string equalling "You're using an unsupported Content-Type. You have to use the Content-Type application/vnd.api+json"

Scenario: Using the API with Content-Type Json API Header and parameter
	Given I have set the "Accept" header with "application/vnd.api+json"
	And I have set the "Accept" header with "application/vnd.api+json; net.youthweb.api.version=0.4"
	And I have set the "Content-Type" header with "application/vnd.api+json; parameter=value"
	When I request "GET /stats/account"
	Then I get a "415" response
	And the Content-Type Header "application/vnd.api+json" exists
	And the Accept Header "application/vnd.api+json; net.youthweb.api.version=0.4" exists
	And the "errors" property exists
	And the "errors" property is an array
	And scope into the first "errors" property
	And the "title" property exists
	And the "title" property is a string equalling "Unsupported Media Type"
	And the "detail" property exists
	And the "detail" property is a string equalling "You're using an unsupported Content-Type. You have to use the Content-Type application/vnd.api+json"

Scenario: Using the API without Accept Header
	Given I have set the "Content-Type" header with "application/vnd.api+json"
	When I request "GET /stats/account"
	Then I get a "406" response
	And the Content-Type Header "application/vnd.api+json" exists
	And the Accept Header "application/vnd.api+json; net.youthweb.api.version=0.4" exists
	And the "errors" property exists
	And the "errors" property is an array
	And scope into the first "errors" property
	And the "title" property exists
	And the "title" property is a string equalling "Not Acceptable"
	And the "detail" property exists
	And the "detail" property is a string equalling "You havn't specified the API version in the Accept Header. You have to use Accept application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.4"

Scenario: Using the API with Accept Header without version parameter
	Given I have set the "Content-Type" header with "application/vnd.api+json"
	And I have set the "Accept" header with "application/vnd.api+json"
	When I request "GET /stats/account"
	Then I get a "406" response
	And the Content-Type Header "application/vnd.api+json" exists
	And the Accept Header "application/vnd.api+json; net.youthweb.api.version=0.4" exists
	And the "errors" property exists
	And the "errors" property is an array
	And scope into the first "errors" property
	And the "title" property exists
	And the "title" property is a string equalling "Not Acceptable"
	And the "detail" property exists
	And the "detail" property is a string equalling "You havn't specified the API version in the Accept Header. You have to use Accept application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.4"

Scenario: Using the API with deprecated version parameter
	Given I have set the "Content-Type" header with "application/vnd.api+json"
	And I have set the "Accept" header with "application/vnd.api+json"
	And I have set the "Accept" header with "application/vnd.api+json; net.youthweb.api.version=0.3"
	When I request "GET /stats/account"
	Then I get a "200" response
	And the Content-Type Header "application/vnd.api+json" exists
	And the Accept Header "application/vnd.api+json; net.youthweb.api.version=0.4" exists
	And the "meta.warnings" property exists
	And the "meta.warnings" property is an array
	And the "meta.warning.0" property is a string equalling "You have specified a deprecated API version. Please use the current API version"
