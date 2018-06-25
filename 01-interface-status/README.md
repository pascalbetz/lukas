# Aufgabe

In der Datei _input.txt_ ist der output von einem Netzwerk Element für das Kommando
`show interface status`.

Parse diese Date und erstelle folgende Datenstruktur:

```
{
  "Gi1/1" => {
    "name" => "Beschreibung",
    "status" => "disabled",
    "vlan" => "routed",
    "duplex" => "full",
    "speed" => "1000",
    "type" => "No Gbic"
  },
  ...
}
```

* Du kommst nicht weiter? Einfach Fragen!
* Schreibe den Parser in Ruby (danach kansnt du auch noch eine Java Variante schreiben, wenn du magst).
* Verwende dazu keine Zusatzbibliotheken sondern nur Standard Libraries.
* Die Datei `parser.rb` enthällt ein "Skelett" für die Lösung, implementiere die Methode `parse`
* Die Datei `test.rb` enthällt "alle" tests für den Parser
* Starte die tests mit `ruby test.rb` aus dem Verzeichnis `01-interface-status`
* Arbeite Schritt-für-Schritt an der Implementation, so dass am Schluss alle tests OK sind
* Wenn ein Feld leer ist (z.B. `""` oder `"  "`), dann mache `nil` draus
* `[]` ist ein Array, also eine Sammlung von Objekten welche index-basiert gespeichert und gelesen werden können.
* `{}` ist ein Hash (Map, HashMap, assoziatives Array, ...). Eine Sammlung von Objekten (value) welche mittels Schlüssel (key) abgelegt werden
* Nicht alle Felder sind Pflichtfelder in der input Datei


---

# Tips

* Reguläre Ausdrücke (Regular Expressions, Regexp, Regex) sind hilfreich
* Die Webseite http://rubular.com ist sehr hilfreich beim testen von Regulären Ausdrücken
