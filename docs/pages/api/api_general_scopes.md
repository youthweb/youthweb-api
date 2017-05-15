---
title: Scopes
keywords: Youthweb-API, Oauth2, Scopes
tags: [getting_started]
summary: "Diese Scopes können bei der Authorization verwendet werden"
sidebar: api_sidebar
permalink: api_general_scopes.html
folder: api
---

Bei der [Authorization eines Clients][api_general_oauth2] kann optional der Scope angegeben werden. Die folgenden Scopes können angegeben werden:

- _(kein Scope)_: Zugriff auf alle öffentlichen Daten, die auch jeder andere eingeloggte User sehen darf
- `post:read`: Erlaubt den Lese-Zugriff auf alle eigenen Pinnwand-Posts und die der Freunde
- `user:email`: Erlaubt den Lese-Zugriff auf die eigene Email-Adresse
- `user:read`: Erlaubt den Lese-Zugriff auf die eigenen Profil-Daten, einschließlich der versteckten oder nur für Freunde sichtbaren Daten. Beinhaltet `user:email`.

{% include links.html %}
