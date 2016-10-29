---
title: Scopes
keywords: Youthweb-API, Oauth2, Scopes
tags: [getting_started]
summary: "Die Youthweb-API verwendet OAuth2 zur Authorization"
sidebar: api_sidebar
permalink: api_scopes.html
folder: api
---

Bei der [Authorization eines Clients][api_oauth2] kann optional der Scope angegeben werden. Die folgenden Scopes können angegeben werden:

- _(kein Scope)_: Zugriff auf alle öffentlichen Daten, die auch jeder andere eingeloggte User sehen darf
- `user:email`: Erlaubt den Lese-Zugriff auf die eigene Email-Adresse
- `user:read`: Erlaubt den Lese-Zugriff auf die eigenen Profil-Daten, einschließlich der versteckten oder nur für Freunde sichtbaren Daten. Beinhaltet `user:email`.

{% include links.html %}
