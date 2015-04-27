# Youthweb API

[![Latest Version](https://img.shields.io/github/release/youthweb/youthweb-api.svg?style=flat-square)](https://github.com/youthweb/youthweb-api/releases)
[![Software License GLPv2](http://img.shields.io/badge/License-GPLv2-brightgreen.svg?style=flat-square)](LICENSE)
[![Build Status](http://img.shields.io/travis/youthweb/youthweb-api.svg?style=flat-square)](https://travis-ci.org/youthweb/youthweb-api)
[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/youthweb/youthweb-api?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

## Übersicht

Dies ist die offizielle API von [youthweb.net](https://youthweb.net).

Aktuelle Version: 0.1 (2014-12-17)

Status: Alpha

Online Dokumentation: http://docs.youthweb0m1.apiary.io/

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
4. Erstelle einen neuen API Mock-Server auf [apiary.io](http://apiary.io/) und kopiere die [API-Blueprint](https://github.com/youthweb/youthweb-api/blob/master/apiary.apib) dorthin. Du kannst auch apiary.io mit Github synchronisieren, um diesen Schritt zu automatisieren.
5. Passe die ```base_url``` in [behat-dev.yml](https://github.com/youthweb/youthweb-api/blob/master/tests/behat/behat-dev.yml) zu deinem Mockserver an.
6. Teste deine API mit ```tests/behat/bin/behat -c tests/behat/behat-dev.yml```. Wenn die Tests erfolgreich durchlaufen, dann ist alles richtig installiert.

### Änderungen

Du kannst jetzt deine gewünschten Änderungen im  [API-Blueprint](https://github.com/youthweb/youthweb-api/blob/master/apiary.apib) durchführen und diese mit einem [Behat-Feature](https://github.com/youthweb/youthweb-api/tree/master/tests/behat/features) absichern. Vergiss nicht, deine Änderungen zu testen:

```tests/behat/bin/behat -c tests/behat/behat-dev.yml```

Anschließend kannst du deine Änderungen mit einem Pull-Request einreichen.

## Clients

### PHP

Es gibt einen [objektorientierten Client in PHP](https://github.com/youthweb/php-youthweb-api), der die API abbildet.

## Resources

### Account

#### Stats

Die Statistiken liefern die aktuellen Zahlen zu den Accounts auf Youthweb, die auch auf [youthweb.net](https://youthweb.net) einsehbar sind.

Der Response ist JSON und bietet diese Daten:

Feld | Typ | Beispiel | Beschreibung
-----|-----|----------|-------------
user_total | integer | 5503 | Die Anzahl aller User
user_online | integer | 74 | Die Anzahl der User, die online sind

Beispiel: GET https://youthweb.net/index.php?action=account&cat=stats

```json
{
  "user_total":5503,
  "user_online":74
}
```

## [Changelog](https://github.com/youthweb/youthweb-api/blob/master/CHANGELOG.md)

Der Changelog ist [hier](https://github.com/youthweb/youthweb-api/blob/master/CHANGELOG.md) zu finden und folgt den Empfehlungen von [keepachangelog.com](http://keepachangelog.com/).
