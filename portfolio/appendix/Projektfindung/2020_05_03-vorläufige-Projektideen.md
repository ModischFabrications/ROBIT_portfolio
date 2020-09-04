# vorläufige Projektideen

## Kollaborative Robotik
auf Basis eines Projekts mit einem 6 Achsen Roboter: jeder baut eine Regelung für eine Achse -> gemeinsame Verfahrbewegungen, Regelungstechnik als Inhalt

### Konzept
* Abgeklebter Bereich
* herumfahren und ein Objekt finden

### Vorwissen
* Grundlagen Programmierung: Logik, Schleifen, Conditionals
* technisches Verständnis?
* Datennetze?

### Lehrinhalt
- Datennetze/Kommunikation/Bussysteme
- Embedded, falls low-level?
- Algorithmik allgemein?
- nur Software oder auch Hardware?

**-> Zielgruppe Oberstufe, Ausbildung, Bachelor**

### mögliche Schwierigkeiten
- Distanzsensor während einer Bewegung
- Linienerkennung bei höherer Geschwindigkeit
- Kartengenerierung zu komplex -> blindes Fahren besser


### Scenarios
- Lagerhaus: smartes Regal/Spender + Fahrzeug -> Linefollowing bis NFC-Tag, dann mit Elektromagnet Teile auf Laderaum fallen lassen zum Beladen, dann ausliefern
- Gewächshaus gießen
- Pakete ausliefern
- nur line-follower (aber schon fast Analogtechnik)


**-> Schwierigkeitsgrad hängt von Abstraktionslevel ab**
verschiedene Komplexitäten möglich:
1. einfachster Fall: Bewegung + (Kollisionserkennung (Schüttelsensor) || Grenzen (Linienerkennung) || Distanzmessung (HC-SR04))
2. Erweiterung um Aktorik 

### Aktorik
- einfach: Spender?
- Laser/Pellets schießen (cool, aber nicht in Schule möglich)
- Edding als eigenes Line-following
- Elektromagnet 


### Budgetplan
- min 200€
- Robustheit schwierig? Robust immer teurer
- Aliexpress Panzerboden ab 30€

