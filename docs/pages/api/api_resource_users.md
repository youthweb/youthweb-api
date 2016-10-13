---
title: Users Resource
keywords: Youthweb-API, Resource, Users
tags: [getting_started]
summary: "Die Users Resource"
sidebar: api_sidebar
permalink: api_resource_users.html
folder: api
---

## Beispiele

### Beispiel 1: Daten zu User-ID 123456 anfragen

**Request**

```
GET https://api.youthweb.net/users/123456
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.6
Content-Type: application/vnd.api+json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE0NTgyMzE2MDAsImlzcyI6IkpOdlBnY3ROcEg1Y0s2UmMifQ.BOn0XFDDYa5iBHJb636A0C0m4sU5NO8SA_CPOVHoWNs
```

**Response**

```
Status: 200 OK
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.6
Content-Type: application/vnd.api+json

{
    "data": {
        "type": "users",
        "id": "123456",
        "attributes": {
            "username": "JohnSmith",
            "first_name": "John",
            "last_name": "Smith",
            "email": "john_smith@example.org",
            "birthday": "1988-03-05",
            "created_at": "2006-01-01T21:00:00+01:00",
            "last_login": "2016-01-01T22:00:00+02:00",
            "zip": "12345",
            "city": "Jamestown",
            "description_jesus": "Lorem ipsum dolor sit amet",
            "description_job": "Lorem ipsum dolor sit amet",
            "description_hobbies": "Lorem ipsum dolor sit amet",
            "description_motto": "Lorem ipsum dolor sit amet",
            "picture_thumb_url": "https://youthweb.net/img/steckbriefe/default_pic_m.jpg",
            "picture_url": "https://youthweb.net/img/steckbriefe/default_pic_m.jpg"
        }
    }
}
```

### Beispiel 2: Daten zum autorisierten User anfragen

Fragt die Userdaten des autorisierten Users ab. Dies ist ein Shortcut für /users/{user_id}, wenn die User-ID des autorisierten Users nicht bekannt ist.

**Request**

```
GET https://api.youthweb.net/users/123456
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.6
Content-Type: application/vnd.api+json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE0NTgyMzE2MDAsImlzcyI6IkpOdlBnY3ROcEg1Y0s2UmMifQ.BOn0XFDDYa5iBHJb636A0C0m4sU5NO8SA_CPOVHoWNs
```

**Response**

```
Status: 200 OK
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.6
Content-Type: application/vnd.api+json

{
    "data": {
        "type": "users",
        "id": "123456",
        "attributes": {
            "username": "JohnSmith",
            "first_name": "John",
            "last_name": "Smith",
            "email": "john_smith@example.org",
            "birthday": "1988-03-05",
            "created_at": "2006-01-01T21:00:00+01:00",
            "last_login": "2016-01-01T22:00:00+02:00",
            "zip": "12345",
            "city": "Jamestown",
            "description_jesus": "Lorem ipsum dolor sit amet",
            "description_job": "Lorem ipsum dolor sit amet",
            "description_hobbies": "Lorem ipsum dolor sit amet",
            "description_motto": "Lorem ipsum dolor sit amet",
            "picture_thumb_url": "https://youthweb.net/img/steckbriefe/default_pic_m.jpg",
            "picture_url": "https://youthweb.net/img/steckbriefe/default_pic_m.jpg"
        }
    }
}
```

{% include links.html %}
