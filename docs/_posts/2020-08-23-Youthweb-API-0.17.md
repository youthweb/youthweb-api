---
title:  "Youthweb-API 0.17 führt globale und userbasierte Timelines ein"
categories: API
tags: [api, release]
summary: "Youthweb-API 0.17 liefert die Einträge der globalen Timeline oder nur die Einträge für einen User."
---
## Die globale Timeline

Mit der [globalen Timeline](spec/core/0.17/index.html#timeline-entries-timeline-entries-get) ist es möglich, sich die Einträge holen, die auch auf der Youthweb-Startseite angezeigt werden. Der neue Endpoint dazu lautet:

```
GET /timeline-entries/?include=origin
```

Da die Beiträge sehr verschieden sein können (Posts, Event-Teilnahme, Gebetsanliegen, Bilder hochgeladen, etc) liefert der neue Endpoint Einträge, die dann eine `origin`-Relationship zum eigentlichen Eintrag beinhalten. Durch die Angabe `?include=origin` im Querystring wird der eigentliche Beitrag direkt mitgeladen.

Da die Timeline sehr lang werden kann, gibt es keine Angaben dazu, wie viele weitere Beiträge noch folgen. Damit ist auch keine Paginierung mit Seitenzahlen möglich. Daher bieten wir hier eine Cursor-basierte Paginierung an.

```
/timeline-entries?page[limit]=5&page[cursor]=1234567890
```

Der Cursor ist der Timestamp, wann der letzte Beitrag erstellt wurde. Die Beiträge, die so geladen werden, werden damit älter sein als der angegebene Cursor. Am einfachsten kann dazu der Link unter `links.next` verwendet werden, wo der den Cursor schon richtig angegeben ist.

Mit `page[limit]=5` wird die Anzahl der zu ladenden Beiträge bestimmt werden. Wird nichts angegeben, werden 5 Beiträge geladen. Maximal können 30 Beiträge mit einem Request geladen werden.

## Die Timeline eines Users

Mit der [Timeline eines Users](spec/core/0.17/index.html#timeline-entries-die-timeline-entries-eines-users-get) ist es möglich, sich die Einträge wie bei der globalen Timeline zu holen. Abweichend davon sind alle Einträge vom angefragten User ausgelöst worden. Der neue Endpoint dazu lautet:

```
GET /users/<user_id>/timeline-entries/?include=origin
```

Includes und Paginierung sind hier gleich wie bei der globalen Timeline.

## Veraltet

Bei der Event Resource werden automatisch die Relationships `author` geladen. Dieses Verhalten wird sich in Zukunft ändern und es werden keine Relationships mehr automatisch geladen. Dadurch möchten wir die Responses in Zukunft kleiner halten.

Wenn deine App diese Relationships benötigt, dann solltest du sie ab sofort über den `include` Parameter im Querystring anfordern. Beispiel:

```
GET /events/1234?include=author
```

{% include links.html %}
