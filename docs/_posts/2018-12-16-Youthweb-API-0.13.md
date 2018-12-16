---
title:  "Youthweb-API 0.13 liefert Daten zu Kommentaren von Posts"
categories: API
tags: [api, release]
summary: "Die neue Version der Youthweb-API erlaubt jetzt das Abfragen und Auflisten von Kommentaren zu einem Post."
---
## Changelog

### Neu

- Die neue Resource `comments/{comment_id}` liefert Details zu einem Kommentar.
- Zur Resource `Comment` können Daten zum Autor über die Endpunkte `/comments/<comment_id>/author` und `/comments/<comment_id>/relationships/author` ermittelt werden.
- Zur Resource `Comment` können Daten zum Elternobjekt über die Endpunkte `/comments/<comment_id>/parent` und `/comments/<comment_id>/relationships/parent` ermittelt werden.
- Über die neuen Endpunkte `posts/{post_id}/comments` und `posts/{post_id}/relationships/comments` können die Kommentare eines Posts aufgelistet werden.

### Veraltet

- Die Versionen 0.8, 0.9, 0.10, 0.11 and 0.12 sind jetzt veraltet und zeigen eine Warnung im `meta`-Bereich an. Verwende in deinen Apps jetzt die Version 0.13.

### Entfernt

- **Breaking:** Der Support für die Versionen 0.5, 0.6 und 0.7 wurde eingestellt. Requests mit diesen Versionen erhalten jetzt einen 406 Error zurück.
- **Breaking:** Der Endpunkt `/auth/token` zur Authorization mittels Access Token ist [seit Version 0.6 veraltet](https://developer.youthweb.net/20161023-Youthweb-API-0.6.html#veraltet) und wurde jetzt entfernt. Die Authorization ist jetzt nur noch [über OAuth2][api_general_oauth2] möglich.

## Beispiele für die neuen Endpoints

### Alle Kommentare eines Posts ermitteln

Beachte, dass sich die Autoren und das Elternobjekt (also der Post selber) automatisch im `included` Bereich des Response befinden.

**Request**

```
GET https://api.youthweb.net/posts/d5a5a2c3-041b-4985-907c-74a2131efc98/comments
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.13
Content-Type: application/vnd.api+json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE0NTgyMzE2MDAsImlzcyI6IkpOdlBnY3ROcEg1Y0s2UmMifQ.BOn0XFDDYa5iBHJb636A0C0m4sU5NO8SA_CPOVHoWNs
```

**Response**

```
Status: 200 OK
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.13
Content-Type: application/vnd.api+json

{
    "data":
    [
        {
            "type": "comments",
            "id": "345678",
            "attributes": {
                "content": "Lorem ipsum dolor sit amet, sed libris elaboraret eu.",
                "created_at": "2016-01-01T20:00:00+00:00",
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
                        "type": "users",
                        "id": "1"
                    }
                }
            },
            "links": {
                "self": "/comments/345678"
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

### Details zu einem bestimmten Kommentar ermitteln

Auch hier befinden sich die Autoren und das Elternobjekt (also der Post, der kommentiert wurde) automatisch im `included` Bereich des Response.

**Request**

```
GET https://api.youthweb.net/comments/345678
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.13
Content-Type: application/vnd.api+json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE0NTgyMzE2MDAsImlzcyI6IkpOdlBnY3ROcEg1Y0s2UmMifQ.BOn0XFDDYa5iBHJb636A0C0m4sU5NO8SA_CPOVHoWNs
```

**Response**

```
Status: 200 OK
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.13
Content-Type: application/vnd.api+json

{
    "data": {
        "type": "comments",
        "id": "345678",
        "attributes": {
            "content": "Lorem ipsum dolor sit amet, sed libris elaboraret eu.",
            "created_at": "2016-01-01T20:00:00+00:00",
        },
        "relationships": {
            "author": {},
            "parent": {}
        },
        "links": {
            "self": "/comments/345678"
        }
    }
}
```

## Upgrade

Die Youthweb-API 0.13 ist ab sofort aktiv und die neuen Endpunkte können jetzt verwendet werden. Du solltest in deinen Apps und Anwendungen jetzt den Accept Header mit der neuen API-Version verwenden:

```
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.13
```

Bei Fragen oder Verbesserungsvorschläge [eröffne einfach ein Issue auf Github](https://github.com/youthweb/youthweb-api/issues/new) oder melde dich [im Forum](https://youthweb.net/forum/categories/7) oder [auf Twitter bei @youthweb_dev](ttps://twitter.com/youthweb_dev).

{% include links.html %}
