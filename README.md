# Youthweb API

## Übersicht

Dies ist die offizielle API von [youthweb.net](https://youthweb.net).

Aktuelle Version: 0.0.2 (20.12.2014)

Status: Alpha

Online Dokumentation: http://docs.youthweb.apiary.io/

## URI

Die API ist im ersten Entwurf über https://youthweb.net erreichbar. Diese URI kann sich in Zukunft ändern.

Die API wird immer weiter entwickelt und der aktuelle Stand wird hier festgehalten. Dieser erste Entwurf erlaubt nur lesenden Zugriff, aber in Zukunft wird ein userbasierter schreibender Zugriff mit OAuth möglich sein. Die Änderungen an der API werden während der Entwicklung nicht immer abwärtskompatibel sein, weswegen wir bald eine Versionierung einführen werden.

## Resources

### Account

#### Stats

Die Statistiken liefern die aktuellen Zahlen zu den Accounts auf Youthweb, die auch auf der https://youthweb.net einsehbar sind.

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
  "user_total": 5503,
  "user_total_female": 2831,
  "user_total_male": 2672,
  "user_online": 74,
  "user_online_24h": 629,
  "user_online_7d": 1035,
  "user_online_30d": 1600,
  "userpics": 3441
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
  "authors_total": 1480,
  "threads_total": 2094,
  "posts_total": 121387
}    
```

### Youthgroups

#### Stats

Die Statistiken liefern die aktuellen Zahlen zu den Jugendgruppen auf Youthweb.

##### Request

GET https://youthweb.net/index.php?action=youthgroups&cat=stats

##### Response

Der Response ist JSON und bietet diese Daten:

Feld | Typ | Beispiel | Beschreibung
-----|-----|----------|-------------
youthgroups_total | integer | 614 | Die Anzahl der Jugendgruppen auf Youthweb
users_total | integer | 2073 | Die Anzahl der User, die einer Jugendgruppe angehören

```json
{
  "youthgroups_total": 614,
  "users_total": 2073
}    
```

## History

### 0.0.2

* Die Account-Statistiken liefern mehr Daten
* In den Account-Statistiken liefert das Feld "user_total" nur noch aktive Accounts
* Statistiken zum Forum und Jugendgruppen wurden ergänzt

### 0.0.1 (12.10.2014)

* Erster Release
