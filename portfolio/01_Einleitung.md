# Das Projekt ROBIT

ROBIT ist eine Lehr- und Lernplattform, mit der Schülern, Studenten und allen anderen die Grundlagen von Robotik-Systemen beigebracht werden können. 

TODO Das Projekt besteht aus XXX und YYY


## Szenario

"Finde und berge den Schatz!"

Auf dem Grund eines dunklen Sees liegt ein verborgener Schatz. Da der Druck und die Tiefe so groß sind muss dieser durch eine autonome Drohne geborgen werden. Die Drohne kann den Schatz mit Hilfe eines Sonars aufspüren. Um diesen nun sicher zu bergen muss er zum Ufer des Sees transportiert werden.

Der See ist mit Klebeband auf dem Boden markiert. Die Schatzsucher entwickeln und programmieren ein U-Boot, das den Schatz aufspürt und zum Ufer bringt.

TODO: Unterschied Querschnitt zu Draufsicht verdeutlichen -> Bild vom See zeigen, dann fade zu Boden mit Klebeband?

Eingriffe in das System sind nur außerhalb vom See möglich, der Roboter muss vollständig autonom die Aufgabe erfüllen können. Geschickte Entwickler können den Roboter wieder zu ihrer Seite des Sees bringen um sich einen weiten Weg zu sparen, das Bergen an anderen Ufern ist aber ebenfalls zulässig. 


## Lehre

Gruppenarbeit entweder für Module oder gemeinsame Fahrzeuge
Wettbewerb nach Zeit möglich

Schüler schreiben die Logik/Software, komplexe Systeme sind vereinfacht angeboten.

### Zielgruppe
**Vorwissen**
- Grundlagen Programmierung
  - Logik, Schleifen, Conditionals
  - Funktionsaufrufe
  - Interfaces
- technisches Verständnis

-> Informatiker Fachausbildung oder Bachelor

### Lehrinhalt
- Datennetze/Kommunikation/Bussysteme
- Embedded
- Algorithmik
- Suchstrategien
- Räumliches Vorstellungsvermögen
- Robotik
- Sensorik
- Cyber Physical Systems
- Verteilte Systeme
- Echtzeitsysteme


### Herausforderungen
1. Distanzsensor und Bewegung peilen zusammen die Position des Objekts
2. Intelligente Suchstrategie im Feld
3. Abgrenzen Sensorpolling gegen andere Module und Geschwindigkeit (künstlich Frequenz begrenzen?)

4. Definition von Schnittstellen
5. Verwendung von Libraries
6. Teamarbeit und Koordination
7. Scheduling von Programmfluss

## Aufbau

### Fahrzeug

TODO Render

- Arduino Nano
- HC-SR04 -> Sonar
- Helligkeitssensor/IR unten -> Linienerkennung für Spielfeld
- Motoren + Chassis + Speedcontroller + Räder
- Servo + Magnetarm
- Kompass (+ Accelometer + Gyroskop) -> Ortungshilfe
- Austauschbare Powerbank
- Metallring mit Hall-Sensor/Reed-Switch
- LED-Matrix: Statusanzeige, Spielerei

![RobotSideView_2](images/RobotSideView_2.png)


### Schatz
3D-gedruckter Schatz mit eingebettetem Magneten. 

TODO Render

Alternativer Schatz mit weniger realistischer Form aber besser erkennbarem Sonarquerschnitt. 

TODO Render

