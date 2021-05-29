---
title:  "Youthweb-API 0.19 verbessert die Cursor bei Timeline-Entries"
categories: API
tags: [api, release]
summary: "Youthweb-API 0.19 erlaubt bei Cursor der Timeline-Entries auch ein RFC 3339 Datum statt Timestamp und zeigt friends Relationships bei User an"
---

## User Endpoint zeigt Friends Relationship an

Bei den Relationships eines Users werden neben `posts` jetzt auch `friends` angezeigt.

### Beispiel

**Request**

```
GET https://youthweb.net/users/123456
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.19
Content-Type: application/vnd.api+json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE0NTgyMzE2MDAsImlzcyI6IkpOdlBnY3ROcEg1Y0s2UmMifQ.BOn0XFDDYa5iBHJb636A0C0m4sU5NO8SA_CPOVHoWNs
```

**Response**

```
Status: 200 OK
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.19
Content-Type: application/vnd.api+json

{
  "data": {
    "type": "users",
    "id": "123456",
    "links": {
      "self": "\\/users\\/123456"
    },
    "attributes": {
    },
    "relationships": {
      "friends": {
        "links": {
          "self": "\\/users\\/123456\\/relationships\\/friends",
          "related": "\\/users\\/123456\\/friends"
        }
      }
      "posts": {
        "links": {
          "self": "\\/users\\/123456\\/relationships\\/posts",
          "related": "\\/users\\/123456\\/posts"
        }
      }
    }
  }
}
```

## Cursor bei Timeline-Entries als RFC 3339 Datum

Bei den `/timeline-entries` Endpoints kann das Attribut `page[cursor]` als Timestamp angegeben werden.

```
GET /timeline-entries?page[limit]=5&page[cursor]=1621798015
```

Da aber bei manchen Resources eine Datum als RFC 3339 statt Timestamp angeben, kann jetzt auch die der Cursor als RFC 3339 angegeben werden. Die Angabe eines Timestamps ist weiterhin möglich, aber ist deprecated und sollte nicht mehr benutzt werden.

```
GET /timeline-entries?page[limit]=5&page[cursor]=2021-05-23T21:26:55+02:00
```

## Veraltet

Bei der Friend Resource werden automatisch die Relationships `from` und `to` geladen. Dieses Verhalten wird sich in Zukunft ändern und es werden keine Relationships mehr automatisch geladen. Dadurch möchten wir die Responses in Zukunft kleiner halten.

Wenn deine App diese Relationships benötigt, dann kannst du sie über den `include` Parameter im Querystring anfordern. Beispiel:

```
GET /friends/7658?include=from,to
```

{% include links.html %}
