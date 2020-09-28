# Fazit

Um dieses Produkt in größerer Stückzahl bauen zu können, wäre es sinnvoll die Hauptplatine von einem Leiterplattenhersteller fertigen zu lassen, um sich viel manuelles Löten zu ersparen.

Rückblickend hätten wir Motoren mit Encodern oder direkt Schrittmotoren verbauen sollen, da dies eine enge Regelung von Drehzahl und Leistung ermöglicht hätte und eine gleichförmige und somit gerade Bewegung einfacher gemacht hätte.

Die Messwerte des Ultraschallsensors waren nicht präzise und verlässlich genug, deshalb waren Workarounds und eine komplexere Erkennungslogik notwendig. 
Für eine höhere Verlässlichkeit, werden z.B. viele Messungen hintereinander gemacht, dies verringert jedoch die effektive Auflösung durch die verlangsamte Zykluszeit.

Bei unserer Referenzimplementierung wird beim Suchen immer im Uhrzeigersinn und beim Zurückdrehen gegen den Uhrzeigersinn gedreht. Dieses Verhalten könnte optimiert werden, indem sich beim Zurückdrehen für die Richtung mit dem kleineren Winkel entschieden wird.

Wenn der Schatz beim Daraufzufahren seitlich verpasst wird, könnte in beide Richtungen gepeilt werden und der Mittelpunkt von Erkennung und Verlust als Zielrichtung genutzt werden.

Um die Gyro-Bibliothek stabil verwenden zu können, musste der Sensor zweimal initialisiert werden. Dieser Workaround hat viel Zeit und Testen gebraucht. Alternative Bibliotheken hatten das gleiche Problem.

PlatformIO hat eine etwas höhere Einstiegshürde als Arduino IDE, ist aber komfortabler nutzbar.

Die LEDs als Statusanzeige sind ist beliebig erweiterbar, zum Beispiel durch das Anzeigen von Werten, Zuständen oder Fehlern.
Somit könnten Messewerte, Distanz, Winkel oder Geschwindigkeiten abgebildet werden. 
Die Gruppen können frei entscheiden was sie anzeigen wollen, da ein direkter Zugriff auf die LEDs möglich ist.

Durch das gelbe Gehäuse werden die Farben der LEDs etwas verfälscht, dies könnte durch Gammakorrektur kompensiert werden.


