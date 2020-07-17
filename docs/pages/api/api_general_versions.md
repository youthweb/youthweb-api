---
title: Versionierung
keywords: Youthweb-API, Versionierung
tags: [getting_started]
summary: "Die Versionierung der Youthweb-API"
sidebar: api_sidebar
permalink: api_general_versions.html
folder: api
---

Die API wird immer weiter entwickelt und der aktuelle Stand wird hier festgehalten. Die Änderungen an der API werden während der Entwicklung nicht immer abwärtskompatibel sein, weswegen wir [eine Versionierung](http://semver.org/) eingeführt haben. Die angefragte Version MUSS im Request-Header angegeben werden:

`Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.16`

### Support

{% include note.html content="Jede Version wird für mindestens 1 Jahr unterstützt." %}

Nach dem Release einer neuen Version garantieren wir den Support der Version ohne Breaking Changes für mindestens 1 Jahr. Mindestens 6 Monaten nach dem Release und der Verfügbarkeit einer neueren Version wird eine Warnung in jedem Response angezeigt. Wenn der Support für eine Version abgelaufen ist, kann sie nicht mehr verwendet werden und Request zu dieser veralteten Version werden einen `406 Not Acceptable`-Error zurückgeben.

### Versions-Übersicht

| Version      | Status             | Veröffentlicht | Unterstützt bis           |
|--------------|--------------------|----------------|---------------------------|
| **0.16**     | :heavy_check_mark: | 2020-07-26     | mindestens 2021-07-26     |
| **0.15**     | :warning:          | 2019-09-08     | mindestens 2021-01-26     |
| 0.14         | :x:                | 2019-01-13     | Version 0.16 - 2020-07-26 |
| 0.13         | :x:                | 2018-12-16     | Version 0.16 - 2020-07-26 |
| 0.12         | :x:                | 2017-07-16     | Version 0.15 - 2019-09-08 |
| 0.11         | :x:                | 2017-07-02     | Version 0.15 - 2019-09-08 |
| 0.10         | :x:                | 2017-06-18     | Version 0.15 - 2019-09-08 |
| 0.9          | :x:                | 2017-06-04     | Version 0.15 - 2019-09-08 |
| 0.8          | :x:                | 2017-05-21     | Version 0.15 - 2019-09-08 |

#### Status-Legende

- :heavy_check_mark: **supported**: unterstützte Version
- :warning: **deprecated**: veraltete, aber unterstütze Version, die eine Warnung in jedem Response anzeigt
- :x: **unsupported**: nicht mehr unterstützte Version, die einen 406-Error zurückgibt

{% include links.html %}
