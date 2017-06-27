---
title:  "Youthweb-API 0.1 mit neuen Tests"
categories: API
tags: [api, release]
summary: "Die neue Version der Youthweb-API ändert inhaltlich nichts an der API, sondern bringt automatisierte Tests mit, um die weitere Entwicklung mit Tests absichern zu können."
---
## Changelog

### Neu

- Behat-Tests für die Resource `account/stats`
- Eine LICENSE Datei (GPLv2)
- CHANGELOG.md
- Travis CI Integration

## Beispiel

**Request**

```
GET https://www.youthweb.net/index.php?action=account&cat=stats
```

**Response**

```
Status: 200 OK
Content-Type:application/json

{
    "user_total": 5503,
    "user_online": 74
}
```

{% include links.html %}
