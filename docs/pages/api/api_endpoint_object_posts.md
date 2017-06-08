---
title: "{object}/{object_id}/posts"
keywords: Youthweb-API, Resource, Posts
tags: [endpoint]
summary: "Dieser Endpoint liefert die Posts zu einer Resource."
sidebar: api_sidebar
permalink: api_endpoint_object_posts.html
folder: api
---

Dieser Endpoint bietet die `/posts` Beziehungen zu einer Resource an. Die folgenden Resourcen haben eine `/posts` Beziehung:

- [Users][api_endpoint_users]

## Read

### Request

Beim Request nach allen Posts einer Resource wird ein Array der Posts zurückgeliefert. Die Objekte `parent` und `author` sind automatisch im `included`-Attribute enthalten. In den `links` und in `meta` finden sich außerdem zusätzliche Felder für die Pagination.

**Beispiel**: Alle Posts eines Users anfragen

```
GET https://api.youthweb.net/users/123456/posts
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.10
Content-Type: application/vnd.api+json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE0NTgyMzE2MDAsImlzcyI6IkpOdlBnY3ROcEg1Y0s2UmMifQ.BOn0XFDDYa5iBHJb636A0C0m4sU5NO8SA_CPOVHoWNs
```

### Permissions

- **Allgemein**: Du benötigst in den meisten Fällen ein [Access-Token][api_general_oauth2], um auf diesen Endpoint zugreifen zu können.
- **Private Posts**: Du benötigst ein [Access-Token][api_general_oauth2] mit `post:read` Scope, um auf Posts zuzugreifen, die nur für den User oder seine Freunde sichtbar sind.

### Parameter

- `page` (`integer`): Die aktuelle Seitenzahl, wenn eine Resource viele Posts hat

### Response

```
Status: 200 OK
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.10
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

### Felder

Es wird ein Array an [`Posts`][api_endpoint_posts] Resourcen mit all ihren Feldern zurückgegeben. Zusätzlich finden sich im meta-Bereich und links-Bereich noch folgende Felder:

| Name                             | Beschreibung                                               | Typ                   |
|----------------------------------|------------------------------------------------------------|-----------------------|
| `links.self`                     | Der Link zur aktuellen Seite mit den Posts                 | `string`              |
| `links.first`                    | Der Link zur ersten Seite mit den Posts                    | `string`              |
| `links.last`                     | Der Link zur letzten Seite mit den Posts                   | `string`              |
| `links.next`                     | Der Link zur nächsten Seite mit den Posts                  | `string` oder nicht vorhanden |
| `links.prev`                     | Der Link zur vorherigen Seite mit den Posts                | `string` oder nicht vorhanden |
| `meta.pagination.total`          | Die Anzahl aller lesbaren Posts an dieser Resource         | `integer`             |
| `meta.pagination.count`          | Die Anzahl der gelieferten Posts zu dieser Resource        | `integer`             |
| `meta.pagination.per_page`       | Die Anzahl der maximal auf einmal gelieferten Posts        | `integer`             |
| `meta.pagination.current_page`   | Die aktuelle Seitenzahl der gelieferten Posts              | `integer`             |
| `meta.pagination.total_pages`    | Die Anzahl der Seiten für die gelieferten Posts            | `integer`             |

## Create

Du kannst mit diesem Endpoint einen neuen Post zu einer Resource erstellen. Als Autor der Posts wird automatisch der User angenommen, der den Client über den Scope autorisiert hat.

**Beispiel**: Einen Posts an der Pinnwand eines Users erstellen

```
POST https://api.youthweb.net/users/123456/posts
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.10
Content-Type: application/vnd.api+json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE0NTgyMzE2MDAsImlzcyI6IkpOdlBnY3ROcEg1Y0s2UmMifQ.BOn0XFDDYa5iBHJb636A0C0m4sU5NO8SA_CPOVHoWNs

{
    "data": {
        "type": "posts",
        "attributes": {
            "title": "The post title",
            "content": "Lorem ipsum dolor sit amet, sed libris elaboraret eu.",
            "view_allowed_for": "users",
            "comments_allowed": true,
        }
    }
}
```

### Permissions

- **Schreibrechte**: Du benötigst ein [Access-Token][api_general_oauth2] mit [`post:write`][api_general_scopes] Scope, um im Namen eines Users einen Post erstellen zu können.
- **Sonstiges**: Es kann sein, dass ein User das Erstellen von Posts an seine Pinnwand verbietet. In diesem Fall wird ein `403 Forbidden` Error zurückgegeben. An die Pinnwand des Users, der den Client autorisiert hat, kann immer gepostet werden.

### Felder

Das `data`-Object muss folgende Felder enthalten

| Name                             | Beschreibung                                               | Typ                   |
|----------------------------------|------------------------------------------------------------|-----------------------|
| `type`                           | Der Resource Typ `posts`                                   | `string`              |
| `attributes.title`               | Der Titel des Posts; kann auch leer sein                   | `string`              |
| `attributes.content`             | Der Inhalt des Posts; darf nicht leer sein                 | `string`              |
| `attributes.view_allowed_for`    | Wer darf den Post sehen? `all`, `users`, `friends` oder `authors` Default: `users` | `string`              |
| `attributes.comments_allowed`    | Darf der Post kommentiert werden? Default `true`           | `boolean`             |

### Parameter

Für den Request können keine Parameter angegeben werden.

### Response

```
Status: 201 Created
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.10
Content-Type: application/vnd.api+json
Location: /posts/d5a5a2c3-041b-4985-907c-74a2131efc98

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
    },
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
    ]
    "links":
    {
        "self": "/posts/d5a5a2c3-041b-4985-907c-74a2131efc98",
    }
}
```

### Felder

Dieser Endpoint liefert keine besonderen Felder zurück. Siehe die [`Posts`][api_endpoint_posts] Resource für eine Erklärung der Felder.

## Delete

Du kannst mit diesem Endpoint nichts löschen.

## Update

Du kannst mit diesem Endpoint nichts ändern.

{% include links.html %}
