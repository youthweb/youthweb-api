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

##### Request

GET https://youthweb.net/index.php?action=account&cat=stats

##### Response

Der Response ist JSON und bietet diese Daten:

Feld | Typ | Beispiel | Beschreibung
-----|-----|----------|-------------
user_total | integer | 5503 | Die Anzahl aller User
user_total_female | integer | 2831 | Die Anzahl der weiblichen User
user_total_male | integer | 2672 | Die Anzahl der männlichen User
user_online | integer | 74 | Die Anzahl der User, die im Moment online sind
user_online_24h | integer | 629 | Die Anzahl der User, die in den letzten 24 Stunden online waren
user_online_7d | integer | 1035 | Die Anzahl der User, die in den letzten 7 Tagen online waren
user_online_30d | integer | 1600 | Die Anzahl der User, die in den letzten 30 Tagen online waren
userpics | integer | 3441 | Die Anzahl der User, die ein Profilbild hochgeladen haben

```json
{
  "data":
  {
    "user_total": 5503,
    "user_total_female": 2831,
    "user_total_male": 2672,
    "user_online": 74,
    "user_online_24h": 629,
    "user_online_7d": 1035,
    "user_online_30d": 1600,
    "userpics": 3441
  }
}
```

### Forum

#### Stats

Die Statistiken liefern die aktuellen Zahlen zum Forum auf Youthweb.

##### Request

GET https://youthweb.net/index.php?action=forum&cat=stats

##### Response

Der Response ist JSON und bietet diese Daten:

Feld | Typ | Beispiel | Beschreibung
-----|-----|----------|-------------
authors_total | integer | 1480 | Die Anzahl aller User, die mindestens einen Forenpost verfasst haben
threads_total | integer | 2094 | Die Anzahl aller Threads
posts_total | integer | 121387 | Die Anzahl aller verfasster Posts

```json
{
  "data":
  {
    "authors_total": 1480,
    "threads_total": 2094,
    "posts_total": 121387
  }
}
```

### Groups

#### Stats

Die Statistiken liefern die aktuellen Zahlen zu den Gruppen auf Youthweb.

##### Request

GET https://youthweb.net/index.php?action=groups&cat=stats

##### Response

Der Response ist JSON und bietet diese Daten:

Feld | Typ | Beispiel | Beschreibung
-----|-----|----------|-------------
groups_total | integer | 614 | Die Anzahl der Gruppen auf Youthweb
users_total | integer | 2073 | Die Anzahl der User, die einer Gruppe angehören

```json
{
  "data":
  {
    "groups_total": 614,
    "users_total": 2073
  }
}
```

## [Changelog](https://github.com/youthweb/youthweb-api/blob/master/CHANGELOG.md)

Der Changelog ist [hier](https://github.com/youthweb/youthweb-api/blob/master/CHANGELOG.md) zu finden und folgt den Empfehlungen von [keepachangelog.com](http://keepachangelog.com/).
