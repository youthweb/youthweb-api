---
title:  "Youthweb-API 0.20 verbessert die Kommentare"
categories: API
tags: [api, release]
summary: "Youthweb-API 0.20 bringt ein neues Attribut bei den Kommentaren und entfernt veraltete Warnungen."
---
## Neues content_html Attribut bei Kommentaren

Das neue `content_html` Attribut liefert den Kommentar jetzt zusätzlich auch im HTML Format.

**Request**

```
GET https://api.youthweb.net/posts/d5a5a2c3-041b-4985-907c-74a2131efc98/comments
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.14
Content-Type: application/vnd.api+json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE0NTgyMzE2MDAsImlzcyI6IkpOdlBnY3ROcEg1Y0s2UmMifQ.BOn0XFDDYa5iBHJb636A0C0m4sU5NO8SA_CPOVHoWNs
```

**Response**

```
Status: 200 OK
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
            "content_html": "<p>Lorem ipsum dolor sit amet, sed libris elaboraret eu.</p>",
            "created_at": "2019-01-01T20:00:00+00:00",
        },
        "relationships": {
            "author":
            {
                "links":
                {
                    "self": "/comments/345678/relationships/author",
                    "related": "/comments/345678/author"
                }
            },
            "parent":
            {
                "links":
                {
                    "self": "/comments/345678/relationships/parent",
                    "related": "/comments/345678/parent"
                }
            }
        },
        "links": {
            "self": "/comments/345678"
        }
    },
    "links":
    {
        "self": "/posts/d5a5a2c3-041b-4985-907c-74a2131efc98/comments"
    }
}
```

## Entfernt

**Breaking:** Seit Version 0.18 ist das automatische Laden bei Comment Resource der Relationships-Daten  `author` und `parent` veraltet. Mit dem Umstieg auf Version 0.20 werden keine Relationships mehr automatisch geladen. Dadurch wird der Response kleiner und liefert nur die Daten, die auch angefragt werden.

Wenn deine App diese Relationships benötigt, dann kannst du sie über den `include` Parameter im Querystring anfordern. Beispiel:

```
GET /comments/987654?include=author,parent
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.20
Content-Type: application/vnd.api+json
```

Um die Abwärtskompatibilität zu erhalten, sind die Versionen bis 0.19 nicht von dieser Änderung betroffen. Sie liefern auch weiterhin die Relationships-Daten. Erst mit der Umstellung deiner App auf 0.20 im `Accept`-Header werden die Änderungen sichtbar.

{% include links.html %}
