## Weitere Szenarien:
- Explodierenden Reactor ausschalten (zu Nah an Bombe?)
- Blume gießen
- Mars Rover 
- Wall E (zu kindisch oder noch lustig?) -> "die" Blume retten
- Schatzsucher (passend und umsetzbar, aber wenig emotional)
- Virus isolieren

-> Abwägen Neugier vs. political correctness:
Bombenentschärfung vs. Schatzsucher

-> Modularer Greifer erlaubt mehrere Szenarien


## Programmierung
### ESP-hosted Web-IDE
Pros:
- keine Installation
- keine Treiber

Cons:
- WLAN Verfügbarkeit?
- HTTP(s) Zertifikat?
  - Blacklist-Probleme?
- aufwändig & komplex
- begrenzter Umfang


## Sprache
### C/C++ Arduino Framework:
Pros:
- weit verbreitet
- deutlich besser anwendbar

Cons:
- komplex


### MicroPython:
Pros:
- einfacher

Cons:
- wenig Boards
- wenig weiterverwendbar
- keine tolle IDE


### Arduino IDE bzw. PlatformIO
Pros:
- existierende Lösung
- Library-Verfügbarkeit -> zip

Cons:
- Installation
- USB-Treiber (OTA)
-> Raspberry als Notfall-Programmer, sonst reguläre Installation


## System
### Raspberry Pi
Pro:
- viel Speicher
- vielseitig 

Cons:
- bootet langsam
- braucht stabile Spannungsversorgung

### Arduino/ESP32
Pros:
- günstig
- geringer Verbrauch

Cons:
- wenig Speicher



## Akkus
### 18650, AA, LiPo-Pouches
- lieber eigene Akkus als AA vom Lehrer fordern
- austauschbar lassen sich verdrehen, aber flexibler
- laden beim programmieren wäre gut



# MVP (Minimum Viable Product)
- Installation: Arduino IDE + Arduino Nano + Dependencies -> 1h Setup

- C++ Wrapper über alle Libs

- Charge Controller + Step-Up Board
Stepperboard
- Akkus

- Servo für Greifer
- Rad direkt am Stepper (NEMA 17 o.ä.)

- Magnet + Sensor im Greifer

- Ultraschall-Sensor (HC-SR04)
- Line-Sensor

- CAD + 3DP: Gehäuse, Objekt, Aktorik-Arm

- Ausgabe-LEDs (WS2812B)

## Erweiterungen:
- Servo für Sonar
- Matrix
- steckbarer Greifer
