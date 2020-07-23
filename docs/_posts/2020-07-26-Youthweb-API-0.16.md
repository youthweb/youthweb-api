---
title:  "Youthweb-API 0.16 liefert mehr Daten zu Posts und erlaubt das Bearbeiten"
categories: API
tags: [api, release]
summary: "Youthweb-API 0.16 liefert den geparsten Content zu Posts und erlaubt das Vergeben von Reactions. Außerdem wird die API-Dokumentation verändert und in Zukunft aus API Blueprint generiert."
---
## Neues zu den Posts

Bei den Posts gibt es jetzt [drei neue Attribute](/public/spec/core/0.16/index.html#posts-post-get):

- `content_html` gibt den Content als fertig geparstes HTML zurück
- `reactions_given` ist ein Array, dass die Reactions enthält, die der angemeldete User einem Post gegeben hat und
- `reactions_count` enthält Informationen, welche Reactions wie oft ein Post bekommen hat.

Neu ist auch, dass Posts jetzt bearbeitet werden können. Der Endpoint dazu lautet `PATCH /posts/<uuid>`.

Vorausgesetzt ein User darf einen Post bearbeiten, können die Attribute `title`, `content`, `view_allowed_for`, `comments_allowed` und `reactions_given` verändert werden. Das Verändern der ersten beiden Attribute sorgt dafür, dass sich das Attribute `update_at` aktualisiert.

Wenn nur Lesezugriff auf einen Post besteht, kann nur das Attribute `reactions_given` verändert werden. Und wenn kein Lesezugriff besteht, dann wird wie bisher ein `401` bzw `403` Error zurückgegeben.

## Neue Dokumentation

Das separate Pflegen der API Dokumentation ist teilweise sehr aufwendig. Durch das doppelte Schreiben der API Blueprints, Behat-Features und der Dokumentation schleichen sich gerne Fehler ein führen zu einer unvollständigen Dokumentation.

Daher bieten wir jetzt neu [eine automatisch generierte Dokumentation][api_endpoint_index] an, die mithilfe von [Aglio](https://github.com/danielgtaylor/aglio) aus den API Blueprint Dateien zu HTML gerendert wird.

Die alte Dokumentation wird noch bestehen bleiben, aber nicht mehr aktualisiert und wird in Zukunft entfernt werden.

## Veraltet

Bei der Post Resource werden automatisch die Relationships `author` und `parent` geladen. Dieses Verhalten wird sich in Zukunft ändern und es werden keine Relationships mehr automatisch geladen. Dadurch möchten wir die Responses in Zukunft kleiner halten.

Wenn deine App diese Relationships benötigt, dann solltest du sie ab sofort über den `include` Parameter im Querystring anfordern. Beispiel:

```
GET /posts/7b4d2748-4996-4fdd-912a-e966cb96715a?include=author,parent
```

Die Version 0.15 ist jetzt veraltet und zeigt eine Warnung im `meta`-Bereich an. In frühstens 6 Monaten wird die Unterstützung für diese Version entfernt. Verwende in deinen Apps jetzt die Version 0.16.

## Entfernt

**Breaking:** Der Support für die Versionen 0.13 and 0.14 wurde eingestellt. Requests mit diesen Versionen erhalten jetzt einen 406 Error zurück.

{% include links.html %}
