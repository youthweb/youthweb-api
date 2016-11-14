---
title: Endpoint Übersicht
keywords: Youthweb-API, Resource, Endpoint
tags: [endpoint]
summary: "Eine Übersicht über alle Endpoints und Resourcen"
sidebar: api_sidebar
permalink: api_endpoint_index.html
folder: api
---

## Begriffe

- **Resource**: Eine Resource ist die Representation eines Objekts, zum Beispiel eines Users. Eine Resource, die vom Youthweb-Server geliefert wird, hat immer mindestens die Attribute `type` und `id`. Der Aufbau einer Resource ist [in JSON API spezifiziert](http://jsonapi.org/format/#document-resource-objects).
- **Endpoint**: Ein Endpoint ist eine Stelle in der Youthweb-API, mit der Daten ausgetauscht werden. Zum Beispiel liefert der Endpoint `/users/123` eine Resource, die den User mit der ID 123 representiert. Die übertragenen Daten an einem Entpoint enthalten also in fast allen Fällen eine oder mehrere Resourcen.

## Übersicht

| Endpoint                              | Beschreibung                                                                       |
|---------------------------------------|------------------------------------------------------------------------------------|
| [/me][api_endpoint_me]                | Liefert die User-Resource des autorisierten User                                   |
| [/stats][api_endpoint_stats]          | Liefert eine Statisik-Resource                                                     |
| [/users][api_endpoint_users]          | Liefert eine User-Resource                                                         |

{% include links.html %}
