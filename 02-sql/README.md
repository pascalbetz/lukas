# Aufgabe

SQLITE3 ist eine SQL basierende Datenbank. Sie eignet sich gut für kleine Projekte oder
für Tests.


Es gibt folgende Tabellen:


```
people:
id | name | age | department_id

departments:
id | name
```

Die Spalte `department_id` ist ein _FOREIGN KEY_ (Fremdschlüssel) welche die Tabellen _people_ und _departments_ "verbindet".


Die Datei `finder.rb` beinhaltet wieder ein Skelett und die Datei `test.rb` die zugehörigen Tests.

* Schreibe die zwei SQL queries die angedeutet wurden
* Nachdem du dies gemacht hast: die zwei Methoden in `Finder` haben viele Dinge gemein. Kann man dies optimieren/verbessern?
* Was passiert, wenn bei der Abfrage ein Fehler auftritt? Wird die DB sauber geschlossen? Kann man dies verbessern?
