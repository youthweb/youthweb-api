---
title: Contribute
keywords: Youthweb-API, Contributing, Contribute
tags: [getting_started]
summary: "Hilf mit"
sidebar: api_sidebar
permalink: api_contribute.html
folder: api
---

Du kannst mithelfen, die Youthweb-API zu gestalten, indem du an diesem Projekt mitarbeitest. Du kannst Fehler melden, Features vorschlagen oder bei der Dokumentation helfen. Wenn die geplante API auf dem Live-Server von Youthweb umgesetzt ist, bekommt die API einen neuen [Release](https://github.com/youthweb/youthweb-api/releases).

## API

Um Bugs oder Features zu testen, solltest du die Änderungen lokal testet. Dazu benötigst du PHP und NodeJS.

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

```
vendor/bin/behat --suite=develop
```

Anschließend kannst du deine Änderungen mit einem Pull-Request einreichen.

## Dokumentation

Die Dokumentation befindet sich im Order [/docs](https://github.com/youthweb/youthweb-api/tree/master/docs) und wird dank der Github-Pages automatisch mit Jekyll deployed. Wenn du Fehler korrigieren oder Ergänzugen einreichen möchtest, dann freuen wir uns auf deinen Pull-Request.

{% include links.html %}
