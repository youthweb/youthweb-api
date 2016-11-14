---
title:  "Youthweb-API 0.0.1"
categories: API
tags: [api, release]
summary: "Die erste Alpha-Version der Youthweb-API ist da."
---
## Changelog

### Neu

- Resource account/stats

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
