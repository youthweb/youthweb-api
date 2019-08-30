---
title:  "Youthweb-API 0.15 bietet bessere Angaben zu den Teilnehmern eines Events"
categories: API
tags: [api, release]
summary: "Die neue Version der Youthweb-API bietet jetzt die Anzahl der Zusagen, Absagen und Einladungen zu einem Event."
---
## Changelog

### Neu

- Bei den Events gibt es jetzt [drei neue Attribute](https://developer.youthweb.net/api_endpoint_events.html#felder-1) `promised_participants_count`, `declined_participants_count` und `invited_participants_count`, die Auskunft über die Anzahl der Zusagen, Absagen und ausstehenden Einladungen zu einem Event geben

### Veraltet

- Bei der Event Resource ist das Attribute `participants_count` veraltet. Stattdessen sollte jetzt das Attribute `promised_participants_count` verwendet werden, das dieselbe Angabe liefert wie `participants_count`.
- Die Versionen 0.13 and 0.14 sind jetzt veraltet und zeigen eine Warnung im `meta`-Bereich an. Verwende in deinen Apps jetzt die Version 0.15.

### Entfernt

- **Breaking:** Der Support für die Versionen 0.8, 0.9, 0.10, 0.11 and 0.12 wurde eingestellt. Requests mit diesen Versionen erhalten jetzt einen 406 Error zurück.

## Beispiele

### Details zu einem bestimmten Event ermitteln

Im Response sieht man jetzt die drei neuen Attribute `promised_participants_count`, `declined_participants_count` und `invited_participants_count`.

**Request**

```
GET https://api.youthweb.net/events/4567
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.15
Content-Type: application/vnd.api+json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE0NTgyMzE2MDAsImlzcyI6IkpOdlBnY3ROcEg1Y0s2UmMifQ.BOn0XFDDYa5iBHJb636A0C0m4sU5NO8SA_CPOVHoWNs
```

**Response**

```
Status: 200 OK
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.15
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
            "address": "Musterstraße 42\n12345 Berlin",
            "comments_allowed": true,
            "comments_count": 15,
            "promised_participants_count": 10,
            "declined_participants_count": 2,
            "invited_participants_count": 5,
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
