---
title: "{object}/{object_id}/friends"
keywords: Youthweb-API, Resource, Friends
tags: [endpoint]
summary: "Dieser Endpoint liefert die Friends zu einer Resource."
sidebar: api_sidebar
permalink: api_endpoint_object_friends.html
folder: api
---

{% include important.html content="Diese Dokumentation wird nicht mehr gepflegt und wird in Zukunft entfernt. [Sieh dir stattdessen die neue Dokumentation an][api_endpoint_index]." %}

Dieser Endpoint bietet die `/friends` Beziehungen zu einer Resource an. Die folgenden Resourcen haben eine `/friends` Beziehung:

- [Users][api_endpoint_users]

Dieser Endpoint kann zum Lesen eines `Friends` verwendet werden.

`Friends` sind die Verbindungspunkte zwischen zwei User. User lassen sich mithilfe der `Friends` als [gerichteter Graph](https://de.wikipedia.org/wiki/Graph_(Graphentheorie)) abbilden, wobei jeder User einen Knoten und jeder `Friend` eine Kante darstellt.

![Grafik 2](images/Friend_Graph2.png)

- Die Anfrage der Freunde von `User A` wird `Friend 1` ausliefern.
- Die Anfrage der Freunde von `User B` wird `Friend 2` und `Friend 3` ausliefern.
- Die Anfrage der Freunde von `User C` wird `Friend 4` ausliefern.

## Read

### Request

Beim Request nach allen Freunden einer Resource wird ein Array der `Friends` zurückgeliefert. Die Objekte `from` und `to` sind automatisch im `included`-Attribute enthalten.

**Beispiel**: Alle Freunde eines Users anfragen

```
GET https://api.youthweb.net/users/1/friends
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
    "data":
    [
        {
            "type": "friends",
            "id": "45678",
            "attributes": {
                "description": "Beschreibung des to-Users durch from-User"
            },
            "relationships": {
                "from":
                {
                    "links":
                    {
                        "self": "/friends/45678/relationships/from",
                        "related": "/friends/45678/from"
                    },
                    "data":
                    {
                        "type": "users",
                        "id": "1"
                    }
                },
                "to":
                {
                    "links":
                    {
                        "self": "/friends/45678/relationships/to",
                        "related": "/friends/45678/to"
                    },
                    "data":
                    {
                        "type": "users",
                        "id": "2"
                    }
                }
            },
            "links": {
                "self": "/friends/45678"
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
                "self": "/users/1"
            }
        },
        {
            "type": "users",
            "id": "2",
            "attributes": {},
            "links":
            {
                "self": "/users/2"
            }
        }
    ]
    "links":
    {
        "self": "/friends/45678",
    }
}
```

### Felder

Es wird ein Array an [`Friends`][api_endpoint_friends] Resourcen mit all ihren Feldern zurückgegeben.

## Create

Du kannst mit diesem Endpoint nichts erstellen.

## Delete

Du kannst mit diesem Endpoint nichts löschen.

## Update

Du kannst mit diesem Endpoint nichts ändern.

{% include links.html %}
