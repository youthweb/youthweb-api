# Youthweb API

[![Latest Version](https://img.shields.io/github/release/youthweb/youthweb-api.svg)](https://github.com/youthweb/youthweb-api/releases)
[![Software License GLPv2](http://img.shields.io/badge/License-GPLv2-brightgreen.svg)](LICENSE)
[![Build Status](https://travis-ci.org/youthweb/youthweb-api.svg?branch=develop)](https://travis-ci.org/youthweb/youthweb-api)
[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/youthweb/youthweb-api?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

## Übersicht

Dies ist die offizielle API von [youthweb.net](https://youthweb.net).

## Dokumentation

Aktuelle Dokumentation: http://docs.youthweb0m4.apiary.io/

Dev-Dokumentation: http://docs.youthweb.apiary.io/

## URI

Die API ist im ersten Entwurf über https://youthweb.net erreichbar. Diese URI wird sich in Zukunft ändern.

## Autorisierung

Die meisten Resourcen benötigen eine Autorisierung. Dazu muss sich der Client zuerst authentifizieren.

1. Generiere dir [hier](https://youthweb.net/settings/token) ein User-Token. Dieses User-Token wird auch `token_secret` genannt und muss wie ein Passwort geheim gehalten werden.
2. Sende deinen `username` und dein `token_secret` an `POST /auth/token`, um ein [JWT](http://jwt.io/) zu erhalten. Genauere Informationen sind [in der Dokumentation](http://docs.youthweb.apiary.io/#reference/auth) zu finden.
3. Das JWT ist ein zeitlich begrenztes Token, dass bei allen weiteren Requests im Header mitgegeben wird: `Authorization: Bearer <JWT>`

Wenn das JWT fast abgelaufen ist, wird bei Requests automatisch ein neues JWT zur Verfügung gestellt, dass weiter verwendet werden kann. Alternativ kann man sich wie oben beschrieben ein neues JWT anfordern.

## Versionierung

Die API wird immer weiter entwickelt und der aktuelle Stand wird hier festgehalten. Die Änderungen an der API werden während der Entwicklung nicht immer abwärtskompatibel sein, weswegen wir [eine Versionierung](http://semver.org/) eingeführt haben. Die angefragte Version MUSS im Request-Header angegeben werden:

`Accept: application/vnd.api+json, application/vnd.api+json; net.youthweb.api.version=0.4`

### Unterstützte Versionen

| Version | Status | Veröffentlicht | Unterstützt bis |
|---------|--------|----------------|-----------------|
| **0.4** | :white_check_mark: unterstützt | 2016-03-27 | *n/a* |
| **0.3** | :warning: veraltet | 2015-10-11 | *n/a* |
| 0.2 und darunter | :x: nicht mehr unterstützt | 2015-06-21 | Release 0.4 - 2016-03-27 |

## Contribute

Du kannst mithelfen, diese API zu gestalten, indem du an diesem Projekt mitarbeitest. Wenn die geplante API auf dem Live-Server von Youthweb umgesetzt ist, bekommt die API einen neuen [Release](https://github.com/youthweb/youthweb-api/releases).

### Installation

1. Forke dieses Projekt in deinen eigenen Account.
2. Clone das Projekt mit ```git clone git@github.com:<username>/youthweb-api.git``` und wechsle in das neue Verzeichnis.
3. Installiere Composer und alle Abhänigkeiten:

  ```
  curl http://getcomposer.org/installer | php
  php composer.phar install
  ```
4. Installiere die NPM-Abhängigkeiten und starte den Drakov Mock-Server:

  ```
  npm install
  ./node_modules/drakov/drakov -f ./apiary.apib -p 3000
  ```
5. Teste deine API mit ```vendor/bin/behat --suite=develop```. Wenn die Tests erfolgreich durchlaufen, dann ist alles richtig installiert.

### Änderungen

Du kannst jetzt deine gewünschten Änderungen im [API-Blueprint](apiary.apib) durchführen und diese mit einem [Behat-Feature](features/apiblueprint) absichern. Vergiss nicht, deine Änderungen zu testen:

```vendor/bin/behat --suite=develop```

Anschließend kannst du deine Änderungen mit einem Pull-Request einreichen.

## Clients

Diese Clients vereinfachen den Zugriff auf die API. Wenn du einen eigenen Client entwickelt hast, dann gib uns Bescheid und wir ergänzen ihn hier.

### PHP

Es gibt einen [objektorientierten Client in PHP](https://github.com/youthweb/php-youthweb-api), der die API abbildet.

## Resources

Wirf einen Blick in die [Dokumentation](#dokumentation), um alle verfügbaren Resourcen anzuzeigen.

## Changelog

Der Changelog ist [hier](CHANGELOG.md) zu finden und folgt den Empfehlungen von [keepachangelog.com](http://keepachangelog.com/).
