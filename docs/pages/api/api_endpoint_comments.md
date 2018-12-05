---
title: Comments/{comment_id}
keywords: Youthweb-API, Resource, Comments
tags: [endpoint]
summary: "Dieser Endpoint liefert eine Comment-Resource."
sidebar: api_sidebar
permalink: api_endpoint_comments.html
folder: api
---

Dieser Endpoint kann zum Lesen eines Comments verwendet werden.

## Read

### Request

**Beispiel**: Daten zu Comment-ID 345678 anfragen

```
GET https://api.youthweb.net/comments/345678
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.13
Content-Type: application/vnd.api+json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE0NTgyMzE2MDAsImlzcyI6IkpOdlBnY3ROcEg1Y0s2UmMifQ.BOn0XFDDYa5iBHJb636A0C0m4sU5NO8SA_CPOVHoWNs
```

### Permissions

- **Allgemein**: Abhängig vom Parent des Comments benötigst du in den meisten Fällen ein [Access-Token][api_general_oauth2], um auf diesen Endpoint zugreifen zu können.

### Parameter

Für den Request können keine Parameter angegeben werden.

### Response

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

### Felder

| Name                             | Beschreibung                                               | Typ                   |
|----------------------------------|------------------------------------------------------------|-----------------------|
| `type`                           | Der Typ der Resource: `comments`                           | `string`              |
| `id`                             | Die ID der Resource                                        | `string`              |
| `attributes.content`             | Der Content des Posts                                      | `string`              |
| `attributes.created_at`          | Der Erstellzeitpunkt des Comments im Format nach ISO-8601 (`2006-01-01T20:00:00+00:00`)                                                                | `string`              |
| `relationships.author`           | Ein [Resource Identifier Objekt](http://jsonapi.org/format/1.0/#document-resource-identifier-objects), das auf den Autor verweist                      | `object`             |
| `relationships.parent`           | Ein [Resource Identifier Objekt](http://jsonapi.org/format/1.0/#document-resource-identifier-objects), das auf das Elternobjekt des Comments verweist. | `object`             |

## Create

Du kannst mit diesem Endpoint nichts erstellen.

## Delete

Du kannst mit diesem Endpoint nichts löschen.

## Update

Du kannst mit diesem Endpoint nichts ändern.

## Beziehungen

| Beziehung                                     | Beschreibung                                                                                                                    |
|-----------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------|
| `/comments/{comment_id}/author`               | Liefert den Autor als [User][api_endpoint_users]-Resource                                                                       |
| `/comments/{comment_id}/parent`               | Liefert das Elternobjekt, zu dem der Comment gehört. Mögliche Resourcen können sein:<br />- [Post][api_endpoint_posts]          |
| `/comments/{comment_id}/relationships/author` | Liefert ein [Resource Identifier Objekt](http://jsonapi.org/format/1.0/#document-resource-identifier-objects) zum Autor         |
| `/comments/{comment_id}/relationships/parent` | Liefert ein [Resource Identifier Objekt](http://jsonapi.org/format/1.0/#document-resource-identifier-objects) zum Elternobjekt  |

{% include links.html %}
