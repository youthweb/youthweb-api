---
title:  "Youthweb-API 0.18 verbessert die Pointer bei Fehlermeldungen"
categories: API
tags: [api, release]
summary: "Youthweb-API 0.18 zeigt über Pointer genauer an, wo das Problem an einem fehlerhaften Request liegt."
---
## Genauere Fehlermeldungen dank Pointer

Wenn beim Request zur Erstellung einer Resource einige Angaben fehlen oder fehlerhaft sind, dann gibt die API einen Fehler zurück. Bisher sah so aus:

```
POST /posts/bc2246c3-da0f-4457-8f29-f46a14d33353/comments

{
  "data": {
    "type": "comments",
    "attributes": {
      "content": ""
    }
  }
}
```

Es wird versucht, einen Kommentar mit leerem `content` Attribute zu erstellen. Der Server hat daher bisher mit diesem Fehler geantwortet:

```
422 Unprocessable Entity

{
  "errors": [
    {
      "status": "422",
      "title": "Unprocessable Entity",
      "detail": "The field `attributes.content` can't be empty."
    }
  ]
}
```

Im `detail` kann man sehen, dass sich der Fehler auf das Feld `attributes.content` bezieht. Richtig müsste es aber `data.attributes.content` heißen. Ein weiterer Nachteil dieser Meldung ist, dass sie technische Details enthält, die man den Usern nicht anzeigen kann. [Auch gibt die JSON:API Spezifikation vor](https://jsonapi.org/format/#error-objects), dass das `detail` Feld eine leicht verständliche Erklärung ("human-readable explanation") enthalten muss.

Wir folgen daher der Spezifikation und werden alle Fehlermeldungen auf `pointer` umstellen. Den Anfang machen die Kommentare.

Die Antwort auf den Request mit leerem `content`-Feld wird also jetzt so aussehen:

```
409 Conflict

{
  "errors": [
    {
      "status": "409",
      "title": "Request body has invalid attributes",
      "detail": "Must be at least 1 characters long",
      "source": {
        "pointer": "data.attributes.content"
      }
    }
  ]
}
```

Der Pointer gibt also genau das Feld an, das ein Problem hat. Gleichzeitig sind die Fehlerdetails einfacher zu verstehen und können in Apps übersetzt oder direkt angezeigt werden.

## Veraltet

Bei der Comment Resource werden automatisch die Relationships `author` und `parent` geladen. Dieses Verhalten wird sich in Zukunft ändern und es werden keine Relationships mehr automatisch geladen. Dadurch möchten wir die Responses in Zukunft kleiner halten.

Wenn deine App diese Relationships benötigt, dann kannst du sie über den `include` Parameter im Querystring anfordern. Beispiel:

```
GET /comments/987654?include=author,parent
```

Die Version 0.16 und 0.17 sind jetzt veraltet und zeigen eine Warnung im `meta`-Bereich an. In frühstens 6 Monaten wird die Unterstützung für diese Version entfernt. Stelle deine Apps am besten bald auf die Version 0.18 um.

## Entfernt

**Breaking:** Seit Version 0.15 haben wir in der Event Resource das `participants_count` Attribute als deprecated markiert. Stattdessen sollte das `promised_participants_count` Attribute verwendet werden. Mit der Version 0.18 haben wir das `participants_count` Attribute entfernt.

**Breaking:** Der Support für die Version 0.15 wurde eingestellt. Sie war seit der Version 0.16 (26.07.2020) als deprecated markiert. Requests mit diesen Versionen erhalten jetzt einen 406 Error zurück.

{% include links.html %}
