![Foto Seitenansicht](images/photo_side.jpg)

# Die Entwicklung

Die Entwicklung lässt sich in 7 Milestones über einen Verlauf von 15 Wochen unterteilen.

TODO wie übergreifende Issues erklären? Encoder bestellen wäre M1, wird aber erst in M3 erklärt

Aufgaben wurden ursprünglich nach logischen Komponenten wie Angel, Sonar und Gehäuse unterteilt, diese Aufteilung war in der Praxis aber nur schwer einzuhalten. Daher wurden viele Aufgaben in der Umsetzung eher nach der behandelten Disziplinen gruppiert. 



## Milestone 1: Orientierung

### Definition
Um die genaue Zielsetzung festzuhalten wurde ein initialer Vortrag vorbereitet, der die Zielsetzung des Projekts festhalten soll. 

TODO https://docs.google.com/presentation/d/1X0VR1WAZExtkcRi5N46J-1ufT67DiJy896XK1zQV_ug

Erstes Feedback hat alternative Implementierungen mit hängendem Aufbau statt Reifen eröffnet, der Vorschlag wurde allerdings aufgrund mechanischer Komplexität und geringer Flexibilität verworfen. 

*Use-Cases:*

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
Die erste Idee war die Programmierung durch logische Blöcke wie [Snap-Blocks](https://scratch.mit.edu). 
Als Kandidat wurden [mBlocks](https://www.mblock.cc/) evaluiert: 

*Vorteile von mBlock:*

- durch visuelle Blöcke anschaulicher als C-Code
- IDE läuft im Browser und benötigt nur Installation eines Treibers

*Nachteile von mBlock:*
 
- komplexe Programme werden schnell sehr groß und unübersichtlich
- Unterprogramme nicht möglich
- alle Aufrufe werden in `setup` durchgeführt, sodass Sensoraktualisierungen in `loop` nicht regelmäßig ausgeführt werden würden

Fazit: Eine Programmierung in C bietet wesentlich mehr Flexibilität. Das geplante Projekt eines Schatzsuchers ist für eine Umsetzung mit Snap-Blocks zu komplex. 
Die Platform `mBlock` selbst ist ein interessantes Konzept und für kleine Projekte wesentlich anschaulicher.



Festlegung auf textbasiertes Programmieren, um realen Bezug zu fördern. C/C++ als Basiswissen. MicroPython evaluiert, aber nicht reif genug für unsere Anwendung und nur auf wenig Plattformen verwendbar.

AVR als Basisarchitektur, da NXT (Mindstorms) sich nur schlecht mit offener Hardware verbinden lässt. ESP\* als gängige Alternative, derzeit kein Bedarf für Vernetzung identifiziert und daher übertrieben. 

Arduino IDE als Klassiker, allerdings veraltet und mit schlechter Integration von Libraries. PlattformIO als bessere Alternative. 

GitLab der FAU zur Verwaltung von Aufgaben, der Codebasis und aller Fortschritte. 

#### CAD
Vergleich verschiedener Systeme, Fokus auf Kollaboration, kostenloser Nutzung und effizienten Workflows. 
Entscheidung für Fusion 360, da alle Erfahrungen haben und Kollaboration einfach ist. 

#### Elektronik
Die Schaltung wurde zuerst digital entworfen, bevor Sie real gefertigt wurde. 
Kandidaten waren KiCAD, EAGLE und Fritzing, letztere hat sich aufgrund der einfachen Visualisierung durchgesetzt. 
EAGLE wäre aufgrund der engen Integration mit Fusion 360 interessant gewesen, war allerdings zu aufwendig für unsere Anwendung. 
Falls Platinen professionell bestellt werden, wäre KiCad die bessere Wahl, bei unserer Eigenfertigung war dies allerdings nicht nötig. 


### Aufgabenverteilung

Im Rahmen des Projekts wurden die individuellen Kompetenzen mit den Aufgaben verglichen und zugeordnet. 

TODO: 
RM: Projektmanagement, CAD Karosserie & Schatz, Softwarearchitektur und High-Level Funktionalitäten
TB: Hardwaremanagement, PCB Design und Fertigung, elektrischer Aufbau, Hardwaretreiber, Laserbearbeitung
MB: Mechanik, Software, Echtzeitsysteme, Prototyping, CAD: Angel, Abdeckung, Stützrad & Sensoren

Aufgabenpakete wurden laufend erfasst, zugeordnet und überwacht, Abstimmungen fanden etwa einmal die Woche statt. 


## Milestone 2: Vorbereitungen und erstes Design

### Beschaffung der Komponenten

Bevor neue Teile gekauft wurden, wurden alle bereits im PIB-Labor vorhandenen Teile gesichtet. Es konnten zwei Motoren inklusive Räder und einige Sensor wiederverwendet werden.

Vor dem Entwurf des finalen Fahrzeugs wurden die vorhandenen Teile auf einem provisorischen Rahmen montiert und deren Kompatibilität sichergestellt.

Es wurde zu Beginn eine Liste aller notwendigen Bauteile erstellt. Diese Liste wurde sukzessive erweitert, der finale Stand ist in [TODO Teileliste] dargestellt. 

Die restlichen Teile wurden online bestellt. Hierbei wurde auch auf die Lieferzeit geachtet, wobei deutsche Händler bevorzugt gewählt wurden.

### Testen der Komponenten

Der Verbrauch und die Geschwindigkeit der Motoren wurden bei unterschiedlichen Spannungen getestet. Die Drehgeschwindigkeit bei 5V wurde als ausreichend erachtet, daher konnte die Powerbank direkt und ohne einen Spannungswandler verwendet werden. 

Encoder war in Überlegung, fertige Motoren waren allerdings einfacher zu verwenden. 
-> großer Fehler, da kacke! enge Regelung von Drehzahl und Leistung hätte Bewegung einfacher gemacht. 

Kompass als alternative Erfassung von Richtungen, erlaubt ebenfalls Kompensation von Drifts. 

Für die Stromversorgung wurde eine Powerbank mit zwei unabhängigen USB-Ausgängen gewählt. Diese ist herausnehmbar und lässt sich komfortabel über den Micro-USB-Standard aufladen. Außerdem bieten die zwei unabhängigen Ausgänge die Möglichkeit, die Stromzufuhr der Motoren von der Stromversorgung des Microcontrollers und der Sensoren zu trennen. Somit werden Messwerte nicht durch Spannungsschwankung der Motoren beeinflusst.

Im Laufe der Bestell- und Testphase wurden für alle Bauteile eigene 3D-Modelle erstellt, um deren Passung im finalen Fahrzeug zu gewährleisten. Viele Komponenten, vor allem die Sensoren, konnten als frei verfügbare Modelle angepasst und eingebunden werden.

Außerdem wurde sich auf Coding-Guidelines geeinigt, die den Programmierstil ähnlich halten und den Programmfluss übersichtlich gestallten.

## Milestone 3: Entwicklung

### Platine

Wie in [Elektronik] beschrieben wurde die Elektronik mit Fritzing entworfen, dabei wurde auch eine Visualisierung der Komponenten erstellt um Schülern weitere Informationen zum Innenleben des Fahrzeugs zu bieten. 
Die Platine wurde iterativ erweitert um Änderungen während der weiteren Entwicklung zu erfassen, die finale Version ist in [TODO Platinenbild] zu sehen. 

TODO Platinenbild

### Ultraschallsensor
Der verwendete Sensor war eine HC-SR04, durch dessen weite Verbreitung war die Integration einfach. 
Eine Glättung der Werte wurde durch die Minimumbildung zwischen mehreren Werten realisiert, da Abweichungen, z.B. durch Reflektionen, nur größer als reale Werte sein können. 
Aus der Rundlaufzeit konnte leicht die Distanz (unter Annahme konstanter Schallgeschwindigkeit) durch $$distance = \frac{duration}{2*29.1545}$$ ermittelt werden. 

![HC-SR04 Plot](images/HC-SR04_plot.png)

Ein größeres Problem waren die Sonarquerschnitte: Je nach Winkel und Form des Objekts wurden die Ultraschallpulse nicht zurück zum Sensor reflektiert, das Objekt wurde dadurch unsichtbar. 
[HC-SR04 Plot Rotation] zeigt die Messwerte eines rechteckigen Objekts das langsam rotiert wird. Die Maximalwerte stellen fehlende Rückgaben dar. 

![HC-SR04 Plot Rotation](images/HC-SR04_plot_rotation.png)

### Entwurf des Schatzes

Im Laufe der Entwicklung wurden mehrere Formen evaluiert: Zylindrische Formen waren winkelstabil, aber auch gleichbleibend unzuverlässig. 
Rechteckige Querschnitte wurden direkt verworfen. Eine interessante Alternative war eine durch Radarprismen inspirierte komplexere Form ([Render Radarprisma]), die zwar nicht mehr realistisch, aber besser zu erkennen war. 

![Render Radarprisma](images/render_radarprisma.png)

Daraus ergeben hat sich eine Modifikation des Zylinders durch kleine Reflektionskerben, zu sehen in [Render Schatz]. 
Die Erkennbarkeit hat sich dadurch leicht verbessert, größer war der Vorteil in der Haptik. 

![Render Schatz](images/render_schatz.png)

Der zylindrische Schatz lässt sich außerdem aufschrauben, um einen Anreiz für Schüler zu verstecken. 

![Render Schatz Querschnitt](images/render_schatz_cut.png)

### Angel
Es wurden verschiedene Servos, Angelmechanismen und Angellänge getestet. Da der Schatz klein und leicht ist, wurde sich für einen Mini-Servo mit Metallgetriebe entschieden. Ein Angelmechanismen mit nur einem Drehpunkt ist einfacher und hat keine Nachteile, demnach wurde dieser auch im CAD umgesetzt. 

![Angel Prototyp](images/angel_prototyp.jpg)

Nach mehreren Design Iterationen wurde sich auf einen Aufbau geeinigt, bei dem sich im Kopf der Angel eine Unterlegscheibe und der Hall-Sensor direkt darüber befindet. Die Kabel wurden durch einen Kanal im Angelarm zum Roboter geführt und mit Schrumpfschlauch fixiert. Für eine bessere Druckbarkeit wurde die Abdeckung vom Hallsensor als einzelnes Teil modelliert, es enthält außerdem Aussparungen für die Zustands-LED und das Potentiometer zum Einstellen der Empfindlichkeit des Hallsensors. 

Die Halterung für den Servo und den LED-Streifen wurde als zusätzliches Bauteil modelliert. Dies vereinfacht den Druck und das Zusammensetzten. Die Servo zum Bewegen den Angel wurde so fixiert, dass er flach auf der Abdeckung aufliegt und mit nur einer Schraube im 3D-Druck in Position gehalten wurde. Später wurde ein kurzer LED-Streifen zu Statusanzeige in dieser Halterung entworfen und eingebaut. Hierfür wurde der Streifen mit 10 LEDs im Modell ausgespart und ein extra Kanal für die Kabel gelassen.

Bei der Ansteuerung des Servos wurde festgestellt, dass bei der Nutzung von PWM-Pins für die DC-Motoren und dem Servo die Anzahl der benötigten Timer nicht ausreichen, also wurden die Pins für die Motoren geändert.

### Magnetsensor
Das Aufheben des Schatzes ist nicht zuverlässig genug um blind gemacht zu werden, daher war es notwendig einen Sensor zu verwenden. 
Unsere Entscheidung fiel auf den Einbau eines Magneten im Schatz, daher konnte ein Magnetsensor verwendet werden. 
Es wurde überlegt den Sensor von der Schaltung zu trennen um die Angel kompakter zu machen, dies wurde zugunsten der Signalqualität verworfen. 

Der Sensor liefert ein binäres Signal zurück, das per Potentiometer kalibriert werden kann, die eingestellte Schaltschwelle schaltet erst nachdem der Schatz zur Angel gesprungen ist. 

Problem unseres Sensors ist die Polarität, da das Magnetfeld nur in eine Richtung erkannt wird. 
Wenn jetzt mehrere Magneten abwechselnd gedreht eingebaut werden gibt es genug Magnetkraft zum halten, allerdings wird der Schatz auch nur jeden zweiten Magnet erkannt. 
Eine gleiche Ausrichtung dagegen ist einfach zu erkennen, aber nicht mehr stark genug zum halten. 
Daher musste von mehreren Magneten auf einen einzelnen, richtig orientierten Magneten gewechselt werden. 

### Lichtsensor
Um die Grenzen des Spielfelds zu erkennen wurde ein Lichtsensor verbaut. Ein binäres Signal ist dabei ausreichend, die Lichtverhältnisse werden einmalig kalibriert.
Eine Detektion ist auch bei 1cm verlässlich, für Feinjustierungen wurde ein Slot modelliert, der den Abstand zum Boden veränderbar macht. 
Um Timingprobleme bei langsamen Programmen zu vermeiden kann breiteres Tape verwendet werden, zusätzlich kann vom Sensor ein unterbrechender Interrupt ausgelöst werden. 
Bei einem dunklen Boden wird helles Tape verwendet und der Sensorausgang invertiert. 

### Kompass
Um eine genauere Ausrichtung beim Fahren zu ermöglichen wird ein Kompass verwendet. Hierfür wurde sich für den Chip `MPU6050` entschieden, da dieser weit verbreitet ist und eine I2C Schnittstelle bietet. 
Da es sich bei dem Sensor um einen Gyrosensor handelt muss für die Berechnung eines absoluten Winkels eine regelmäßige Aktualisierung stattfinden. 

Beide getestete Sensoren haben ein Fehlverhalten gezeigt, bei dem der Sensor kurz nach dem Initialisieren falsche Werte liefert. Sobald ein solches Fehlverhalten durch unplausibel veränderte Werte festgestellt wird, wird der Sensor durch ein Zurücksetzten neu initialisiert. 
Es wurde die Bibliothek `MPU6050_tockn` gewählt, da diese eine Offset Kalibrierung und einen fortlaufenden Winkel bietet. 


### Karosserie
Der zentrale Bestandteil des Roboters ist die Karosserie, die alle Komponenten miteinander verbindet. Die Größe und Form der Motoren war hierfür vor allem zu berücksichtigen. Außerdem sollte der Kompass möglichst auf dem Drehpunkt des Fahrzeugs liegen. 

![Foto Karosserie Seitenansicht](images/render_carriage_bottom.png)

Höhen und Ausrichtungen der Sensoren wurden mit Hilfe des Prototypen experimentell ermittelt oder einstellbar modelliert. Die Elektronik wurde in einer nach unten geöffneten Box unterhalb der Powerbank untergebracht und kann mit einem Deckel vor Berühren geschützt werden. 

![Foto Deckel](images/photo_cover.jpg)

Für eine bessere Wartbarkeit wurde bei Schraubverbindungen Aussparungen für Insert modelliert. Für die Kabelführung zum Powerbank wurden Aussparungen auf der Rückseite des Roboters modelliert, neben dran befindet sich ein Schalter, der den Strom der Motoren unterbricht um ein ungewolltes Bewegen beim Programmieren zu verhindern. 
Als Stützrad wurde sich nach mehreren Tests für eine omnidirektionale Rolle aus einem Roll-On-Deodorant entschieden und eine Halterung für diese auch im CAD eingefügt. 
Nach einem Testdruck und einer Einpassung der Komponenten wurden noch kleinere Änderungen vorgenommen. Auch eine Personalisierung durch eigene Logos auf der Karosserie wurde hinzugefügt.

![Render Karosserie Draufsicht](images/render_carriage_top.png)

### Implementierung der Logik
Für die Modellierung des Programmablaufs wurde ein Zustandsdiagramm verwendet.

![Prototyp des Progammablaufs](images/state_chart.png)

Hierbei wurden Probleme, wie die kontinuierliche Aktualisierung der Sensoren, ausfindig gemacht und behoben. Anschließend wurde dieses Zustandsdiagramm mit Hilfe einer `switch` Anweisung in Programmcode umgesetzt und erweitert. 



## Milestone 4: Entwicklung

### Aufspalten in Bibliotheken
Die unterschiedlichen Levels der Integration, die Schülern angeboten werden, wurden bereits während der Entwicklung berücksichtigt: 
Zunächst wurde mit Hilfe eines Prototyps und einer Testschaltung Programmcode entwickelt und auf die Komponenten angepasst. Anschließend wurde dieser Code in einzelne Bibliotheken aufgespalten. 
Unsere eigenen Klassen wurden so konzipiert, dass sie mehr Funktionalität bieten, als in unserer eigenen Implementierung verwendet wurde. Somit werden auch andere Lösungen ermöglicht.
Den Klassen wurden Kurzbeschreibungen mit Informationen über das Level und die Verwendung im Header hinzugefügt.

### Entwicklung des Wrappers
Um die Programmierung für Schüler zu vereinfachen wurden komplexe Sachverhalte abstrahiert und in verschiedene Level aufgeteilt, zu sehen in [Levels].
 
Im einfachsten Fall wurden die Adressen der elektrischen Verbindungen fest kodiert, um eine versehentliche Zerstörung der Hardwarekomponenten zu vermeiden. 
Hierfür wurden `setup()` Funktionen eingeführt, die der Schüler zu Beginn aufrufen muss. 

Weiterhin wurden Grenzwerte eingehalten wie die Reichweite des Servos. 
In diesem Zug wurde auch die Reichweite des Sonars künstlich begrenzt, um das Risiko unsauberer Detektionen zu reduzieren. 

Umrechnungen von Raddurchmesser, Geschwindigkeit und gefahrener Distanz wurden evaluiert, waren in der Praxis allerdings zu variabel und wurden verworfen. 

### LED Statusleuchten

Bei der Entwicklung behindert das fehlende Feedback die Arbeit, daher wurden verschiedene Arten evaluiert. 
Ein kleiner Bildschirm wäre mächtig, aber zu aufwendig anzusteuern gewesen. 
Einzelne LEDs sind einfach, brauchen aber viel Verdrahtung und sind stark beschränkt. 
Ein Streifen einzeln addressierbarer RGB-LEDs (WS2812B) wurde als Mittelweg identifiziert. 

In der Referenzimplementierung wurde eine Warnungsanzeige, ein Herzschlag und die Anzeige vom Status angezeigt, weitere Kandidaten waren Distanz, Winkel oder Geschwindigkeiten. 
Gruppen können frei entscheiden was Sie anzeigen wollen, ein direkter Zugriff auf die LEDs ist möglich. 

Verwendet wurde FastLED, hier wurde auch die globale Helligkeit limitiert um Überhitzungen zu vermeiden. 

Die ideale Wandstärke, Passtoleranz und Form über den LEDs wurde experimentell bestimmt. 

![LED Drucktest](images/led_thickness.png)

Selbst bei schwarzem Filament kamen bei 0.2mm Dicke noch genug Licht durch, beim verwendeten gelben Filament konnte die Dicke sogar 
auf 0.4mm erhöht werden um die Form der LEDs im ausgeschalteten Zustand besser zu verwischen. 
Runde Lichtkanäle haben den Lichtkegel etwas runder gemacht, die zusätzlich benötigte Tiefe war dieser Vorteil nicht wert. 


### Platine

Konzept für 4x6cm Lochrasterplatine

Entwurf mit Fritzing



Gyro mittig zwischen Motoren um Drehung richtig zu erkennen.

Je ein Treiber pro Motor.

USB-Steckverbindungen

![Platine Frontansicht](images/pcb_front_test.jpg)

![Platine Rückansicht](images/pcb_back_test.jpg)

Befestigung mit vorhandenen M2-Löchern

![Schaltplan](images/schematic.png)

![Schaltplan](images/schematic_graphical.png)








![Einbau](images/pcb_assembly.jpg)



## Milestone 5: Fertigung
Die Fertigung und Verwendung des Prototyps offenbarte in vielen Bereichen ein Optimierungspotential für das finale Fahrzeug. 
Die für den Prototypen gedruckten Teile wurden vor allem auf Druckgeschwindigkeit optimiert und hatten nur eine geringe Druckauflösung, beide Aspekte wurden für das finale Modell auf Qualität optimiert. 

Um einen konsistenten Stand zu erhalten wurden wurden alle notwendigen CAD Optimierungen bis zu einer Deadline am 15.7.2020 umgesetzt und anschließend die finalen Teile gedruckt. Danach anfallende kleinere Änderungen wurden nur noch im Modell angepasst und nicht mehr gefertigt. 
Die Karosserie wurde in Gelb gedruckt, um - passend zum Szenario - auf ein gelbes U-Boots anzuspielen. Der Druck der Karosserie benötigte 150g PLA und 13 Stunden Druckzeit.

![Foto Drucken](images/photo_print.jpg)

Die Bodenplatte wurde aus transparentem Acrylglas gefertigt. Hierfür wurden mit Hilfe eines selbst gebauten Lasercutters die Beschriftungen graviert und die Umrisse angezeichnet. Anschließend wurden diese Umrisse per Hand ausgeschnitten, da der Laser nicht genug Leistung für einen Schnitt durch die komplette Dicke des Materials hatte. 
Zur finalen Fertigung gab es das erste persönliche Treffen, alle vorherigen Abstimmungen fanden den Umständen entsprechend online statt. Alle Teilnehmer haben ihre jeweiligen Komponenten zusammengetragen und individuellen Hinweise zu Komponenten erfasst. Vor dem Zusammenbau wurde ein Explosionsbild aller verwendeter Komponenten aufgenommen, um den vollen Umfang der Teileliste aus [Teileliste] auch bildlich zu erfassen. 

![Explosionsbild](images/explosion.jpg)

Bei den finalen gedruckten Teile fielen noch kosmetische Verbesserungsmöglichkeiten auf, wie die Tiefe der Inserts und eine Abrundung über den Motoren. Diese wurden im CAD Modell angepasst und anschließend als STL-Datei und veränderbarere STP-Datei exportiert.


## Milestone 6: Dokumentation

### Handbuch schreiben
Um alle Erkenntnisse unserer Entwicklung und des Referenzprojekts zu erfassen wurde ein Handbuch für Lehrkräfte mit allen alle relevanten Informationen zur Durchführung des Projekts verfasst. 

Wie beim Rest der Dokumentation wurde sich für `Markdown` als Auszeichnungssprache und `Pandoc` als Konvertierungswerkzeug entschieden. Somit können wir die bisherigen `Markdown` Notizen in ein mit `LaTeX` gesetztes PDF-Dokument umwandeln und so die Vorteile von beidem nutzen. 
Um Dopplungen zu vermeiden wurde das Handbuch mit der Einleitung des Projekts vereinigt, zu finden in [TODO Einleitung]. In diesem wird das Szenario beschrieben, was die Zielgruppe ist und welche Lehrinhalte vermittelt werden. Außerdem sind hier die Level beschrieben, aus denen die Lehrkraft je nach den Vorkenntnissen der Gruppe einen passenden Schwierigkeitgrad auswählt.
 
Die ausführenden Gruppenmitglieder werden durch die in Kommentaren und Header-Beschreibungen der ihnen zur Verfügung stehenden Klassen weiter informiert.


