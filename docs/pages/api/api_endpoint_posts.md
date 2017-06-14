---
title: Posts/{post_id}
keywords: Youthweb-API, Resource, Posts
tags: [endpoint]
summary: "Dieser Endpoint liefert eine Post-Resource."
sidebar: api_sidebar
permalink: api_endpoint_posts.html
folder: api
---

Dieser Endpoint kann zum Lesen oder Erstellen eines Posts verwendet werden.

## Read

### Request

**Beispiel**: Daten zu Post-ID d5a5a2c3-041b-4985-907c-74a2131efc98 anfragen

```
GET https://api.youthweb.net/posts/d5a5a2c3-041b-4985-907c-74a2131efc98
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.10
Content-Type: application/vnd.api+json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE0NTgyMzE2MDAsImlzcyI6IkpOdlBnY3ROcEg1Y0s2UmMifQ.BOn0XFDDYa5iBHJb636A0C0m4sU5NO8SA_CPOVHoWNs
```

### Permissions

- **Allgemein**: Du benötigst in den meisten Fällen ein [Access-Token][api_general_oauth2], um auf diesen Endpoint zugreifen zu können.

### Parameter

Für den Request können keine Parameter angegeben werden.

### Response

```
Status: 200 OK
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.10
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

### Felder

| Name                             | Beschreibung                                               | Typ                   |
|----------------------------------|------------------------------------------------------------|-----------------------|
| `type`                           | Der Typ der Resource: `posts`                              | `string`              |
| `id`                             | Die ID der Resource                                        | `string`              |
| `attributes.title`               | Der Titel des Posts                                        | `string`              |
| `attributes.content`             | Der Content des Posts                                      | `string`              |
| `attributes.view_allowed_for`    | Für wen darf dieser Post sichtbar sein?<br />`all`, `users`, `friends` oder `authors`     | `string`   |
| `attributes.comments_allowed`    | Sind neue Kommentare zu diesem Post erlaubt?               | `boolean`            |
| `attributes.comments_count`      | Wie viele Kommentare wurden schon verfasst?                | `integer`             |
| `attributes.created_at`          | Der Erstellzeitpunkt des Posts im Format nach ISO-8601 (`2006-01-01T21:00:00+01:00`)                                                 | `string`              |
| `attributes.updated_at`          | Der Zeitpunkt der letzten Änderung im Format nach ISO-8601 (`2016-11-14T11:28:47+01:00`)                                                  | `string`              |
| `relationships.author`           | Ein [Resource Identifier Objekt](http://jsonapi.org/format/1.0/#document-resource-identifier-objects), das auf den Autor verweist | `object`             |
| `relationships.parent`           | Ein [Resource Identifier Objekt](http://jsonapi.org/format/1.0/#document-resource-identifier-objects), das auf das Elternobjekt des Posts verweist. | `object`             |

## Create

Du kannst mit diesem Endpoint nichts erstellen.

## Delete

Du kannst mit diesem Endpoint nichts löschen.

## Update

Du kannst mit diesem Endpoint nichts ändern.

## Beziehungen

| Beziehung                               | Beschreibung                                                                       |
|-----------------------------------------|------------------------------------------------------------------------------------|
| `/posts/{post_id}/author`               | Liefert den Autor als [User][api_endpoint_users]-Resource                          |
| `/posts/{post_id}/parent`               | Liefert das Elternobjekt, zu dem der Post gehört. Mögliche Resourcen können sein:<br />- [User][api_endpoint_users] |
| `/posts/{post_id}/relationships/author` | Liefert ein [Resource Identifier Objekt](http://jsonapi.org/format/1.0/#document-resource-identifier-objects) zum Autor  |
| `/posts/{post_id}/relationships/parent` | Liefert ein [Resource Identifier Objekt](http://jsonapi.org/format/1.0/#document-resource-identifier-objects) zum Elternobjekt  |

{% include links.html %}
