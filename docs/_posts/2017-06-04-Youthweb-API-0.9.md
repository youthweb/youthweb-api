---
title:  "Youthweb-API 0.9"
categories: API
tags: [api, release]
summary: "Die neue Version der Youthweb-API erlaubt jetzt das Erstellen von Posts-Resource."
---
## Changelog

### Neu

- Es ist jetzt möglich, Posts an den Pinnwände von User zu erstellen
- Es gibt einen neuen Scope `post:write`, um im Namen eines Users Posts an Pinnwänden erstellen zu dürfen. Dieser Scope beinhaltet auch `post:read`.

## Beispiele

### Einen Post an der Pinnwand eines Users erstellen

**Request**

```
POST https://api.youthweb.net/users/1/posts
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.9
Content-Type: application/vnd.api+json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE0NTgyMzE2MDAsImlzcyI6IkpOdlBnY3ROcEg1Y0s2UmMifQ.BOn0XFDDYa5iBHJb636A0C0m4sU5NO8SA_CPOVHoWNs

{
    "data": {
        "type": "posts",
        "attributes": {
            "title": "The optional post title",
            "content": "Lorem ipsum dolor sit amet, sed libris elaboraret eu.",
            "view_allowed_for": "users",
            "comments_allowed": true
        }
    }
}
```

**Response**

```
Status: 200 OK
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.9
Content-Type: application/vnd.api+json
Location: /posts/d5a5a2c3-041b-4985-907c-74a2131efc98

{
    "data": {
        "type": "posts",
        "id": "d5a5a2c3-041b-4985-907c-74a2131efc98",
        "attributes": {
            "title": "The post title",
            "content": "Lorem ipsum dolor sit amet, sed libris elaboraret eu.",
            "view_allowed_for": "users",
            "comments_allowed": true,
            "comments_count": 15,
            "created_at": "2016-01-01T21:00:00+01:00",
            "updated_at": "2016-02-11T17:13:05+01:00",
        },
        "relationships": {
            "author": {},
            "parent": {}
        },
        "links": {
            "self": "/posts/d5a5a2c3-041b-4985-907c-74a2131efc98"
        }
    },
    "included":
    [
        {
            "type": "users",
            "id": "1",
            "attributes": {},
            "links":
            {
                "self": "/users/123456"
            }
        }
    ]
}
```

{% include links.html %}
