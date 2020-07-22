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

## API Blueprint

Da API in API Blueprint definiert ist, kann sich die Spezifikation hier angesehen werden:

| API       | Version                                |
|-----------|----------------------------------------|
| **core**  | [0.16](./spec/core/current.html) |

## Übersicht

| Endpoint                                                | Beschreibung                                                     |
|---------------------------------------------------------|------------------------------------------------------------------|
| [/comments][api_endpoint_comments]                      | Liefert Comments-Resourcen                                       |
| [/events][api_endpoint_events]                          | Liefert Event-Resourcen                                          |
| [/friends][api_endpoint_friends]                        | Liefert Friends-Resourcen                                        |
| [/me][api_endpoint_me]                                  | Liefert die User-Resource des autorisierten User                 |
| [/{object}/{id}/comments][api_endpoint_object_comments] | Liefert Comments-Resourcen zu einem Objekt                       |
| [/{object}/{id}/friends][api_endpoint_object_friends]   | Liefert Friends-Resourcen zu einem Objekt                        |
| [/{object}/{id}/posts][api_endpoint_object_posts]       | Liefert Post-Resourcen zu einem Objekt                           |
| [/posts][api_endpoint_posts]                            | Liefert Post-Resourcen                                           |
| [/stats][api_endpoint_stats]                            | Liefert Statisik-Resourcen                                       |
| [/users][api_endpoint_users]                            | Liefert User-Resourcen                                           |

{% include links.html %}
