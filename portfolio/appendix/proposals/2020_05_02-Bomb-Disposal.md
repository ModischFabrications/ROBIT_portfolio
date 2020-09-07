# Bomb Disposal

## Szenario:

"Finde und entschärfe die Bombe!"

"Die Bösen (Lehrer)" kleben ein Sperrgebiet mit Klebeband auf und platzieren die Bombe.
(grobe Fairness-Regeln)

"Die Retter" entwickeln ein Auto, das die Bombe rechtzeitig finden und entschärfen muss.

Die Bombe piepst/blinkt mit ablaufendem Timer immer schneller. 
Eine Berührung löst Sie direkt aus, daher muss die vor Ort entschärft werden.
Die Entschärfung ist ein "EMP" (Magnet), der auf die Bombe (Reed-Switch) gestellt wird. 


## Lerneffekt:

Zielgruppe Oberstufe, Ausbildung, Bachelor
Vorwissen
- Grundlagen Programmierung
  - Logik, Schleifen, Conditionals
- technisches Verständnis?
- Datennetze?

Lehrinhalt: 
- Datennetze/Kommunikation/Bussysteme
- Embedded
- Algorithmik allgemein
- Suchstrategien
- Räumliches Vorstellungsvermögen
- Robotik
- Sensorik
- Cyber Physical Systems
- Verteilte Systeme

Gruppenarbeit entweder für Module oder ganze Fahrzeuge
Wettbewerb nach kürzester Zeit

Schüler schreiben die Logik/Software, komplexe Systeme sind vereinfacht angeboten
Micropython oder einfacher


Hardware zu fragil für freie Kurse
Keine Computervision, keine Kartografie -> zu komplex


## Herausforderungen:
1. Distanzsensor und Bewegung peilen zusammen die Position
2. Intelligente Suchstrategie im Feld
3. Abgrenzen Sensorpolling gegen andere Module und Geschwindigkeit (künstlich Frequenz begrenzen?)

4. Definition von Schnittstellen
5. Verwendung von Libraries
6. Teamarbeit und Koordination


## Bauteile:

### Fahrzeug:
- Computer: Raspberry? Arduino o.ä.?
- HC-SR04 -> Sonar
  - Servo -> schwenkbar als optionale Erweiterung
- Helligkeitssensor/IR unten -> Linienerkennung für Spielfeld
- Motoren + Chassis + Speedcontroller + Räder
- Servo + Magnetarm
- Kompass (+ Accelometer + Gyroskop) -> Ortungshilfe 
- Austauschbarer Akku: 18650 mit BMS (Akkustand)

- primitives Mikrofon: Entschärfen \& Explosion

- LED-Matrix: Statusanzeige, Spielerei
- keine Lautsprecher!


### Bombe:
- Piezo + LEDs -> Ticken, evtl. Explosion
- 7segment ->  Countdown
- Schüttelsensor -> Kollision
- Reed-Switch -> Entschärfung
- Arduino-like, evtl. blank Attiny
- Akkus
- Lautsprecher für Explosionsgeräusch?


-> Budget unter 200€, semi-portable Lösung


# Feedback
zu destruktiv, lieber positive Story. Genauer spezifizieren, was unsere Umsetzung ist. 