### auf Basis von Lego Mindstorms? 
- wenig Freiheit
- gibt schon ähnliche Projekte: [Mindstorms Challenge](https://celleheute.de/celle-mindstorms-challenge-26-schueler-teams-stellen-ihre-programmierkuenste-unter-beweis)


### Bauteile:
- HC-SR04: (Kollisionserkennung)
  - Servo: schwenkbar als optionale Erweiterung
- Helligkeitssensor/IR unten -> Linienerkennung
- RFID -> Identifikation (Start, Ziel, Objekt)
- Schüttelsensor -> Kollision, "Diebstahl", Abschaltung
- IMU (Accelerometer + Gyroskop + Kompass) -> Ortung, Freefall Erkennung
- Load Cell -> Gewichtsmessung
- Akkustand
- 18650 als Akku mit BMS
- LED-Matrix: Status, Spielerei

-> Maximalversion, gibt es schon als riesiges [Projekt](https://www.th-nuernberg.de/fakultaeten/efi/forschung/forschungsaktive-labore/mobile-robotik/robocupwork/)

### Kommunikation zwischen Baugruppen:
- ein Raspberry pro Fahrzeug macht parallel testen schwer, mehrere sind Unsinn
- OS-Ebene: Sockets
- Modul-Ebene: SPI/I2C/CAN
- Code-Ebene: Calls



## haptischer Stadtplan für Blinde
Karte von Gebäude / Stadtplan 

### Konzept
- Blindenkarte als vertraute Grundlage
- Bekannte Orte nachbauen
- Haptik/Hardware bietet Mehrwert für Blinde
- Eltern didaktisch mit Versuchsfeld -> Klassen als Initialtester

#### Ausgabe haptisch, dann auch Eingabe haptisch 
- höherer Aufwand 
- Joystick zu einfach führt zu Schleifen-Unlust
-> gewisser Aufwand muss da sein

#### Eingabe als Textreader ausreichend
- höhere Hürde
- Tippen für Blinde schwierig, aber "sowieso irgendwann zu lernen"
-> auch gleich Tipptraining (schon mal entwickelt)

-> Eingabe nur wenn Zeit vorhanden ist, unabhängig
-> Austauschbare Eingabe, Blöcke zu Code übersetzen als Erweiterung
-> Raspberry als Basistech erlaubt sowieso Bildschirm, Tastatur und Maus

### Implementierung

#### Lego als Basis?
- feste Rastermaße
- riesige Auswahl an Teilen (interessanter?)
- Legoplatte blöde Gleiter
- Große Skala: Einfache Gleiter, gut zu finden
- kleine Skala: Gut zu zählen
- Duplo als Zwischending?

-> Auflösung des Rasters ist großes Hindernis

#### Bewegung
- Drehen und Vorwärts als Bewegung (Rückwärts)
- Seitlich Gehen würde Drehung sparen, ist aber schlechter zu erklären
- kontinuierliches Drehen -> Servo, Stepper?
- Drehung braucht absoluten Winkel -> Homing mit Hall-Effekt?
- Magnet zu nah am Stepper eher ungünstig

#### Spielbrett
- Platte dick genug um Duplos festzudrücken, aber dünn genug für Magneten
- Biegung limitierender Faktor für Größe
- Bewegung zwischen dem Raster oder auf dem Raster?
- Zählen der Schritte blöd mit versetztem Bewegungs- zu Wandraster?

- Lochraster: 
  - Glatte Wege
  - Wände reduzieren nicht Auflösung
  - Dicke einfach anpassbar

- Lego/Duplo:
  - fertige Teile, überall zu kaufen
  - Stabilität der Grundplatte ein Problem
  - Bewegung schwieriger durch Noppen

- Oberfläche als Eingabe für System und Blinde
  - System muss wissen, kann nicht aktiv messen?
  - Spiel muss Spielfeld kennen um Events auszulösen

## [Cargobot](https://altermanchess.wixsite.com/cargobot) für Blinde

### Konzept
- Kisten korrekt stapeln 
-> Erkennung durch Computer Vision oder blindes Vertrauen
- Programmierung auch haptisch umzusetzen
- 2D, 3D evtl zu aufwendig
- Verkleidung der beweglichen Teile
- geringerer Instruktionssatz einfacher

### Programmierung
haptische Eingabe für Kinder interessanter, aber technisch aufwendig
Interessante [Umsetztung von Microsoft](https://news.microsoft.com/innovation-stories/project-torino-code-jumper/)
- ähnlich wie CargoBot, 4 Programmabläufe
- ähnlich zu Assembler, bedingte Sprünge
- Mehrere Register mit "Funktionen"
- Schleifen durch bedingte Sprünge


#### Blockerkennung
- RFID: easy, aber ewig viele Reader und Interferenzprobleme
 - einfache Blöcke, schwierige Reader
- Widerstand: Strom durch Reihe schicken, individuell abfragen
 - exakte Platzierung schwierig, Analogtechnik fehlerbehaftet
- Einzeln abscannen: Farbkodiert, Computer Vision
 - zu wenig Erfahrung im Team

#### Debugger
- Single-Stepping
- aktuelle Position schwer darzustellen -> Blöcke vorlesen?


## Buzzergame für Klassen
### Konzept
- Publikumsjoker Style Buzzer für Unterrichtsfragen
- Mehrere Geräte mit einem Server verbunden, Bildschirm zeigt Ergebnisse
-> besser übers Handy machbar, schon existierende [Lösungen](https://www.mentimeter.com/)

### Implementierung
- Drahtlos und mit Haptik -> beliebig vergrößerbar
- Raspberry mit eigenem Bildschirm oder Webpage, ESP* als Endgerät

## Logik(gatter)trainer
### Konzept
#### Lückenfüllen:
- gut zu erklären und zu fühlen, aber kein Spiel mehr
- langweilig für den Nutzer

#### freies Raster:
- Kabelstücke verbinden, jedes Gatter zeigt Ausgangszustand
- schwer zu implementieren

-> gibts schon?  **aber nicht für Blinde**

### Implementierung
- haptische Ausgabe mit Solenoids













