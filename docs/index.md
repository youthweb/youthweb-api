---
title: Willkommen zur offizielle API von Youthweb
keywords: Youthweb API
tags: [getting_started]
sidebar: api_sidebar
permalink: index.html
summary: Mithilfe der Youthweb-API kannst du Apps und Dienste rund um Youthweb bauen. Auf dieser Seite findest du alle Informationen dazu und erhältst Updates über die neusten Änderungen.
toc: false
---

{% include image.html file="Fotolia_105395097_M.jpg" alt="Working together" caption="© Rawpixel.com / Fotolia" %}

## :tada: Das Neuste aus dem Entwickler-Blog

<ul class="past">
{% for post in site.posts limit:3 %}
{% capture i18n_date %}
{% assign m = post.date | date: "%-m" | minus: 1 %}
{{ post.date | date: "%-d" }}. {{ site.de.months[m] }} {{ post.date | date: "%Y" }}
{% endcapture %}
    <li><time>{{ i18n_date }}</time><a href="{{ post.url | remove: "/" }}">{{ post.title }}</a></li>
{% endfor %}
</ul>

Weitere Posts findest du [in unserem Blog][blog]. Du kannst auch unseren <span class="fa fa-rss"></span> [RSS-Feed]({{ "feed.xml" | prepend: site.baseurl | prepend: site.url }}) abonnieren.

## :book: Dokumentation

[https://developer.youthweb.net](http://developer.youthweb.net/)

## :link: URI

Die API ist über `https://api.youthweb.net` erreichbar.

## :key: Autorisierung

Hier kannst du lesen, wie du mit deiner App auf geschützte Resourcen der Youthweb-API zugreifen kannst: [OAuth2][api_general_oauth2]

## :memo: Versionierung

Die API wird immer weiter entwickelt und der aktuelle Stand wird hier festgehalten. Wie das genau funktioniert, findest du hier: [Versionierung][api_general_versions]

## :construction_worker: Contribute

Du kannst mithelfen, die Youthweb-API zu gestalten. Hier findest du mehr Informationen dazu: [Contribute][api_guideline_contribute]

## :electric_plug: Clients

Diese Clients vereinfachen den Zugriff auf die API. Wenn du einen eigenen Client entwickelt hast, dann gib uns Bescheid und wir ergänzen ihn hier.

### PHP

Es gibt einen [objektorientierten Client in PHP](https://github.com/youthweb/php-youthweb-api), der die API abbildet.

## :pencil2: Changelog

Der Changelog ist [hier](https://github.com/youthweb/youthweb-api/blob/develop/CHANGELOG.md) zu finden und folgt den Empfehlungen von [keepachangelog.com](http://keepachangelog.com/).

{% include links.html %}
