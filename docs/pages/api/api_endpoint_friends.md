---
title: Friends/{friend_id}
keywords: Youthweb-API, Resource, Friends
tags: [endpoint]
summary: "Dieser Endpoint liefert eine Friend-Resource."
sidebar: api_sidebar
permalink: api_endpoint_friends.html
folder: api
---

Dieser Endpoint kann zum Lesen eines `Friends` verwendet werden.

`Friends` sind die Verbindungspunkte zwischen zwei User. User lassen sich mithilfe der `Friends` als [gerichteter Graph](https://de.wikipedia.org/wiki/Graph_(Graphentheorie)) abbilden, wobei jeder User einen Knoten und jeder `Friend` eine Kante darstellt.

![Grafik 1](images/Friend_Graph1.png)

Die Richtung der Kante wird durch die Relationships `from` und `to` bestimmt. Damit bestehen zwischen zwei befreundeten Usern immer zwei `Friend`-Kanten, die in die jeweils andere Richtung zeigen.

Die Kante `Friend 1` beinhaltet in der `from`-Relationship den `User A` und in der `to`-Relationship den `User B`. Die Kante `Friend 2` hingegen beinhaltet in der `from`-Relationship den `User B` und in der `to`-Relationship den `User A`.

## Read

### Request

**Beispiel**: Daten zu Friend-ID 45678 anfragen

```
GET https://api.youthweb.net/friends/45678
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.12
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
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.12
Content-Type: application/vnd.api+json

{
    "data": {
        "type": "friends",
        "id": "45678",
        "attributes": {
            "description": "Beschreibung des to-Users durch from-User"
        },
        "relationships": {
            "from": {},
            "to": {}
        },
        "links": {
            "self": "/friends/45678"
        }
    }
}
```

### Felder

| Name                             | Beschreibung                                               | Typ                   |
|----------------------------------|------------------------------------------------------------|-----------------------|
| `type`                           | Der Typ der Resource: `friends`                            | `string`              |
| `id`                             | Die ID der Resource                                        | `string`              |
| `attributes.description`         | Die Beschreibung des `to`-Users durch den `from`-User      | `string`              |
| `relationships.from`           | Ein [Resource Identifier Objekt](http://jsonapi.org/format/1.0/#document-resource-identifier-objects), das auf den `from`-User verweist | `object`             |
| `relationships.to`           | Ein [Resource Identifier Objekt](http://jsonapi.org/format/1.0/#document-resource-identifier-objects), das auf den `to`-User verweist. | `object`             |

## Create

Du kannst mit diesem Endpoint nichts erstellen.

## Delete

Du kannst mit diesem Endpoint nichts löschen.

## Update

Du kannst mit diesem Endpoint nichts ändern.

## Beziehungen

| Beziehung                               | Beschreibung                                                                       |
|-----------------------------------------|------------------------------------------------------------------------------------|
| `/friends/{friend_id}/from`             | Liefert den `from`-User als [User][api_endpoint_users]-Resource                          |
| `/friends/{friend_id}/to`               | Liefert den `to`-User als [User][api_endpoint_users]-Resource |
| `/friends/{friend_id}/relationships/from` | Liefert ein [Resource Identifier Objekt](http://jsonapi.org/format/1.0/#document-resource-identifier-objects) zum `from`-User  |
| `/friends/{friend_id}/relationships/to` | Liefert ein [Resource Identifier Objekt](http://jsonapi.org/format/1.0/#document-resource-identifier-objects) zum `to`-User  |

{% include links.html %}
