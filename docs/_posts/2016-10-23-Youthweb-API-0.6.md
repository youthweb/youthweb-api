---
title:  "Youthweb-API 0.6"
categories: API
tags: [api, release]
---
## Änderungen


### Neu

- Die Youthweb-API hat eine neue Autorisierung über OAuth2 erhalten. Konkret haben wir das OAuth2 Authorization Code Grant umgesetzt, siehe [https://youthweb.github.io/youthweb-api/api_oauth2.html](https://youthweb.github.io/youthweb-api/api_oauth2.html)
- Wir haben eine neue Resource `me/` eingeführt, die die Daten zumautorisierten User zurückliefert.
- Wir haben eine neue Hilfeplattform für Entwickler aufgesetzt: [https://youthweb.github.io/youthweb-api](https://youthweb.github.io/youthweb-api)

### Änderungen

- Die URL zur Youthweb-API hat sich von https://youthweb.net zu https://api.youthweb.net geändert. Bitte schicke alle API Requests nur noch an die neue URL. Die alte wird aus BC-Gründen aber noch einige Zeit weiter funktionieren.

### Veraltet

- Der Endpoint `/auth/token` für die Generierung von Access Token durch User-Token ist veraltet. Verwende stattdessen die neue OAuth2 Methode, siehe [https://youthweb.github.io/youthweb-api/api_oauth2.html](https://youthweb.github.io/youthweb-api/api_oauth2.html).
- Die Verwendung der alten API-Url (https://youthweb.net) für API-Requests ist veraltet. Bitte verwende nur noch die neue Url.
- Die Versionen 0.4 und 0.5 der Youthweb-API ist jetzt veraltet und werden mit dem Erscheinen einer neuen Version nicht mehr funktionieren. Wenn deine Apps noch eine dieser Versionen verwendet, dann upgrade sie bitte auf die Version 0.6.

### Entfernt

- **Breaking:** Der Support für die Youthweb-API 0.3 wurde eingestellt. Requests mit dieser und tieferen Versionsnummern werden einen 406 Fehler Response erhalten.

{% include links.html %}
