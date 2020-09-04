# Die Entwicklung

Die Entwicklung lässt sich in 7 Milestones über einen Verlauf von 15 Wochen unterteilen.

TODO wie übergreifende Issues erklären? Encoder bestellen wäre M1, wird aber erst in M3 erklärt

Aufgaben wurden ursprünglich nach logischen Komponenten wie Angel, Sonar und Gehäuse unterteilt, diese Aufteilung war in der Praxis aber nur schwer einzuhalten. Daher wurden viele Aufgaben in der Umsetzung eher nach der behandelten Disziplinen gruppiert. 



## Milestone 1: Orientierung

### Definition
Um die genaue Zielsetzung festzuhalten wurde ein initialer Vortrag vorbereitet, der die Zielsetzung des Projekts festhalten soll. 

TODO https://docs.google.com/presentation/d/1X0VR1WAZExtkcRi5N46J-1ufT67DiJy896XK1zQV_ug

Erstes Feedback hat alternative Implementationen mit hängendem Aufbau statt Reifen eröffnet, der Vorschlag wurde allerdings aufgrund mechanischer Komplexität und geringer Flexibilität verworfen. 

Use-Cases: 
1. Als Lehrer will ich das Gerät einfach auf den Ursprungszustand zurücksetzen
1. Als Lehrer will ich wenig Vorbereitungsaufwand (Akkus laden, ...) wie möglich haben
1. Als Lehrer will ich so wenig wie möglich auf Rechnern installieren müssen

1. Als Schüler will ich ein klares definiertes Ziel
1. Als Schüler will ich live testen können
1. Als Schüler will ich ohne viel Dokumentation entwickeln
1. Als Schüler will keine externen Bibliotheken suchen und einbinden
1. Als Schüler darf ich das Gerät nicht durch Code zerstören können

1. Als Einsteiger möchte ich keine externen Bibliotheken ohne Abstraktion verwenden
1. Als Einsteiger möchte ich keine Portbelegungen wissen müssen

1. Als Profi möchte ich vollen Zugriff auf die Technik haben


### Vergleich und Definition der verschiedenen Entwicklungsumgebungen
#### Software
Festlegung auf textbasiertes Programmieren, um realen Bezug zu fördern. C/C++ als Basiswissen. MicroPython evaluiert, aber nicht reif genug für unsere Anwendung und nur auf wenig Plattformen verwendbar.

AVR als Basisarchitektur, da NXT (Mindstorms) sich nur schlecht mit offener Hardware verbinden lässt. ESP\* als gängige Alternative, derzeit kein Bedarf für Vernetzung identifiziert und daher übertrieben. 

Arduino IDE als Klassiker, allerdings veraltet und mit schlechter Interation von Libraries. PlattformIO als bessere Alternative. 

GitLab der FAU zur Verwaltung von Aufgaben, der Codebasis und aller Fortschritte. 

#### CAD
Vergleich verschiedener Systeme, Fokus auf Kollaboration, kostenloser Nutzung und effizienten Workflows. 
Entscheidung für Fusion 360, da alle Erfahrungen haben und Kollaboration einfach ist. 


### Aufgabenverteilung

Im Rahmen des Projekts wurden die individuellen Kompetenzen mit den Aufgaben verglichen und zugeordnet. 

TODO: 
RM: Projektmanagement, CAD Karosserie & Schatz, Softwarearchitektur und High-Level Funktionalitäten
TB: Platine, elektrischer Aufbau, Hardwaretreiber
MB: Mechanik, Software, Echtzeitsysteme

Aufgabenpakete wurden laufend erfasst, zugeordnet und überwacht, Abstimmungen fanden etwa einmal die Woche statt. 


## Milestone 2: Vorbereitungen und erste Entwicklung

### Beschaffung der Komponenten

Bevor neue Teile gekauft wurden wurden alle bereits im PIB-Labor vorhandenen Teile gesichtet. 

Teile bestellen, Begründung was wo



Encoder war in Überlegung, fertige Motoren waren allerdings einfacher zu verwenden. 
-> großer Fehler, da kacke! enge Regelung von Drehzahl und Leistung hätte Bewegung einfacher gemacht. 

Kompass als alternative Erfassung von Richtungen, erlaubt ebenfalls Kompensation von Drifts. 






Schatz wurde mit mehreren Magneten getestet, das gab aber Probleme mit der Magnetfeldmessung. 

Richtung beachten! -> Troubleshooting

