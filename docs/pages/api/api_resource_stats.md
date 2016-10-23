---
title: Stats Resource
keywords: Youthweb-API, Resource, Stats
tags: [getting_started]
summary: "Die Statistik Resource"
sidebar: api_sidebar
permalink: api_resource_stats.html
folder: api
---

## Beispiel 1: Account Statistiken

**Request**

```
GET https://api.youthweb.net/stats/account
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.6
Content-Type: application/vnd.api+json
```

**Response**

```
Status: 200 OK
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.6
Content-Type: application/vnd.api+json

{
    "data": {
        "type": "stats",
        "id": "account",
        "attributes": {
            "user_total": 5503,
            "user_total_female": 2831,
            "user_total_male": 2672,
            "user_online": 74,
            "user_online_24h": 629,
            "user_online_7d": 1035,
            "user_online_30d": 1600,
            "userpics": 3441
        }
    }
}
```

## Beispiel 2: Foren Statistiken

**Request**

```
GET https://api.youthweb.net/stats/forum
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.6
Content-Type: application/vnd.api+json
```

**Response**

```
Status: 200 OK
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.6
Content-Type: application/vnd.api+json

{
    "data": {
        "type": "stats",
        "id": "forum",
        "attributes": {
            "authors_total": 1480,
            "threads_total": 2094,
            "posts_total": 121387
        }
    }
}
```

## Beispiel 3: Gruppen Statistiken

**Request**

```
GET https://api.youthweb.net/stats/groups
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.6
Content-Type: application/vnd.api+json
```

**Response**

```
Status: 200 OK
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.6
Content-Type: application/vnd.api+json

{
    "data": {
        "type": "stats",
        "id": "groups",
        "attributes": {
            "groups_total": 614,
            "users_total": 2073
        }
    }
}
```

{% include links.html %}
