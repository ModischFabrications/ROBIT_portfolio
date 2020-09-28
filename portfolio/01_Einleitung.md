# Das Projekt ROBIT
![Foto Vorderseite](images/photo_front.jpg) \

ROBIT ist eine Lehr- und Lernplattform, mit der Schülern, Studenten und allen anderen die Grundlagen von Robotik-Systemen beigebracht werden können. 

Das Ziel des Projekts besteht darin eine fiktive Mission mit Hilfe eines Roboters erfolgreich abzuschließen. Hierfür erarbeitet die Gruppe eine Strategie, setzt diese in Programmcode um und testet und verbessert diesen.

![Render Vorderseite](images/render_front.png)

![Render Rückansicht](images/render_back_lifted.png)

## Szenario

> Finde und berge den Schatz!

Auf dem Grund eines dunklen Sees liegt ein verborgener Schatz. Da der Druck und die Tiefe so groß sind muss dieser durch eine autonome Drohne geborgen werden. Die Drohne kann den Schatz mit Hilfe eines Sonars aufspüren. Um diesen nun sicher zu bergen muss er zum Ufer des Sees transportiert werden.

Der See ist mit Klebeband auf dem Boden markiert. Die Schatzsucher entwickeln und programmieren ein U-Boot, das den Schatz aufspürt und zum Ufer bringt.

![Skizze Draufsicht](images/RobotTopView_2.png)

Eingriffe in das System sind nur außerhalb vom See möglich, der Roboter muss vollständig autonom die Aufgabe erfüllen können. Geschickte Entwickler können den Roboter wieder zu ihrer Seite des Sees bringen um sich einen weiten Weg zu sparen, das Bergen an anderen Ufern ist aber ebenfalls zulässig. 

### Zielgruppe
**Vorwissen**

- Grundkenntnisse in C++
- Grundlagen Programmierung
  - Logik, Schleifen, Conditionals
  - Funktionsaufrufe
  - Interfaces
- technisches Verständnis

→ Informatik Fachausbildung oder Bachelor

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
- Regelungstechnik


### Herausforderungen
1. Kombination von Distanzsensor und Bewegung zur Erfassung der Position des Schatzes
2. Intelligente Suchstrategie um den Schatz aufzuspüren
3. Anpassungen an realistische, nicht idealisierte Aktuatoren
4. Definition von Schnittstellen
5. Verwendung von Libraries
6. Teamarbeit und Koordination
7. Planung des Programmflusses


## Lehre
Die Mission wird in Gruppen bearbeitet.
Eine Gruppe kann sich für die parallele Implementierung einzelner Komponenten aufteilen.
Auch ein Wettbewerb zwischen mehreren Gruppen ist denkbar, hierbei gewinnt das Team, welches die vorgegebene Mission zuerst erfüllt.
Die Aufgabe der Gruppen ist es die Software für den Roboter zu schreiben.


## Aufbau

### Fahrzeug

![Render von Unten](images/render_bottom.png)

- Mikroprozessor: Arduino Nano
- Ultraschallsensor: HC-SR04
- Linienerkennung: IR-Linien Sensor
- Fortbewegung: Motoren + Räder + Speedcontroller L9110 
- Angel: Servo + Magnet Sensor
- Kompass: MPU6050
- Stromversorgung: Austauschbare Powerbank
- Statusanzeige: WS2812-LED-Streifen

![Render Seitenansicht](images/render_side.png)

![Skizze Seitenansicht](images/RobotSideView_2.png)




### Schatz
3D-gedruckter Schatz mit eingebettetem Magneten. 

![Render Schatz](images/render_schatz.png)

Alternativer Schatz mit weniger realistischer Form aber besser erkennbarem Sonarquerschnitt. 

![Render Radarprisma](images/render_radarprisma.png)


## Aufteilung in Levels
Bei der Bearbeitung des Projekts stehen drei verschiedene Schwie­rig­keits­grade zur Auswahl.
Diese Level unterscheiden sich im benötigten Vorwissen und Zeitaufwand.

### Level 2
Dieses Level richtet sich an eine Gruppe mit Grundkenntnissen von C++. Die Ansteuerung der Sensoren und Aktuatoren werden vereinfacht durch die vorgegeben Klassen, die speziell auf die Komponenten abgestimmt sind. Somit liegt der Fokus mehr auf der Entwicklung einer Strategie und dem Programmablauf.

### Level 1
Dieses Level richtet sich an eine Gruppe mit guten C++ Kenntnissen.
Die Gruppe erhält die grundlegende Funktionalität zur Ansteuerung der Komponenten in den vorgegeben Klassen.
Ein wichtiger Lehrinhalt ist der Umgang mit realistischer, nicht idealisierter Hardware wie den unkalibrierten Motoren.

### Level 0
Dieses Level richtet sich an eine Gruppe mit sehr guten C++ Kenntnissen und Erfahrung mit Arduino Programmierung, Sensorik und Aktuatorik.

Die Gruppe findet die Pin-Belegung der Komponenten mit Hilfe des Schaltplans heraus.
Für die Komponenten empfehlenswerte und getestete Bibliothek sind in der nachfolgenden Tabelle gelistet.


### Vorgegebene Klassen der Level
Die Gruppe erhält nur die für ihr Level angepassten Klassen.
Die Tabelle listet die für die jeweiligen Stufen empfohlenen Klassen:

| Bauteil | Level 2 | Level 1 | Level 0 |
| ------ | ------ | ------ | ------ |
| MPU | Gyro.h | MPU6050_tockn.h | MPU6050_tockn.h |
| LEDs | Lights.h | FastLED.h | FastLED.h |
| Liniensensor | LineSensor.h | LineSensor.h | Arduino.h |
| Magnetsensor | MagnetSensor.h | MagnetSensor.h | Arduino.h |
| Motoren | ManagedMotors.h | Motors.h | Arduino.h |
| Servo | ManagedSero.h | SlowMotionServo.h | Servo.h |
| Ultraschallsensor | Sonar.h | Ultrasonic.h | Arduino.h |



## Voraussetzung an die Computerausstattung
Für die Programmierung des Roboters wird die [PlatformIO IDE](https://platformio.org/platformio-ide) verwendet, welche auf allen gängigen Betriebssystemen verfügbar ist. Der Computer benötigt einen freien USB-A-Port und einen installierten [FTDI-Treiber](https://www.silabs.com/products/development-tools/software/usb-to-uart-bridge-vcp-drivers).


## Vorbereitung
Der See wird mit Klebeband auf dem Boden markiert. Ein glatter, möglichst einfarbiger Boden wird bevorzugt. Je nach Bodenfarbe ist das Klebeband mit dem höchsten Kontrast zu wählen. Der Sees sollte einen Durchmesser von mindestens einem Meter haben und mindestens diese Distanz von jeder Wand entfernt sein.


