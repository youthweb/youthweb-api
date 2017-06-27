---
title:  "Youthweb-API 0.10 liefert Event-Daten und ändert die Zeitzone aller Datum- und Zeitangaben"
categories: API
tags: [api, release]
summary: "Die neue Version der Youthweb-API erlaubt jetzt das Abfragen und Auflisten von Events."
---
## Changelog

### Neu

- Neuer Endpoint `/events` für die Auflistung von Events in einem bestimmten Zeitraum.
- Neue geschützte Resource `events/{event_id}` für Details zu einem Event.
- Bei Events gibt es neue Endpoints zum Autor wie `/events/<event_id>/author` und `/events/<event_id>/relationships/author`.

### Änderungen

- Zeitangaben bei `Posts` und `Users` Resourcen werden immer in der UTC Zeitzone (Offset +00:00) ausgegeben.

## Beispiele

### Alle Events ermitteln, die zwischen dem 1.1.2017 und 31.12.2017 stattfinden

**Request**

```
GET https://api.youthweb.net/events?page[start]=2017-01-01&page[end]=2017-12-31
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.10
Content-Type: application/vnd.api+json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE0NTgyMzE2MDAsImlzcyI6IkpOdlBnY3ROcEg1Y0s2UmMifQ.BOn0XFDDYa5iBHJb636A0C0m4sU5NO8SA_CPOVHoWNs
```

**Response**

```
Status: 200 OK
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.10
Content-Type: application/vnd.api+json

{
    "data": [
        {
            "type": "events",
            "id": "4567",
            "attributes": {
                "name": "The event name",
                "content": "Lorem ipsum dolor sit amet, sed libris elaboraret eu.",
                "start_datetime": "2017-06-26T07:30:00+00:00",
                "end_datetime": "2017-07-07T16:00:00+00:00",
                "timezone": "Europe/Berlin",
                "comments_allowed": true,
                "comments_count": 15,
                "participants_count": 10
            },
            "relationships": {
                "author": {}
            },
            "links": {
                "self": "/events/4567"
            }
        }
    ],
    "included": [
        {
            "type": "users",
            "id": "123456",
            "attributes": {}
        }
    ]
}
```

### Details zu einem bestimmten Event ermitteln

**Request**

```
GET https://api.youthweb.net/events/4567
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.10
Content-Type: application/vnd.api+json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE0NTgyMzE2MDAsImlzcyI6IkpOdlBnY3ROcEg1Y0s2UmMifQ.BOn0XFDDYa5iBHJb636A0C0m4sU5NO8SA_CPOVHoWNs
```

**Response**

```
Status: 200 OK
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.10
Content-Type: application/vnd.api+json

{
    "data": {
        "type": "events",
        "id": "4567",
        "attributes": {
            "name": "The event name",
            "content": "Lorem ipsum dolor sit amet, sed libris elaboraret eu.",
            "start_datetime": "2017-06-26T07:30:00+00:00",
            "end_datetime": "2017-07-07T16:00:00+00:00",
            "timezone": "Europe/Berlin",
            "comments_allowed": true,
            "comments_count": 15,
            "participants_count": 10
        },
        "relationships": {
            "author": {}
        },
        "links": {
            "self": "/events/4567"
        }
    },
    "included": [
        {
            "type": "users",
            "id": "123456",
            "attributes": {}
        }
    ]
}
```

{% include links.html %}
