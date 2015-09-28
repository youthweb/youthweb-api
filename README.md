# Youthweb API

[![Latest Version](https://img.shields.io/github/release/youthweb/youthweb-api.svg)](https://github.com/youthweb/youthweb-api/releases)
[![Software License GLPv2](http://img.shields.io/badge/License-GPLv2-brightgreen.svg)](LICENSE)
[![Build Status](https://travis-ci.org/youthweb/youthweb-api.svg?branch=develop)](https://travis-ci.org/youthweb/youthweb-api)
[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/youthweb/youthweb-api?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

## Übersicht

Dies ist die offizielle API von [youthweb.net](https://youthweb.net).

Aktuelle Version: 0.3-dev

## Dokumentation

Aktuelle Dokumentation: http://docs.youthweb0m2p1.apiary.io/

Dev-Dokumentation: http://docs.youthweb.apiary.io/

## URI

Die API ist im ersten Entwurf über https://youthweb.net erreichbar. Diese URI kann sich in Zukunft ändern.

Die API wird immer weiter entwickelt und der aktuelle Stand wird hier festgehalten. Dieser erste Entwurf erlaubt nur lesenden Zugriff, aber in Zukunft wird ein userbasierter schreibender Zugriff mit OAuth möglich sein. Die Änderungen an der API werden während der Entwicklung nicht immer abwärtskompatibel sein, weswegen wir [eine Versionierung](http://semver.org/) eingeführt haben.

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

Du kannst jetzt deine gewünschten Änderungen im [API-Blueprint](https://github.com/youthweb/youthweb-api/blob/master/apiary.apib) durchführen und diese mit einem [Behat-Feature](https://github.com/youthweb/youthweb-api/tree/master/tests/behat/features) absichern. Vergiss nicht, deine Änderungen zu testen:

```vendor/bin/behat --suite=develop```

Anschließend kannst du deine Änderungen mit einem Pull-Request einreichen.

## Clients

### PHP

Es gibt einen [objektorientierten Client in PHP](https://github.com/youthweb/php-youthweb-api), der die API abbildet.

## Resources

Wirf einen Blick in die [Dokumentation](#dokumentation), um alle verfügbaren Resourcen anzuzeigen

## [Changelog](CHANGELOG.md)

Der Changelog ist [hier](CHANGELOG.md) zu finden und folgt den Empfehlungen von [keepachangelog.com](http://keepachangelog.com/).
