---
title:  "Youthweb-API 0.12 liefert mehr Daten zu Usern und Events"
categories: API
tags: [api, release]
summary: "Die neue Version der Youthweb-API liefert mehr Daten zu Usern und eine Adresse bei Events. Außerdem werden zwei Attribute bei den Usern in Zukunft auch `null` sein können."
---

## Neue Userdaten

Die `User`-Resource beinhaltet jetzt diese neuen Attribute:

- `gender` mit dem Geschlecht des Users. Dies kann `male` oder `female` sein.
- `timezone` mit dem Namen der Zeitzone des Users, z.B. `Europe/Berlin`.
- `contact_homepage` mit einer Url zur Webseite des Users.
- `contact_twitter` mit dem Twitter-Usernamen.
- `description_text` mit einer sonstigen Beschreibung des Users.
- `description_character` mit einer Charakter-Beschreibung des Users.
- `description_food` mit dem Lieblingsessen des Users.
- `description_links` mit Links, die der User empfiehlt. Hier gilt es zu beachten, dass die Links sehr wahrscheinlich BBCode enthalten.
- `picture_description` mit der Beschreibung des Profilbildes.

Wenn ein Attribute leer ist (einen leeren String enthält), dann hat der User zu diesem Attribute nicht angegeben. Zu beachten ist weiterhin, dass ein User all diese Attribute mithilfe der Datenschutz-Einstellungen verbergen kann. Bei fehlender Berechtigung werden diese Attribute dann `null` enthalten.

## Geänderte Userdaten

Das Verhalten von zwei Attributen in der `User`-Resource hat sich geändert. Die Attribute `created_at` mit der Registrierzeitpunkt und `last_login` mit dem letzten Online-Zeitpunkt des Users kann in Zukunft durch den User in den Datenschutz-Einstellungen verborgen werden und daher nur `null` enthalten.

Um die Abwärts-Kompatibilität mit alten API-Versionen zu erhalten, werden diese Attribute auch weiterhin Daten enthalten. Die Attribute werden erst `null` ausliefern, wenn die alten API-Versionen nicht mehr unterstützt werden.

## Die Adresse bei Events

Auf Youthweb gibt es noch keine Möglichkeit einem Event einen Ort zuzuweisen, außer in der Eventbeschreibung selber. Es gibt aber die Möglichkeit, ein Event mit einer lokalen Gruppe zu verbinden und diese Gruppen besitzen eine Ortsangabe. Daher haben wir vorübergehend ein neues Attribut `address` in den `Event`-Resourcen eingeführt, die die Adresse einer veranstaltenden lokalen Gruppe enthalten kann. Wir möchten aber explizit darauf hinweisen, dass sich dieses Attribute in Zukunft ändern wird, wenn eine gesonderte Ortsangabe bei Events möglich wird.

## Upgrade

Die Youthweb-API 0.12 ist ab sofort aktiv und die neuen Attribute können jetzt verwendet werden. Du solltest in deinen Apps und Anwendungen jetzt den Accept Header mit der neuen API-Version verwenden:

```
Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.12
```

Bei Fragen oder Verbesserungsvorschläge [eröffne einfach ein Issue auf Github](https://github.com/youthweb/youthweb-api/issues/new) oder melde dich [im Forum](https://youthweb.net/forum/categories/7) oder [auf Twitter bei @youthweb_dev](ttps://twitter.com/youthweb_dev).

{% include links.html %}
