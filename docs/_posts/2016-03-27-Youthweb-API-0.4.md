---
title:  "Youthweb-API 0.4"
categories: API
tags: [api, release]
---
## Änderungen

### Neu

- Neue geschützte Resource `users/{user_id}` für Details zu einem User
- Einführung von User-Token, um geschützte Resourcen anfragen zu können
- Fehler mit falschen Headern werden getestet
- Zeige eine Warnung im Response, wenn beim Request eine veraltete Versionsnummer angegeben wurde.

### Changed

- **Breaking:** Der Response liefert einen 415 Fehler, wenn der Header `Content-Type: application/vnd.api+json` nicht gesetzt wurde
- **Breaking:** Der Response liefert einen 406 Fehler, wenn der Header `Accept: application/vnd.api+json; net.youthweb.api.version=x.y` nicht gesetzt wurde
- **Breaking:** Der Response liefert einen 415 Fehler, wenn der Header `Accept: application/vnd.api+json; net.youthweb.api.version=x.y` mit einer veralteten Versionsnummer gesetzt wurde

### veraltet

- Die API-Version 0.3 ist veraltet, aber wird erstmal weiterhin unterstützt.

## Beispiele

### Beispiel 1: Die neue Users-Resource

Bei diesem Request werden die Daten zum User `123465` angefragt.

**Request**

```
GET https://youthweb.net/users/123456
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.4
Content-Type: application/vnd.api+json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE0NTgyMzE2MDAsImlzcyI6IkpOdlBnY3ROcEg1Y0s2UmMifQ.BOn0XFDDYa5iBHJb636A0C0m4sU5NO8SA_CPOVHoWNs
```

**Response**

```
Status: 200 OK
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.4
Content-Type: application/vnd.api+json

{
    "data": {
        "type": "users",
        "id": "123456",
        "attributes": {
            "username": "JohnSmith"
        }
    }
}
```

### Beispiel 2: Fehlender Content-Type Header

Bei diesem Request fehlt der `Content-Type` Header.

**Request**

```
GET https://youthweb.net/stats/account
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.4
```

**Response**

```
Status: 415 Unsupported Media Type
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.4
Content-Type: application/vnd.api+json

{
    "errors": [
        {
            "title": "Unsupported Media Type",
            "detail":"You're using an unsupported Content-Type. You have to use the Content-Type application/vnd.api+json"
        }
    ]
}
```

### Beispiel 3: Fehlender Accept Header

Bei diesem Request fehlt der `Accept` Header.

**Request**

```
GET https://youthweb.net/stats/account
Content-Type: application/vnd.api+json
```

**Response**

```
Status: 406 Not Acceptable
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.4
Content-Type: application/vnd.api+json

{
    "errors": [
        {
            "title": "Not Acceptable",
            "detail":"You havn't specified the the Accept Header. You have to use Accept application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.4"
        }
    ]
}
```

### Beispiel 4: Fehlende Version im Accept Header

Bei diesem Request fehlt die Version im `Accept` Header.

**Request**

```
GET https://youthweb.net/stats/account
Accept: application/vnd.api+json
Content-Type: application/vnd.api+json
```

**Response**

```
Status: 406 Not Acceptable
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.4
Content-Type: application/vnd.api+json

{
    "errors": [
        {
            "title": "Not Acceptable",
            "detail":"You havn't specified the API version in the Accept Header. You have to use Accept application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.4"
        }
    ]
}
```

### Beispiel 5: Nicht unterstütze Version im Accept Header

Bei diesem Request wurde die nicht mehr unterstützte Version 0.2 im `Accept` Header angegeben.

**Request**

```
GET https://youthweb.net/stats/account
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.2
Content-Type: application/vnd.api+json
```

**Response**

```
Status: 406 Not Acceptable
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.4
Content-Type: application/vnd.api+json

{
    "errors": [
        {
            "title": "Not Acceptable",
            "detail":"You have specified an unsupported API version. Please use the current API version 0.4"
        }
    ]
}
```

### Beispiel 6: Veraltete Version im Accept Header

Bei diesem Request wurde die veraltete (aber noch unterstützte) Version 0.3 im `Accept` Header angegeben.

**Request**

```
GET https://youthweb.net/users/123456
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.3
Content-Type: application/vnd.api+json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE0NTgyMzE2MDAsImlzcyI6IkpOdlBnY3ROcEg1Y0s2UmMifQ.BOn0XFDDYa5iBHJb636A0C0m4sU5NO8SA_CPOVHoWNs
```

**Response**

```
Status: 200 OK
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.4
Content-Type: application/vnd.api+json

{
    "data": {
        "type": "users",
        "id": "123456",
        "attributes": {
            "username": "JohnSmith"
        }
    },
    "meta": {
        "warnings": [
            "You have specified a deprecated API version. Please use the current API version 0.4"
        ]
    }
}
```

{% include links.html %}
