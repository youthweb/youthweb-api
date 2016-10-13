---
title: Versionierung
keywords: Youthweb-API, Versionierung
tags: [getting_started]
summary: "Die Versionierung der Youthweb-API"
sidebar: api_sidebar
permalink: api_versions.html
folder: api
---

Die API wird immer weiter entwickelt und der aktuelle Stand wird hier festgehalten. Die Änderungen an der API werden während der Entwicklung nicht immer abwärtskompatibel sein, weswegen wir [eine Versionierung](http://semver.org/) eingeführt haben. Die angefragte Version MUSS im Request-Header angegeben werden:

`Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.5`

### Unterstützte Versionen

| Version | Status                         | Veröffentlicht | Unterstützt bis          |
|---------|--------------------------------|----------------|--------------------------|
| **0.5** | :white_check_mark: unterstützt | 2016-07-03     | *n/a*                    |
| **0.4** | :white_check_mark: unterstützt | 2016-03-27     | *n/a*                    |
| **0.3** | :warning: veraltet             | 2015-10-11     | *n/a*                    |
| <= 0.2  | :x: nicht mehr unterstützt     | 2015-06-21     | Release 0.4 - 2016-03-27 |

{% include links.html %}
