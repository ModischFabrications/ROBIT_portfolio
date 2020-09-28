![Foto Seitenansicht](images/photo_side.jpg)

# Die Entwicklung

Die Entwicklung lässt sich in 7 Milestones über einen Verlauf von 15 Wochen unterteilen.

Aufgaben wurden ursprünglich nach logischen Komponenten wie Angel, Sonar und Gehäuse unterteilt, diese Aufteilung war in der Praxis aber nur schwer einzuhalten. Daher wurden viele Aufgaben in der Umsetzung eher nach der behandelten Disziplinen gruppiert. Genauso waren auch viele Arbeiten über mehrere Milestones verteilt, die hier präsentierte Reihenfolge entspricht eher einer logischen als chronologischen Ordnung. 

## Milestone 1: Orientierung

### Definition
Um die genaue Zielsetzung festzuhalten wurde ein initialer Vortrag vorbereitet, der die Zielsetzung des Projekts festhalten soll. 


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

AVR als Basisarchitektur, da NXT (Mindstorms) sich nur schlecht mit offener Hardware verbinden lässt. ESP8266 oder ESP32 als gängige Alternative, derzeit kein Bedarf für Vernetzung identifiziert und daher übertrieben. 

Arduino IDE als Klassiker, allerdings veraltet und mit schlechter Integration von Libraries. PlattformIO als bessere Alternative. 

GitLab der FAU zur Verwaltung von Aufgaben, der Codebasis und aller Fortschritte. 

#### CAD
Vergleich verschiedener Systeme, Fokus auf Kollaboration, kostenloser Nutzung und effizienten Workflows. 
Entscheidung für Fusion 360, da alle Erfahrungen haben und Kollaboration einfach ist. 

#### Elektronik
Die Schaltung wurde zuerst digital entworfen, bevor sie real gefertigt wurde. 
Kandidaten waren KiCAD, EAGLE und Fritzing, letztere hat sich aufgrund der einfachen Visualisierung durchgesetzt. 
EAGLE wäre aufgrund der engen Integration mit Fusion 360 interessant gewesen, war allerdings zu aufwendig für unsere Anwendung. 
Falls Platinen professionell bestellt werden, wäre KiCad die bessere Wahl, bei unserer Eigenfertigung war dies allerdings nicht nötig. 


### Aufgabenverteilung

Im Rahmen des Projekts wurden die individuellen Kompetenzen mit den Aufgaben verglichen und zugeordnet.

| Robin Modisch | Mark Brieger | Tobias Brieger |
| :------------- | :------------: | --------------: |
| Projektmanagement | Mechanik | Hardwaremanagement |
| CAD: Karosserie & Schatz | Prototyping | PCB Design und Fertigung |
| Softwarearchitektur | Software | elektrischer Aufbau |
| High-Level Funktionalitäten | Echtzeitsysteme | Hardwaretreiber |
| hochwertiger 3D-Druck | CAD: Angel, Abdeckung, Stützrad, Sensoren | Laserbearbeitung | 

Aufgabenpakete wurden laufend erfasst, zugeordnet und überwacht, Abstimmungen fanden etwa einmal die Woche statt. 


## Milestone 2: Vorbereitungen und erstes Design

### Beschaffung der Komponenten

Bevor neue Teile gekauft wurden, wurden alle bereits im DDI-Labor vorhandenen Teile gesichtet. Es konnten zwei Motoren inklusive Räder und einige Sensor wiederverwendet werden.

Vor dem Entwurf des finalen Fahrzeugs wurden die vorhandenen Teile auf einem provisorischen Rahmen montiert und deren Kompatibilität sichergestellt.

