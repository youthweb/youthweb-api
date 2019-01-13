---
title: "{object}/{object_id}/comments"
keywords: Youthweb-API, Resource, Comments, Posts
tags: [endpoint]
summary: "Dieser Endpoint liefert die Comments zu einer Resource."
sidebar: api_sidebar
permalink: api_endpoint_object_comments.html
folder: api
---

Dieser Endpoint bietet die `/comments` Beziehungen zu einer Resource an. Die folgenden Resourcen haben eine `/comments` Beziehung:

- [Posts][api_endpoint_posts]

## Read

### Request

Beim Request nach allen Comments einer Resource wird ein Array der Comments zurückgeliefert. Die Objekte `parent` und `author` sind automatisch im `included`-Attribute enthalten.

**Beispiel**: Alle Comments eines Posts anfragen

```
GET https://api.youthweb.net/posts/d5a5a2c3-041b-4985-907c-74a2131efc98/comments
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.14
Content-Type: application/vnd.api+json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE0NTgyMzE2MDAsImlzcyI6IkpOdlBnY3ROcEg1Y0s2UmMifQ.BOn0XFDDYa5iBHJb636A0C0m4sU5NO8SA_CPOVHoWNs
```

### Permissions

- **Allgemein**: Du benötigst in den meisten Fällen ein [Access-Token][api_general_oauth2], um auf diesen Endpoint zugreifen zu können.
- **Private Posts**: Du benötigst ein [Access-Token][api_general_oauth2] mit `post:read` Scope, um auf die Kommentare von Posts zuzugreifen, die nur für den User oder seine Freunde sichtbar sind.

### Parameter

Für den Request können keine Parameter angegeben werden.

### Response

```
Status: 200 OK
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.14
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
                        "type": "comments",
                        "id": "d5a5a2c3-041b-4985-907c-74a2131efc98"
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

### Felder

Es wird ein Array an [`Comments`][api_endpoint_comments] Resourcen mit all ihren Feldern zurückgegeben. Eine Pagination der Comments ist derzeit nicht möglich.

## Create

Du kannst mit diesem Endpoint einen neuen Comment zu einer Resource erstellen. Als Autor der Comments wird automatisch der User angenommen, der den Client über den Scope autorisiert hat.

**Beispiel**: Einen Kommentar zu einem Post erstellen

```
POST https://api.youthweb.net/posts/d5a5a2c3-041b-4985-907c-74a2131efc98/comments
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.14
Content-Type: application/vnd.api+json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE0NTgyMzE2MDAsImlzcyI6IkpOdlBnY3ROcEg1Y0s2UmMifQ.BOn0XFDDYa5iBHJb636A0C0m4sU5NO8SA_CPOVHoWNs

{
    "data": {
        "type": "comments",
        "attributes": {
            "content": "Lorem ipsum dolor sit amet, sed libris elaboraret eu.",
        }
    }
}
```

### Permissions

- **Schreibrechte**: Du benötigst ein [Access-Token][api_general_oauth2] mit [`post:write`][api_general_scopes] Scope, um im Namen eines Users einen Kommentar erstellen zu können.
- **Sonstiges**: Es kann sein, dass ein User das Erstellen von Kommentaren an seine Posts verbietet. In diesem Fall wird ein `403 Forbidden` Error zurückgegeben.

### Felder

Das `data`-Object muss folgende Felder enthalten

| Name                             | Beschreibung                                                                       | Typ                   |
|----------------------------------|------------------------------------------------------------------------------------|-----------------------|
| `type`                           | Der Resource Typ `comments`                                                        | `string`              |
| `attributes.content`             | Der Inhalt des Comments; darf nicht leer sein                                      | `string`              |

### Parameter

Für den Request können keine Parameter angegeben werden.

### Response

```
Status: 201 Created
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
            "created_at": "2019-01-01T20:00:00+00:00",
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
                    "type": "posts",
                    "id": "d5a5a2c3-041b-4985-907c-74a2131efc98"
                }
            }
        },
        "links": {
            "self": "/comments/345678"
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

## Delete

Du kannst mit diesem Endpoint nichts löschen.

## Update

Du kannst mit diesem Endpoint nichts ändern.

{% include links.html %}
