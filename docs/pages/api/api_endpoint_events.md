---
title: Events/{event_id}
keywords: Youthweb-API, Resource, Events
tags: [endpoint]
summary: "Dieser Endpoint liefert eine Event-Resource."
sidebar: api_sidebar
permalink: api_endpoint_events.html
folder: api
---

Dieser Endpoint liefert die Events, die in einem bestimmten Zeitraum stattfinden oder ein bestimmtes Event.

## List

### Request

Beim Request nach den Events eines Zeitraums wird ein Array der Events zurückgeliefert. Das Objekt `author` ist automatisch im `included`-Attribute enthalten.

**Beispiel**: Alle Events eines Zeitraums abfragen

```
GET https://api.youthweb.net/events?page[start]=2017-01-01&page[end]=2017-12-31
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.13
Content-Type: application/vnd.api+json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE0NTgyMzE2MDAsImlzcyI6IkpOdlBnY3ROcEg1Y0s2UmMifQ.BOn0XFDDYa5iBHJb636A0C0m4sU5NO8SA_CPOVHoWNs
```

### Permissions

- **Allgemein**: Du benötigst ein [Access-Token][api_general_oauth2], um auf diesen Endpoint zugreifen zu können.

### Parameter

- `page[start]` (`string`, optional): Das Beginn des gewünschten Zeitraums als ISO 8601 Datum in der UTC-Zeitzone ohne Timezone-Offset Angaben, z.B. `2017-01-01` oder `2017-01-01T09:30:00`. Wenn dieser Parameter nicht angegeben wurde, wird der aktuelle Zeitpunkt angenommen.
- `page[end]` (`string`, optional): Das Ende des gewünschten Zeitraums als ISO 8601 Datum in der UTC-Zeitzone ohne Timezone-Offset Angaben, z.B. `2017-01-01` oder `2017-01-01T09:30:00`. Kann nicht kleiner als der Start-Zeitpunkt und nicht größer als 1 Jahr nach dem Start-Zeitpunkt sein. Wenn dieser Parameter nicht angegeben wurde, wird ein Monat nach dem Start-Zeitpunkt angenommen.

### Response

```
Status: 200 OK
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.13
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
                "address": "Musterstraße 42\n12345 Berlin",
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

### Felder

Für Informationen zu den Feldern siehe den [Response eines einzelnen Events](#felder-1) weiter unten.

## Read

### Request

Beim Request nach einem bestimmten Event wird eine Event Resource zurückgeliefert. Das Objekt `author` ist automatisch im `included`-Attribute enthalten.

**Beispiel**: Daten zu Event-ID 4567 anfragen

```
GET https://api.youthweb.net/events/4567
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.13
Content-Type: application/vnd.api+json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE0NTgyMzE2MDAsImlzcyI6IkpOdlBnY3ROcEg1Y0s2UmMifQ.BOn0XFDDYa5iBHJb636A0C0m4sU5NO8SA_CPOVHoWNs
```

### Permissions

- **Allgemein**: Du benötigst ein [Access-Token][api_general_oauth2], um auf diesen Endpoint zugreifen zu können.

### Parameter

Für den Request können keine Parameter angegeben werden.

### Response

```
Status: 200 OK
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.13
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

### Felder

| Name                             | Beschreibung                                                                                                                                   | Typ                   |
|----------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------|
| `type`                           | Der Typ der Resource: `events`                                                                                                                 | `string`              |
| `id`                             | Die ID der Resource                                                                                                                            | `string`              |
| `attributes.name`                | Der Name des Events                                                                                                                            | `string`              |
| `attributes.content`             | Der Content des Events                                                                                                                         | `string`              |
| `attributes.start_datetime`      | Der Start-Zeitpunkt des Events im Format nach ISO-8601 in der UTC Timezone (`2017-06-26T07:30:00+00:00`)                                       | `string`              |
| `attributes.end_datetime`        | Der optionale End-Zeitpunkt des Events im Format nach ISO-8601 in der UTC Timezone (`2017-06-26T07:30:00+00:00`)                               | `string` oder `null`  |
| `attributes.timezone`            | Der [Name der Zeitzone](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones), in der das Event stattfinden wird, z.B. `Europe/Berlin` | `string`              |
| `attributes.address`             | Die Adresse, an der das Event stattfinden wird, z.B `Musterstraße 42\n12345 Berlin`. Kann auch leer sein.                                      | `string`              |
| `attributes.comments_allowed`    | Sind neue Kommentare zu diesem Event erlaubt?                                                                                                  | `boolean`             |
| `attributes.comments_count`      | Wie viele Kommentare wurden schon verfasst?                                                                                                    | `integer`             |
| `attributes.participants_count`  | Die Gesamtanzahl der User, die Angaben zur Teilnahme an diesem Event gemacht haben                                                             | `string`              |
| `relationships.author`           | Ein [Resource Identifier Objekt](http://jsonapi.org/format/1.0/#document-resource-identifier-objects), das auf den Autor verweist              | `object`              |

## Create

Du kannst mit diesem Endpoint nichts erstellen.

## Delete

Du kannst mit diesem Endpoint nichts löschen.

## Update

Du kannst mit diesem Endpoint nichts ändern.

## Beziehungen

| Beziehung                                 | Beschreibung                                                                                                             |
|-------------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| `/events/{event_id}/author`               | Liefert den Autor als [User][api_endpoint_users]-Resource                                                                |
| `/events/{event_id}/relationships/author` | Liefert ein [Resource Identifier Objekt](http://jsonapi.org/format/1.0/#document-resource-identifier-objects) zum Autor  |

{% include links.html %}
