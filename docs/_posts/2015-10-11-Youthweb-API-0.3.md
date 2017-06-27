---
title:  "Youthweb-API 0.3 mit Headern und Einführung der Versionierung"
categories: API
tags: [api, release]
summary: "Mit der neuen Version der Youthweb-API passen wir uns weiter an die JSON API Spezifikation an. Es werden jetzt die richtigen Header benötigt, um die API verwenden zu können. Werden die Header nicht oder falsch angegeben, wird zusätzlich eine Warnung zurückgegeben. Zusätzlich sollten Clients jetzt immer die API-Version angeben, mit der sie arbeiten."
---
## Changelog

### Neu

- Bei jedem Request sollte immer `Content-Type: application/vnd.api+json` und `Accept: application/vnd.api+json; net.youthweb.api.version=0.3` mit der angefragten Versionsnummer angegeben werden.
- Im Response wird gewarnt, wenn im Request eine alte Versionsnummer angegeben ist, die bald nicht mehr unterstützt wird.
- Bei einem Response liefert der Server jetzt immer `Content-Type: application/vnd.api+json`
- Bei einem Response liefert der Server jetzt immer `Accept: application/vnd.api+json; net.youthweb.api.version=0.3`. Die Version wird bei weiteren Releases immer angepasst.

### Änderungen

- Wird bei einem Request der Content-Type oder Accept-Header nicht angegeben, wird im Response eine Warnung ausgegeben, das diese Header in Zukunft obligatorisch sind.

### Entfernt

- **Breaking:** Die veraltete Resource `account/stats` wurde entfernt.

## Beispiel

Bei diesem Request fehlen der `Content-Type` und der `Accept`-Header.

**Request**

```
GET https://youthweb.net/stats/account
```

**Response**

```
Status: 200 OK
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.3
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
    },
    "meta": {
        "warnings": [
            "You havn't specified the Header Content-Type: application/vnd.api+json. This will be necessary in future releases.",
            "You havn't specified the API version in the Accept Header. The API version will be necessary in future releases."
        ]
    }
}
```

{% include links.html %}