Es wurde zu Beginn eine Liste aller notwendigen Bauteile erstellt. Diese Liste wurde sukzessive erweitert, der finale Stand ist in [Teileliste](#teileliste) dargestellt. 

Die restlichen Teile wurden online bestellt. Hierbei wurde auch auf die Lieferzeit geachtet, wobei deutsche Händler bevorzugt gewählt wurden.

### Testen der Komponenten

Der Verbrauch und die Geschwindigkeit der Motoren wurden bei unterschiedlichen Spannungen getestet. Die Drehgeschwindigkeit bei 5V wurde als ausreichend erachtet, daher konnte die Powerbank direkt und ohne einen Spannungswandler verwendet werden. 

Encoder war in der Überlegung, die fertigen Motoren waren allerdings einfacher zu verwenden.

Der Kompass wurde als alternative Erfassung der Richtungen verwendet und erlaubt die Kompensation von Drifts. 

Für die Stromversorgung wurde eine Powerbank mit zwei unabhängigen USB-Ausgängen gewählt. Diese ist herausnehmbar und lässt sich komfortabel über den Micro-USB-Standard aufladen. Außerdem bieten die zwei unabhängigen Ausgänge die Möglichkeit, die Stromzufuhr der Motoren von der Stromversorgung des Microcontrollers und der Sensoren zu trennen. Somit werden Messwerte nicht durch Spannungsschwankung der Motoren beeinflusst.

Im Laufe der Bestell- und Testphase wurden für alle Bauteile eigene 3D-Modelle erstellt, um deren Passung im finalen Fahrzeug zu gewährleisten. Viele Komponenten, vor allem die Sensoren, konnten als frei verfügbare Modelle angepasst und eingebunden werden.

Außerdem wurde sich auf Coding-Guidelines geeinigt, die den Programmierstil ähnlich halten und den Programmfluss übersichtlich gestallten.

### Gestaltung der Texte

Als zentraler Wiedererkennungswert wurde zum Fahrzeug auch noch ein Logo entwickelt. 
Zur Auswahl standen viele Stile und Fonts, der Fokus lag vor allem auf der Druck- und Erkennbarkeit ohne große farbliche Kontraste. 
Auch Lizenzbedingungen mussten eingehalten werden, weshalb sich letztendlich auf eine Auswahl der folgenden Fonts beschränkt wurde: 

1. [Montserrat Subrayada](https://fonts.google.com/specimen/Montserrat+Subrayada)
2. [Bungee](https://fonts.google.com/specimen/Bungee)
3. [Russo One](https://fonts.google.com/specimen/Russo+One)

In der Theorie haben alle drei Fonts gut gepasst, daher wurde ein Testdruck mit diesen Fonts gemacht. Außerdem konnten so verschiedene Prägetiefen verglichen werden. 
In [Vorderseite](#fonts_front) ist gut zu erkennen das tiefere Prägungen mit 0.4mm statt 0.2mm einen besseren Kontrast ergeben, dies ist vor allem im "U" aus dem FAU-Logo zu sehen. 

![Vorderseite](images/fonts_front.jpg){#fonts_front}

Um die Lesbarkeit auch auf einer rückseitigen Prägung zu gewährleisten wurde auf beiden Seiten getestet, auf der Rückseite ist der Vorteil einer tieferen Prägung sogar noch deutlicher zu erkennen. 

![Rückseite](images/fonts_back.jpg)

Alle drei Fonts kamen gut zu Geltung, letztendlich war unser einstimmiger Favorit aber [Bungee](https://fonts.google.com/specimen/Bungee).
Da der Font nur Großbuchstaben enthält wurde der finale Projektname auf "ROBIT" festgelegt. 

### Integration der Logos

Um die Zugehörigkeit aller Komponenten zum Projekt zu zeigen wurde alles mit dem zuvor entworfenen Logo markiert. 
Ergänzend wurden auch das Logo der FAU und die Logos von den Gruppenmitgliedern hinzugefügt, um Herkunft und Autor zu kennzeichnen. 

Zuletzt wurde als *Easteregg* auch ein Verweis auf das Jahr und die aktuelle Studiensituation hinzugefügt. 

Alle Grafiken wurden in Inkscape entworfen, in saubere, nicht überlagerte Flächen kombiniert und als SVG-Datei geteilt. 


## Milestone 3: Entwicklung Basisfunktionen

### Ultraschallsensor
Der verwendete Sensor war eine HC-SR04, durch dessen weite Verbreitung war die Integration einfach. 
Eine Glättung der Werte wurde durch die Minimumbildung zwischen mehreren Werten realisiert, da Abweichungen, z.B. durch Reflektionen, nur größer als reale Werte sein können. 
Aus der Rundlaufzeit konnte leicht die Distanz (unter Annahme konstanter Schallgeschwindigkeit) durch $$distance = \frac{duration}{2*29.1545}$$ ermittelt werden. 

![HC-SR04 Plot](images/HC-SR04_plot.png)

Ein größeres Problem waren die Sonarquerschnitte: Je nach Winkel und Form des Objekts wurden die Ultraschallpulse nicht zurück zum Sensor reflektiert, das Objekt wurde dadurch unsichtbar. 
[HC-SR04 Plot Rotation](#SR04_plot_rotation) zeigt die Messwerte eines rechteckigen Objekts das langsam rotiert wird. Die Maximalwerte stellen fehlende Rückgaben dar. 

![HC-SR04 Plot Rotation](images/HC-SR04_plot_rotation.png){#SR04_plot_rotation}

Langsamere Drehungen haben durch eine feinere Auflösung zu mehr Detektionen geführt, genauso auch die Mittelung über mehr Messungen. 
Die Begrenzung der maximalen Messlänge hat durch eine Verringerung der Fehldetektion von Wänden und Reflektionen weiter die Logik vereinfacht, führt aber auch zu einer Reduktion der effektiv nutzbaren Fläche. 


### Entwurf des Schatzes

Im Laufe der Entwicklung wurden mehrere Formen evaluiert: Zylindrische Formen waren winkelstabil, aber auch gleichbleibend unzuverlässig. 
Rechteckige Querschnitte wurden direkt verworfen, da eine Detektion an den Ecken völlig unmöglich war. 
Eine interessante Alternative war eine durch Radarprismen inspirierte komplexere Form ([Render Radarprisma](#render_radarprisma)), die zwar nicht mehr realistisch, aber besser zu erkennen war. 
Die hier verwendeten Innenwinkel haben zusätzlich zur etwas besseren Winkelstabilität die Detektionsreichweite merklich verbessert. 
Trotzdem ist die Erkennung frontal zum spitzen Winkel merklich schlechter als vor dem Innenwinkel. 

![Render Radarprisma](images/render_radarprisma.png){#render_radarprisma}

Daraus hat sich eine Modifikation des Zylinders durch kleine Reflektionskerben ergeben:

![Prismenoberfläche](images/knurling.png)

Die Erkennbarkeit hat sich dadurch leicht verbessert, größer war der Vorteil in der Haptik. 

![Render Schatz](images/render_schatz.png)


Der zylindrische Schatz lässt sich außerdem aufschrauben, um einen Anreiz für Schüler zu verstecken. 
Hierfür wurde ein eigenes Gewinde mit besser druckbarem Winkel entworfen, das kein Stützmaterial benötigt. 
Außerdem wurde eine Einkerbung mit dazu passender Erhöhung entworfen, die ein Klickverhalten beim Drehen realisieren. 

![Einkerbung](images/notches.png)

Der finale Entwurf des zylindrischen Schatzes ist damit in [Render Schatz Querschnitt](#render_schatz_cut) zu sehen. 

![Render Schatz Querschnitt](images/render_schatz_cut.png){#render_schatz_cut}


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
Im Uhrzeigersinn gedreht wird der Sensor empfindlicher. Die angelegte Spannung hat ebenfalls einen großen Einfluss auf die Empfindlichkeit, 
daher sollten Kalibrierungen nur mit Verbindung zur Powerbank und laufendem Motor vorgenommen werden. 

Problem unseres Sensors ist die Polarität, da das Magnetfeld nur in eine Richtung erkannt wird. 
Bei mehreren abwechselnd gedrehten Magneten gabt es zwar genug Magnetkraft zum Halten, allerdings erkannte der Sensor nur jeden zweiten Magneten.
Eine gleiche Ausrichtung dagegen ist einfach zu erkennen, aber nicht mehr stark genug zum halten. 
Daher musste von mehreren Magneten auf einen einzelnen, richtig orientierten Magneten gewechselt werden. 


### Lichtsensor
Um die Grenzen des Spielfelds zu erkennen wurde ein Lichtsensor verbaut. Ein binäres Signal ist dabei ausreichend, die Lichtverhältnisse werden einmalig kalibriert.
Das linke Potentiometer stellt dabei die Empfindlichkeit ein, das rechte die Helligkeit der reflektierten LED. 
Die verbaute rote LED zeigt Reflektionen an, ein leichtes Glimmen ist ein Zeichen für eine unzureichende Stromzufuhr und kann ein Indikator für einen Kabelbruch sein. 

Eine Detektion ist bei Distanzen bis 1cm verlässlich, für Feinjustierungen wurde ein Slot modelliert, der den Abstand zum Boden veränderbar macht. 
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

Höhen und Ausrichtungen der Sensoren wurden mit Hilfe des Prototypen experimentell ermittelt oder einstellbar modelliert. Die Elektronik wurde in einer nach unten geöffneten Box unterhalb der Powerbank untergebracht und kann mit einem [Deckel](#photo_cover) vor Berühren geschützt werden. 

![Foto Deckel](images/photo_cover.jpg){#photo_cover}

Für eine bessere Wartbarkeit wurde bei Schraubverbindungen Aussparungen für Insert modelliert. Für die Kabelführung zum Powerbank wurden Aussparungen auf der Rückseite des Roboters modelliert, neben dran befindet sich ein Schalter, der den Strom der Motoren unterbricht um ein ungewolltes Bewegen beim Programmieren zu verhindern. 
Als Stützrad wurde sich nach mehreren Tests für eine omnidirektionale Rolle aus einem Roll-On-Deodorant entschieden und eine Halterung für diese auch im CAD eingefügt. 
Nach einem Testdruck und einer Einpassung der Komponenten wurden noch kleinere Änderungen vorgenommen. Auch eine Personalisierung durch eigene Logos auf der Karosserie wurde hinzugefügt.

![Render Karosserie Draufsicht](images/render_carriage_top.png)

### Implementierung der Logik
Für die Modellierung des Programmablaufs wurde ein [Zustandsdiagramm](#state_chart) verwendet.

![Prototyp des Progammablaufs](images/state_chart.png){#state_chart}

Hierbei wurden Probleme, wie die kontinuierliche Aktualisierung der Sensoren, ausfindig gemacht und behoben. Anschließend wurde dieses Zustandsdiagramm mit Hilfe einer `switch` Anweisung in Programmcode umgesetzt und erweitert. 



## Milestone 4: Entwicklung Zusatzfunktionen

### Aufspalten in Bibliotheken
Die unterschiedlichen Levels der Integration, die Schülern angeboten werden, wurden bereits während der Entwicklung berücksichtigt: 
Zunächst wurde mit Hilfe eines Prototyps und einer Testschaltung Programmcode entwickelt und auf die Komponenten angepasst. Anschließend wurde dieser Code in einzelne Bibliotheken aufgespalten. 
Unsere eigenen Klassen wurden so konzipiert, dass sie mehr Funktionalität bieten, als in unserer eigenen Implementierung verwendet wurde. Somit werden auch andere Lösungen ermöglicht.
Den Klassen wurden Kurzbeschreibungen mit Informationen über das Level und die Verwendung im Header hinzugefügt.

### Entwicklung des Wrappers
Um die Programmierung für Schüler zu vereinfachen wurden komplexe Sachverhalte abstrahiert und in verschiedene Level aufgeteilt, zu sehen in [Aufteilung in Levels](#aufteilung-in-levels).
 
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

In der Referenzimplementierung wurde eine Warnungsanzeige, ein Herzschlag und die Anzeige vom Status angezeigt, in manchen Zuständen wurden außerdem die Distanz oder der Fortschritt dargestellt. 

Als Anwendungsbibliothek wurde [FastLED](https://github.com/FastLED/FastLED) verwendet, hier wurde auch die globale Helligkeit limitiert um Überhitzungen zu vermeiden. 

Die ideale Wandstärke, Passtoleranz und Form über den LEDs wurde experimentell bestimmt. 

![LED Drucktest](images/led_thickness.png)

Selbst bei schwarzem Filament kamen bei 0.2mm Dicke noch genug Licht durch, beim verwendeten gelben Filament konnte die Dicke sogar 
auf 0.4mm erhöht werden um die Form der LEDs im ausgeschalteten Zustand besser zu verwischen. 
Runde Lichtkanäle haben den Lichtkegel etwas runder gemacht, die zusätzlich benötigte Tiefe war dieser Vorteil nicht wert. 


### Platine
Zu Beginn wurde erstmal eine provisorische Platine gefertigt um Grundfunktionen zu testen, die während der weiteren Entwicklung laufend ergänzt wurde. 

Als Hauptplatine wurde eine 4x6cm Lochrasterplatine gewählt, um die Baugröße möglichst kompakt zu halten.
Der Entwurf der elektrischen Komponenten wurde mit Hilfe der Open-Source Software [Fritzing](https://fritzing.org) durchgeführt.
Dabei wurde auch eine Visualisierung der Komponenten erstellt um Schülern weitere Informationen zum Innenleben des Fahrzeugs zu bieten. 

![Schaltplan](images/schematic.png)

![Schaltplan](images/schematic_graphical.png)

Der Kompass-Sensor wurde auf der Achse mittig zwischen den Motoren platziert, um keine Winkelkorrektur berechnen zu müssen.  
Der Microcontroller, der Kompass-Sensor und der Motortreiber wurden mit Stiftleisten versehen und auf Buchsenleisten gesteckt, um die Wartung und den Austausch dieser Komponenten zu erleichtern.
Auch die weiteren Sensoren wurden über Stiftleisten und Buchsenleisten verbunden und sind so absteckbar.
Ein Kondensator wurde parallel zur Stromversorgung verlötet um Spannungsschwankungen auszugleichen.
Der Motortreiber wurde mit der Unterseite nach oben verbaut um der Schraubklemme genügend Platz zu lassen.
Der Microcontroller wurde so orientiert, dass die Micro-USB-Buchse zur Rückseite des Fahrzeugs zeigt, so reicht ein kurzes USB-Kabel aus und Interferenzen durch die Motortreiber werden minimiert.

![Platine Frontansicht](images/pcb_front_test.jpg)

Für die Leiterbahnen wurden Litzenleitungen mit einer Stärke von 20 AWG auf der Rückseite der Platine gelötet. Die leistungsführenden Leitungen zu den Motoren wurden zusätzlich durch Lötbrücken verstärkt.

![Platine Rückansicht](images/pcb_back_test.jpg)

Um die Platine im Gehäuse zu fixieren, wurden die vorhandenen 4 M2-Löcher in den Ecken der Lochrasterplatine verwendet. Im Gehäuse wurden entsprechende M2-Gewindeeinsätze und Abstandhalter eingefügt.

![Einbau](images/pcb_assembly.jpg)



## Milestone 5: Fertigung
Die Fertigung und Verwendung des Prototyps offenbarte in vielen Bereichen ein Optimierungspotential für das finale Fahrzeug. 
Die für den Prototypen gedruckten Teile wurden vor allem auf Druckgeschwindigkeit optimiert und hatten nur eine geringe Druckauflösung, beide Aspekte wurden für das finale Modell auf Qualität optimiert. 

Um einen konsistenten Stand zu erhalten wurden wurden alle notwendigen CAD Optimierungen bis zu einer Deadline am 15.7.2020 umgesetzt und anschließend die finalen Teile gedruckt. 
Danach anfallende kleinere Änderungen wurden nur noch im Modell angepasst und nicht mehr gefertigt. 
Die Karosserie wurde in Gelb gedruckt, um - passend zum Szenario - auf ein gelbes U-Boots anzuspielen. Der Druck der Karosserie benötigte 150g PLA und 13 Stunden Druckzeit.

![Foto Drucken](images/photo_print.jpg)

Die Bodenplatte wurde aus transparentem Acrylglas gefertigt. Hierfür wurden mit Hilfe eines selbst gebauten Lasercutters die Beschriftungen graviert und die Umrisse angezeichnet. Anschließend wurden diese Umrisse per Hand ausgeschnitten, da der Laser nicht genug Leistung für einen Schnitt durch die komplette Dicke des Materials hatte. 
Zur finalen Fertigung gab es das erste persönliche Treffen, alle vorherigen Abstimmungen fanden den Umständen entsprechend online statt. Alle Teilnehmer haben ihre jeweiligen Komponenten zusammengetragen und individuellen Hinweise zu Komponenten erfasst. Vor dem Zusammenbau wurde ein Explosionsbild aller verwendeter Komponenten aufgenommen, um den vollen Umfang der [Teileliste](#teileliste) auch bildlich zu erfassen. 

![Explosionsbild](images/explosion.jpg)

Bei Tests mit der finalen Karosserie viel auch ein zu hoher Winkel des Ultraschallsensors auf, wodurch der Schatz schwerer erkannt werden konnte. 
Eine Neigung von etwa 2° nach unten hat die Detektion etwas verbessert, die Erhöhung des Schatzes hätte dessen Gewicht unnötig vergrößert und den Entwurf der Angel verkompliziert. 
Außerdem fielen noch kosmetische Verbesserungsmöglichkeiten auf, wie die Tiefe der Inserts und eine Abrundung über den Motoren. 
All diese Änderungen wurden im CAD Modell angepasst und die finalen Modelle als STL-Datei und veränderbarere STP-Datei exportiert.

Um die Lesbarkeit des Logos zu erhöhen wurde außerdem eine schwarze Klebefolie ergänzt, die gleiche Folie wird auch verwendet um die Powerbank zu kennzeichnen.  

![Logo Basic](images/robit_logo_basic.jpg)

![Logo Tape](images/robit_tape.jpg)



## Milestone 6: Dokumentation

### Laufzeitermittlung

Um die maximale Laufzeit des Fahrzeugs zu ermitteln wurde zuerst der Verbrauch in verschiedenen Szenarien gemessen. 
Der mit Abstand größte Verbraucher waren die Motoren, zweitrangig waren die LEDs, die Verarbeitungslogik war effektiv nicht mehr messbar. 
Im Stillstand wurden so unter 0.1 Watt gemessen, beim Anfahren bis zu 4 Watt. 

![Verbrauch](images/Verbrauch.jpg)

Je nach Verfahren kann so bei einer Powerbank-Kapazität von 37 Wattstunden eine Lautzeit von über 12 Stunden erreicht werden. 
Dies ist mehr als ausreichend für unsere Anwendung und macht Ladevorgänge während den Entwicklungszeiten optional. 


### Handbuch schreiben
Um alle Erkenntnisse unserer Entwicklung und des Referenzprojekts zu erfassen wurde ein Handbuch für Lehrkräfte mit allen relevanten Informationen zur Durchführung des Projekts verfasst. 

Wie beim Rest der Dokumentation wurde sich für `Markdown` als Auszeichnungssprache und `Pandoc` als Konvertierungswerkzeug entschieden. Somit können wir die bisherigen `Markdown` Notizen in ein mit `LaTeX` gesetztes PDF-Dokument umwandeln und so die Vorteile von beidem nutzen. 
Um Dopplungen zu vermeiden wurde das Handbuch mit der Einleitung des Projekts vereinigt, zu finden in [Das Projekt ROBIT](#das-projekt-robit). In diesem wird das Szenario beschrieben, was die Zielgruppe ist und welche Lehrinhalte vermittelt werden. Außerdem sind hier die Level beschrieben, aus denen die Lehrkraft je nach den Vorkenntnissen der Gruppe einen passenden Schwierigkeitsgrad auswählt.
 
Die ausführenden Gruppenmitglieder werden durch die in Kommentaren und Header-Beschreibungen der ihnen zur Verfügung stehenden Klassen weiter informiert.


