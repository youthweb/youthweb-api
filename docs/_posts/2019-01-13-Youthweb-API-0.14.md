---
title:  "Youthweb-API 0.14 erlaubt das Erstellen von Kommentarn zu Posts"
categories: API
tags: [api, release]
summary: "Die neue Version der Youthweb-API erlaubt jetzt das Erstellen von Comments-Resourcen zu Posts-Resource."
---
## Changelog

### Neu

- Es ist jetzt möglich, [Kommentare zu einem Post zu erstellen](https://developer.youthweb.net/api_endpoint_object_comments.html#create)

## Beispiele

### Einen Kommentar zu einem Post erstellen

**Request**

```
POST https://api.youthweb.net/posts/d5a5a2c3-041b-4985-907c-74a2131efc98/comments
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.14
Content-Type: application/vnd.api+json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE0NTgyMzE2MDAsImlzcyI6IkpOdlBnY3ROcEg1Y0s2UmMifQ.BOn0XFDDYa5iBHJb636A0C0m4sU5NO8SA_CPOVHoWNs

{
    "data": {
        "type": "comments",
        "attributes": {
            "content": "Lorem ipsum dolor sit amet, sed libris elaboraret eu.",
        }
    }
}
```

**Response**

```
Status: 201 Created
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.14
Content-Type: application/vnd.api+json
Location: /comments/d5a5a2c3-041b-4985-907c-74a2131efc98

{
    "data":
    {
        "type": "comments",
        "id": "345678",
        "attributes": {
            "content": "Lorem ipsum dolor sit amet, sed libris elaboraret eu.",
            "created_at": "2019-01-01T20:00:00+00:00",
        },
        "relationships": {
            "author":
            {
                "links":
                {
                    "self": "/comments/345678/relationships/author",
                    "related": "/comments/345678/author"
                },
                "data":
                {
                    "type": "users",
                    "id": "1"
                }
            },
            "parent":
            {
                "links":
                {
                    "self": "/comments/345678/relationships/parent",
                    "related": "/comments/345678/parent"
                },
                "data":
                {
                    "type": "posts",
                    "id": "d5a5a2c3-041b-4985-907c-74a2131efc98"
                }
            }
        },
        "links": {
            "self": "/comments/345678"
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
        },
        {
            "type": "posts",
            "id": "d5a5a2c3-041b-4985-907c-74a2131efc98",
            "attributes": {},
            "links":
            {
                "self": "/posts/d5a5a2c3-041b-4985-907c-74a2131efc98"
            }
        }
    ],
    "links":
    {
        "self": "/posts/d5a5a2c3-041b-4985-907c-74a2131efc98/comments"
    }
}
```

{% include links.html %}
