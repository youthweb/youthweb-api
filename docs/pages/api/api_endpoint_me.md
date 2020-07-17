---
title: Me
keywords: Youthweb-API, Resource, Endpoint, Me, User
tags: [endpoint]
summary: "Dieser Endpoint liefert die User-Resource des autorisierten User"
sidebar: api_sidebar
permalink: api_endpoint_me.html
folder: api
---

Dieser Endpoint ist ein Shortcut für `/users/{user_id}` und liefert eine [User-Resource][api_endpoint_users]. Er kann zum Beispiel verwendet werden, wenn die User-ID des autorisierten Users nicht bekannt ist, wodurch der `/users`-Endpoint noch nicht verwendet werden kann.

Siehe den [Endpoint `/users`][api_endpoint_users] für Informationen zur User-Resource.

## Read

### Request

```
GET https://api.youthweb.net/me
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.17
Content-Type: application/vnd.api+json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE0NTgyMzE2MDAsImlzcyI6IkpOdlBnY3ROcEg1Y0s2UmMifQ.BOn0XFDDYa5iBHJb636A0C0m4sU5NO8SA_CPOVHoWNs
```

### Permissions

Für diesen Endpoint gelten die selben Permissions wie beim [Endpoint `/users`][api_endpoint_users].

### Parameter

Für den Request können keine Parameter angegeben werden.

### Response

Siehe den [Endpoint `/users`][api_endpoint_users] für Informationen zum Response.

### Felder

Dieser Endpoint liefert die selben Felder wie der [Endpoint `/users`][api_endpoint_users].

## Create

Du kannst mit diesem Endpoint nichts erstellen.

## Delete

Du kannst mit diesem Endpoint nichts löschen.

## Update

Du kannst mit diesem Endpoint nichts ändern.

## Beziehungen

keine

{% include links.html %}
