---
title: Users/{user_id}
keywords: Youthweb-API, Resource, Users
tags: [endpoint]
summary: "Dieser Endpoint liefert eine User-Resource."
sidebar: api_sidebar
permalink: api_endpoint_users.html
folder: api
---

Dieser Endpoint liefert Daten zu einem User.

## Read

### Request

**Beispiel**: Daten zu User-ID 123456 anfragen

```
GET https://api.youthweb.net/users/123456
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.10
Content-Type: application/vnd.api+json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE0NTgyMzE2MDAsImlzcyI6IkpOdlBnY3ROcEg1Y0s2UmMifQ.BOn0XFDDYa5iBHJb636A0C0m4sU5NO8SA_CPOVHoWNs
```

### Permissions

- **Allgemein**: Du benötigst ein [Access-Token][api_general_oauth2], um auf diesen Endpoint zugreifen zu können.
- **Spezielle Felder**: Der User kann den Zugriff auf die meisten Felder einschränken. Zugriff auf diese Felder benötigt dann einen bestimmten [Scope][api_general_scopes].

### Parameter

Für den Request können keine Parameter angegeben werden.

### Response

```
Status: 200 OK
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.10
Content-Type: application/vnd.api+json

{
    "data": {
        "type": "users",
        "id": "123456",
        "attributes": {
            "username": "JohnSmith",
            "first_name": "John",
            "last_name": "Smith",
            "email": "john_smith@example.org",
            "birthday": "1988-03-05",
            "created_at": "2006-01-01T21:00:00+01:00",
            "last_login": "2016-01-01T22:00:00+02:00",
            "zip": "12345",
            "city": "Jamestown",
            "description_jesus": "Lorem ipsum dolor sit amet",
            "description_job": "Lorem ipsum dolor sit amet",
            "description_hobbies": "Lorem ipsum dolor sit amet",
            "description_motto": "Lorem ipsum dolor sit amet",
            "picture_thumb_url": "https://youthweb.net/img/steckbriefe/default_pic_m.jpg",
            "picture_url": "https://youthweb.net/img/steckbriefe/default_pic_m.jpg"
        },
        "links": {
            "self": "/users/123456"
        }
    }
}
```

### Felder

| Name                             | Beschreibung                                               | Typ                   |
|----------------------------------|------------------------------------------------------------|-----------------------|
| `type`                           | Der Typ der Resource: `users`                              | `string`              |
| `id`                             | Die ID der Resource                                        | `string`              |
| `attributes.username`            | Der Username des Users                                     | `string`              |
| `attributes.first_name`          | Der Vorname des Users oder null bei fehlender Berechtigung.<br />Kann mit dem Scope `user:read` erfragt werden.                         | `string` oder `null`  |
| `attributes.last_name`           | Der Nachname des Users oder null bei fehlender Berechtigung.<br />Kann mit dem Scope `user:read` erfragt werden.                        | `string` oder `null`  |
| `attributes.email`               | Die E-Mail-Adresse des Users oder null bei fehlender Berechtigung.<br />Kann mit dem Scope `user:email` oder `user:read` erfragt werden.               | `string` oder `null`  |
| `attributes.birthday`            | Der Geburtstag des Users im Format YYYY-MM-DD oder null bei fehlender Berechtigung.<br />Kann mit dem Scope `user:read` erfragt werden. | `string` oder `null`  |
| `attributes.created_at`          | Der Registrierzeitpunkt des Users im Format nach ISO-8601 (`2006-01-01T21:00:00+01:00`)                                                 | `string`              |
| `attributes.last_login`          | Der Zeitpunkt des letzten Logins im Format nach ISO-8601 (`2016-11-14T11:28:47+01:00`)                                                  | `string`              |
| `attributes.zip`                 | Die Postleitzahl des Users oder null bei fehlender Berechtigung.<br />Kann mit dem Scope `user:read` erfragt werden.                    | `string` oder `null`  |
| `attributes.city`                | Der Wohnort des Users oder null bei fehlender Berechtigung.<br />Kann mit dem Scope `user:read` erfragt werden.                         | `string` oder `null`  |
| `attributes.description_jesus`   | "Was ich von Jesus halte" oder null bei fehlender Berechtigung.<br />Kann mit dem Scope `user:read` erfragt werden.                     | `string` oder `null`  |
| `attributes.description_job`     | Der Beruf des Users oder null bei fehlender Berechtigung.<br />Kann mit dem Scope `user:read` erfragt werden.                           | `string` oder `null`  |
| `attributes.description_hobbies` | Die Hobbies des Users oder null bei fehlender Berechtigung.<br />Kann mit dem Scope `user:read` erfragt werden.                         | `string` oder `null`  |
| `attributes.description_motto`   | Das Lebensmotto des Users oder null bei fehlender Berechtigung.<br />Kann mit dem Scope `user:read` erfragt werden.                     | `string` oder `null`  |
| `attributes.picture_thumb_url`   | Das Vorschaubild des Profilbildes                          | `string` |
| `attributes.picture_url`         | Das Profilbild                                             | `string` |

## Create

Du kannst mit diesem Endpoint nichts erstellen.

## Delete

Du kannst mit diesem Endpoint nichts löschen.

## Update

Du kannst mit diesem Endpoint nichts ändern.

## Beziehungen

| Beziehung                                             | Beschreibung                                                                       |
|-------------------------------------------------------|------------------------------------------------------------------------------------|
| [`/users/{user_id}/posts`][api_endpoint_object_posts] | Liefert die [Post][api_endpoint_posts]-Resourcen von der Pinnwand eines Users      |

{% include links.html %}
