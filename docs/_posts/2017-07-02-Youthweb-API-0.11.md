---
title:  "Youthweb-API 0.11 liefert Daten von Freunden und führt neue Nutzungsbedingungen ein"
categories: API
tags: [api, release]
summary: "Die neue Version der Youthweb-API erlaubt jetzt das Abfragen und Auflisten von Freunden zu einem User. Außerdem führen wir Nutzungsbedingungen für unsere API ein."
---
## Changelog

### Neu

- Wir führen Nutzungsbedingungen für die Verwenung unserer API ein. [Hier][api_guideline_policy] kannst du sie dir ansehen.
- Die neue geschützte Resource `friends/{friend_id}` liefert Details zu einer Freundesbeziehung.
- Bei Friends gibt es neue Endpoints zum from-User, von dem eine Freundschaft ausgeht, wie `/friends/<friend_id>/from` und `/friends/<friend_id>/relationships/from`.
- Bei Friends gibt es neue Entpoints zum to-User, zu dem eine Freundschaft besteht, wie `/friends/<friend_id>/to` und `/friends/<friend_id>/relationships/to`.
- Bei Usern gibt es einen neuen Endpoint `users/<user_id>/friends`, um die Freunde eines Users aufzulisten.

## Beispiele

### Alle Freunde eines Users ermitteln

**Request**

```
GET https://api.youthweb.net/users/1/friends
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.11
Content-Type: application/vnd.api+json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE0NTgyMzE2MDAsImlzcyI6IkpOdlBnY3ROcEg1Y0s2UmMifQ.BOn0XFDDYa5iBHJb636A0C0m4sU5NO8SA_CPOVHoWNs
```

**Response**

```
Status: 200 OK
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.11
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

### Details zu einem bestimmten Freund ermitteln

**Request**

```
GET https://api.youthweb.net/friends/45678
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.11
Content-Type: application/vnd.api+json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE0NTgyMzE2MDAsImlzcyI6IkpOdlBnY3ROcEg1Y0s2UmMifQ.BOn0XFDDYa5iBHJb636A0C0m4sU5NO8SA_CPOVHoWNs
```

**Response**

```
Status: 200 OK
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.11
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

{% include links.html %}
