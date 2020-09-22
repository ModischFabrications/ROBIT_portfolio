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

TODO Querschnitt mit Gewinde

### Angel

Halterung für Servo und LED-Streifen


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




## Milestone 4: Entwicklung

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



