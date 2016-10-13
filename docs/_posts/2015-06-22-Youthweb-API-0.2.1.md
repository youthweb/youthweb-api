---
title:  "Youthweb-API 0.2.1"
categories: API
tags: [api, release]
---
## Änderungen

### Geändert

- Statt dem Mockserver von apiary.io wird jetzt eine lokale Drakov installation verwendet, worduch ein Account bei apiary.io für das Testen nicht mehr nötig ist.
- Die Resourcen können jetzt direkt über die Url angesprochen werden. Die Übergabe im Querystring ist optional.

### Veraltet

- Die Resourcen-Url mit Querystring ist veraltet und wird in Zukunft nicht mehr funktionieren.

## Beispiel

**Request**

```
GET https://youthweb.net/stats/account
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
