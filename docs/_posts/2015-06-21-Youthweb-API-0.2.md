---
title:  "Youthweb-API 0.2 mit mehr Daten in der Statistik"
categories: API
tags: [api, release]
summary: "Die neue Version der Youthweb-API zeigt jetzt mehr Daten in der Statistik an. Außerdem haben wir das Daten-Format an die JSON API Spezifikation angepasst."
---
## Changelog

### Neu

- Neue Resourcen `stats/account`, `stats/forum` and `stats/groups` mit mehr statistischen Daten.
- Bessere Response-Dokumentation
- Es gibt einen PHP-Client für die Youthweb-API: https://github.com/youthweb/php-youthweb-api

### Geändert

- **Breaking:** Der Response-Body hält sich nun an die [JSON API](http://jsonapi.org/) Spezifikation.

### Veraltet

- Die Resource `account/stats` wird im nächsten Release entfernt.

## Beispiel

**Request**

```
GET https://youthweb.net/index.php?action=stats&cat=account
```

**Response**

```
Status: 200 OK
Content-Type:application/json

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

{% include links.html %}
