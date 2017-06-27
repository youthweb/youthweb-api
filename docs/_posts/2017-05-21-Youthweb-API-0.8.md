---
title:  "Youthweb-API 0.8 liefert Daten zu Pinnwand-Posts"
categories: API
tags: [api, release]
summary: "Die neue Version der Youthweb-API hat jetzt eine neue Posts-Resource."
---
## Changelog

### Neu

- Neue geschützte Resource `posts/{post_id}` für Details zu einem Pinnwand-Eintrag.
- Es gibt einen neuen Scope `post:read`, um die Posts eines Users anzufragen, die nur für den User oder seine Freunde freigegeben wurden.
- Bei Posts gibt es neue Endpoints zum Autor wie `/posts/<post_id>/author` und `/posts/<post_id>/relationships/author`.
- Bei Posts gibt es neue Entpoints zum User, an dessen Pinnwand der Post steht, wie `/posts/<post_id>/parent` und `/posts/<post_id>/relationships/parent`.
- Bei Usern gibt es einen neuen Endpoint `users/<user_id>/posts`, um die Pinnwand-Einträge eines Users aufzulisten.

### Geändert

- Wir haben ein neues Support-Model für die Versionen erstellt. Damit garantieren wir mindestens 1 Jahr Support für jede Version. Siehe [hier](api_general_versions.html#support) für mehr Informationen.
- Die Lizenz der Youthweb-API wurde von GPL2 zu GPL3 geändert.

### Veraltet

- Die Versionen 0.6 and 0.7 sind jetzt veraltet und zeigen eine Warnung im `meta`-Bereich an. Verwende in deinen Apps jetzt die Version 0.8.

### Entfernt

- **Breaking:** Der Support für die Version 0.4 wurde eingestellt. Requests mit dieser Version erhalten einen 406 Error zurück.

## Beispiele

### Einen Post anfragen

**Request**

```
GET https://api.youthweb.net/posts/d5a5a2c3-041b-4985-907c-74a2131efc98
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.8
Content-Type: application/vnd.api+json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE0NTgyMzE2MDAsImlzcyI6IkpOdlBnY3ROcEg1Y0s2UmMifQ.BOn0XFDDYa5iBHJb636A0C0m4sU5NO8SA_CPOVHoWNs
```

**Response**

```
Status: 200 OK
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.8
Content-Type: application/vnd.api+json

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
    }
}
```

### Alle Posts eines Users anfragen

Beim Request nach allen Posts eines Users wird ein Array der Posts zurückgeliefert. Die Objekte `parent` und `author` sind automatisch im `included`-Attribute enthalten. In den `links` und in `meta` finden sich außerdem Informationen zur Pagination.

**Request**

```
GET https://api.youthweb.net/users/123456/posts
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.8
Content-Type: application/vnd.api+json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE0NTgyMzE2MDAsImlzcyI6IkpOdlBnY3ROcEg1Y0s2UmMifQ.BOn0XFDDYa5iBHJb636A0C0m4sU5NO8SA_CPOVHoWNs
```

**Response**

```
Status: 200 OK
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.8
Content-Type: application/vnd.api+json

{
    "data":
    [
        {
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
                "author":
                {
                    "links":
                    {
                        "self": "/posts/d5a5a2c3-041b-4985-907c-74a2131efc98/relationships/author",
                        "related": "/posts/d5a5a2c3-041b-4985-907c-74a2131efc98/author"
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
                        "self": "/posts/d5a5a2c3-041b-4985-907c-74a2131efc98/relationships/parent",
                        "related": "/posts/d5a5a2c3-041b-4985-907c-74a2131efc98/parent"
                    },
                    "data":
                    {
                        "type": "users",
                        "id": "1"
                    }
                }
            },
            "links": {
                "self": "/posts/d5a5a2c3-041b-4985-907c-74a2131efc98"
            }
        }
    ],
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
    ],
    "meta":
    {
        "pagination":
        {
            "total": 1,
            "count": 1,
            "per_page": 10,
            "current_page": 1,
            "total_pages": 1
        }
    },
    "links":
    {
        "self": "/users/123456/posts?page=1",
        "first": "/users/123456/posts?page=1",
        "last": "/users/123456/posts?page=1"
    }
}
```

{% include links.html %}
