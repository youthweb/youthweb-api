# Youthweb API

## Übersicht

Dies ist die offizielle API von [youthweb.net](https://youthweb.net).

Aktuelle Version: 0.0.1 (12.10.2014)

Status: Alpha

Online Dokumentation: http://docs.youthweb.apiary.io/

## URI

Die API ist im ersten Entwurf über https://youthweb.net erreichbar. Diese URI kann sich in Zukunft ändern.

Die API wird immer weiter entwickelt und der aktuelle Stand wird hier festgehalten. Dieser erste Entwurf erlaub nur lesenden Zugriff, aber in Zukunft wird ein userbasierter Zugriff mit OAuth möglich sein. Die Änderungen an der API werden nicht immer abwärtskompatibel sein, weswegen wir bald eine Versionierung einführen werden.

## Resources

### Account

#### Stats

Die Statistiken liefern die aktuellen Zahlen zu den Accounts auf Youthweb. Sie sind über diese URI aufrufbar:

Der Response ist JSON und bietet diese Daten:

Feld | Beschreibung
-----|-------------
user_total | Die Anzahl aller User
user_online | Die Anzahl der User, die online sind

Beispiel: https://youthweb.net/index.php?action=account&cat=stats

```json
{
  "user_total":5503,
  "user_online":74
}
```

## History

### 0.0.1 (12.10.2014)

* Erster Release
