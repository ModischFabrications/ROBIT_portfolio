# Fazit

massentaugliches Projekt braucht mehr selbstentworfene Elektronik. 
Stabile Spannungen und eigene Akkus können effizienter sein, brauchen aber automatische Abschaltung. 


Motoren sind scheiße, lieber was teureres
eigene Regelung unnötig kompliziert, übersteuert oder schafft vollständie Ausrichtung nicht. 
Drehzahlsteuerung viel zu schlecht. 
Encoder würde Drehung deutlich berechenbarer machen


Ultraschallsensor nicht präzise und verlässlich genug, viele Workarounds und komplexere Erkennungslogik notwendig. 
Viele Messungen hintereinander geben höhere Verlässlichkeit, verringern durch die verlangsamte Zykluszeit aber auch die effektive Auflösung. 

Schatz wird seitlich verpasst. 
Bessere Lösungen als die Referenzimplementierung könnten beidseitig peilen und den Mittelpunkt von Erkennung und Verlust als Zielrichtung nutzen. 


Gyro-Lib ist nicht stabil verwendbar, Alternativen nur noch schlimmer. 

18650 und eigene Power sind vielleicht flexibler


PlatformIO hat Einstiegshürde, ist aber noch gut nutzbar


LEDs beliebig erweiterbar, zB durch Error & Co
weitere Kandidaten waren Distanz, Winkel oder Geschwindigkeiten. 
Gruppen können frei entscheiden was sie anzeigen wollen, ein direkter Zugriff auf die LEDs ist möglich. 

LED-Farben könnten durch Gammakorrektur kompensiert werden, besonders durch das gelbe Gehäuse


