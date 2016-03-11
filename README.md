# Squeezelite-on-Openelec (Shared Audio Output)

1. SQUEEZELITE INSTALLIEREN
---------------------------

- SSH Login zum Openelec (User:root / Passwort: openelec)
- mkdir /storage/.kodi/userdata/squeezelite
- cd /storage/.kodi/userdata/squeezelite
- wget https://github.com/Moalti/Squeezelite-on-Openelec/blob/master/squeezelite-1.8.3-715-armv6hf.tar.gz (für RaspberryPi)
- tar -xzf squeezelite-1.8.3-715-armv6hf.tar.gz
- chmod u+x squeezelite

HINWEIS: 
Download-Repo von Ralph Irving. Hier besteht die Möglichkeit neuere Versionen und andere Plattformen von Squeezelite herunterzuladen:
http://thedigitallifestyle.com/w/index.php/2014/05/15/installing-squeezelite-on-openelec-xbmc-shared-audio-output-device/

2. SQUEEZELITE KONFIGURIEREN
----------------------------

Squeezelite benötigt auf dem RasberryPi2 den ALSA Treiber. Dieser muss im vorfeld geladen werden:

`modprobe snd-bcm2835`


Maximal Sample Rate ermitteln:

`/storage/.kodi/userdata/squeezelite/squeezelite -d output=debug`

Die Zeile "output_init_common:411 supported rates:" ist interessant. 
Bei mir ergibt sich eine maximale Sample Rate von 384000. 

Startparamter:

```/storage/.kodi/userdata/squeezelite/squeezelite -o default:CARD=ALSA -r 384000 -n Schlafzimmer -s 10.10.10.2

 - o Ausgabe Device
 - r Maximal Sample Rate
 - n Name des Squeezebox Player
 - s IP-Adresse des Logitech Media Server`




