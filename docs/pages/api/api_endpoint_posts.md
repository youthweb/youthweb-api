---
title: Posts/{post_id}
keywords: Youthweb-API, Resource, Posts
tags: [endpoint]
summary: "Dieser Endpoint liefert eine Post-Resource."
sidebar: api_sidebar
permalink: api_endpoint_posts.html
folder: api
---

{% include important.html content="Diese Dokumentation wird nicht mehr gepflegt und wird in Zukunft entfernt. [Sieh dir stattdessen die neue Dokumentation an][api_endpoint_index]." %}

Dieser Endpoint kann zum Lesen oder Erstellen eines Posts verwendet werden.

## Read

### Request

**Beispiel**: Daten zu Post-ID d5a5a2c3-041b-4985-907c-74a2131efc98 anfragen

```
GET https://api.youthweb.net/posts/d5a5a2c3-041b-4985-907c-74a2131efc98
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.16
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
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.16
Content-Type: application/vnd.api+json

{
    "data": {
        "type": "posts",
        "id": "d5a5a2c3-041b-4985-907c-74a2131efc98",
        "attributes": {
            "title": "The post title",
            "content": "Lorem ipsum dolor sit amet, sed libris elaboraret eu.",
            "content_html": "<p>Lorem ipsum dolor sit amet, sed libris elaboraret eu.</p>",
            "view_allowed_for": "users",
            "comments_allowed": true,
            "comments_count": 15,
            "reactions_given": [
                ":+1:"
            ],
            "reactions_count": {
                ":+1:": 2
            },
            "created_at": "2016-01-01T20:00:00+00:00",
            "updated_at": "2016-02-11T16:13:05+00:00",
        },
        "relationships": {
            "author": {},
            "comments": [],
            "parent": {}
        },
        "links": {
            "self": "/posts/d5a5a2c3-041b-4985-907c-74a2131efc98"
        }
    }
}
```

### Felder

| Name                             | Beschreibung                                                                             | Typ                   |
|----------------------------------|------------------------------------------------------------------------------------------|-----------------------|
| `type`                           | Der Typ der Resource: `posts`                                                            | `string`              |
| `id`                             | Die ID der Resource                                                                      | `string`              |
| `attributes.title`               | Der Titel des Posts                                                                      | `string`              |
| `attributes.content`             | Der Content des Posts                                                                    | `string`              |
| `attributes.content_html`        | Der Content des Posts als geparstes HTML                                                 | `string`              |
| `attributes.view_allowed_for`    | Für wen darf dieser Post sichtbar sein?<br />`all`, `users`, `friends` oder `authors`    | `string`              |
| `attributes.comments_allowed`    | Sind neue Kommentare zu diesem Post erlaubt?                                             | `boolean`             |
| `attributes.comments_count`      | Wie viele Kommentare wurden schon verfasst?                                              | `integer`             |
| `attributes.reactions_given`     | Die Reactions, die der authorisierte User dem Post gegeben hat                           | `array`               |
| `attributes.reactions_count`     | Alle Reactions und ihre Anzahl, die der Post bekommen hat                                | `object`              |
| `attributes.created_at`          | Der Erstellzeitpunkt des Posts im Format nach ISO-8601 (`2006-01-01T20:00:00+00:00`)     | `string`              |
| `attributes.updated_at`          | Der Zeitpunkt der letzten Änderung im Format nach ISO-8601 (`2016-11-14T10:28:47+00:00`) | `string`              |
| `relationships.author`           | Ein [Resource Identifier Objekt][spec-resource-identifier-objects], das auf den Autor verweist                   | `object`             |
| `relationships.comments`         | Ein Array aus [Resource Identifier Objekts][spec-resource-identifier-objects], die auf die Kommentare verweisen  | `object`             |
| `relationships.parent`           | Ein [Resource Identifier Objekt][spec-resource-identifier-objects], das auf das Elternobjekt des Posts verweist. | `object`             |

## Create

Du kannst mit diesem Endpoint nichts erstellen.

## Delete

Du kannst mit diesem Endpoint nichts löschen.

## Update

In eigenen Posts können `title`, `content`, `view_allowed_for`, `comments_allowed` und `reactions_given` verändert werden. Attribute, die nicht geändert werden sollen, dürfen nicht im Request angegeben sein.

Bei fremden Posts kann nur das Attribute `reactions_given` verändert werden, um die Reaktionen auf diesen Post zu ändern oder zu entfernen. Werden mehr Attribute angegeben, die nicht verändert werden dürfen, dann wird der Request mit einem Forbidden Error abgelehnt.

### Request

**Beispiel**: Titel, Content und Sichtbarkeit zu Post-ID d5a5a2c3-041b-4985-907c-74a2131efc98 ändern

```
PATCH https://api.youthweb.net/posts/d5a5a2c3-041b-4985-907c-74a2131efc98
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.16
Content-Type: application/vnd.api+json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE0NTgyMzE2MDAsImlzcyI6IkpOdlBnY3ROcEg1Y0s2UmMifQ.BOn0XFDDYa5iBHJb636A0C0m4sU5NO8SA_CPOVHoWNs

{
    "data": {
        "type": "posts",
        "id": "d5a5a2c3-041b-4985-907c-74a2131efc98",
        "attributes": {
            "title": "Neuer Titel",
            "content": "Neuer Post-Content",
            "view_allowed_for": "friends",
        }
    }
}
```

### Permissions

- **Allgemein**: Du benötigst ein [Access-Token][api_general_oauth2] des Autors des Posts, um auf diesen Endpoint zugreifen zu können.

### Parameter

Für den Request können keine Parameter angegeben werden.

### Response

```
Status: 200 OK
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.16
Content-Type: application/vnd.api+json

{
    "data": {
        "type": "posts",
        "id": "d5a5a2c3-041b-4985-907c-74a2131efc98",
        "attributes": {
            "title": "Neuer Titel",
            "content": "Neuer Post-Content",
            "content_html": "<p>Neuer Post-Content</p>",
            "view_allowed_for": "friends",
            "comments_allowed": true,
            "comments_count": 15,
            "reactions_given": [
                ":+1:"
            ],
            "reactions_count": {
                ":+1:": 2
            },
            "created_at": "2016-01-01T20:00:00+00:00",
            "updated_at": "2020-06-18T08:22:13+00:00",
        },
        "relationships": {
            "author": {},
            "comments": [],
            "parent": {}
        },
        "links": {
            "self": "/posts/d5a5a2c3-041b-4985-907c-74a2131efc98"
        }
    }
}
```

### Felder

Es wird die veränderte [`Posts`][api_endpoint_posts] Resource mit all ihren Feldern zurückgegeben.

### Request

**Beispiel**: Die `:+1:` Reaction zu Post-ID d5a5a2c3-041b-4985-907c-74a2131efc98 wird zu `:-1:` geändert

```
PATCH https://api.youthweb.net/posts/d5a5a2c3-041b-4985-907c-74a2131efc98
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.16
Content-Type: application/vnd.api+json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE0NTgyMzE2MDAsImlzcyI6IkpOdlBnY3ROcEg1Y0s2UmMifQ.BOn0XFDDYa5iBHJb636A0C0m4sU5NO8SA_CPOVHoWNs

{
    "data": {
        "type": "posts",
        "id": "d5a5a2c3-041b-4985-907c-74a2131efc98",
        "attributes": {
            "reactions_given": [
                ":-1:"
            ]
        }
    }
}
```

### Permissions

- **Allgemein**: Du benötigst ein [Access-Token][api_general_oauth2] des Autors des Posts, um auf diesen Endpoint zugreifen zu können.

### Parameter

Für den Request können keine Parameter angegeben werden.

### Response

```
Status: 200 OK
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.16
Content-Type: application/vnd.api+json

{
    "data": {
        "type": "posts",
        "id": "d5a5a2c3-041b-4985-907c-74a2131efc98",
        "attributes": {
            "title": "Neuer Titel",
            "content": "Neuer Post-Content",
            "content_html": "<p>Neuer Post-Content</p>",
            "view_allowed_for": "friends",
            "comments_allowed": true,
            "comments_count": 15,
            "reactions_given": [
                ":-1:"
            ],
            "reactions_count": {
                ":+1:": 1,
                ":-1:": 1
            },
            "created_at": "2016-01-01T20:00:00+00:00",
            "updated_at": "2020-06-18T08:22:13+00:00",
        },
        "relationships": {
            "author": {},
            "comments": [],
            "parent": {}
        },
        "links": {
            "self": "/posts/d5a5a2c3-041b-4985-907c-74a2131efc98"
        }
    }
}
```

### Felder

Es wird die veränderte [`Posts`][api_endpoint_posts] Resource mit all ihren Feldern zurückgegeben.

## Beziehungen

| Beziehung                                                   | Beschreibung                                                                                                                                |
|-------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------|
| `/posts/{post_id}/author`                                   | Liefert den Autor als [User][api_endpoint_users]-Resource                                                                                   |
| [`/posts/{post_id}/comments`][api_endpoint_object_comments] | Liefert die Kommentare als Array von [Comments][api_endpoint_comments]-Resourcen                                                            |
| `/posts/{post_id}/parent`                                   | Liefert das Elternobjekt, zu dem der Post gehört. Mögliche Resourcen können sein:<br />- [User][api_endpoint_users]                         |
| `/posts/{post_id}/relationships/author`                     | Liefert ein [Resource Identifier Objekt][spec-resource-identifier-objects] zum Autor                                                        |
| `/posts/{post_id}/relationships/comments`                   | Liefert ein Array von [Resource Identifier Objekt][spec-resource-identifier-objects] zu den Kommentaren                                     |
| `/posts/{post_id}/relationships/parent`                     | Liefert ein [Resource Identifier Objekt][spec-resource-identifier-objects] zum Elternobjekt                                                 |

[spec-resource-identifier-objects]: http://jsonapi.org/format/1.0/#document-resource-identifier-objects
{% include links.html %}
