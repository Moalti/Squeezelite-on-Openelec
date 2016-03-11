# Squeezelite-on-Openelec (Shared Audio Output)

1. SQUEEZELITE INSTALLIEREN
---

`SSH Login zum Openelec (User:root / Passwort: openelec)`<br>
`mkdir /storage/.kodi/userdata/squeezelite`<br>
`cd /storage/.kodi/userdata/squeezelite`<br>
`wget https://github.com/Moalti/Squeezelite-on-Openelec/blob/master/squeezelite-1.8.3-715-armv6hf.tar.gz`<br>
`tar -xzf squeezelite-1.8.3-715-armv6hf.tar.gz`<br>
`chmod u+x squeezelite`<br>

HINWEIS: 
Download-Repo von Ralph Irving.<br> 
Hier besteht die Möglichkeit neuere Versionen und andere Plattformen von Squeezelite herunterzuladen:<br>
http://thedigitallifestyle.com/w/index.php/2014/05/15/installing-squeezelite-on-openelec-xbmc-shared-audio-output-device/

2. SQUEEZELITE KONFIGURIEREN
---

Squeezelite benötigt auf dem RasberryPi2 den ALSA Treiber. Dieser muss im vorfeld geladen werden:<br>
`modprobe snd-bcm2835`

Audio-Device wählen:<br>
`aplay -l` oder `/storage/.kodi/userdata/squeezelite/squeezelite –l`

<pre>
Output devices:
  null                           - Discard all samples (playback) or generate zero samples (capture)
  default:CARD=ALSA              - bcm2835 ALSA, bcm2835 ALSA - Default Audio Device
  sysdefault:CARD=ALSA           - bcm2835 ALSA, bcm2835 ALSA - Default Audio Device
</pre>

Maximal Sample Rate ermitteln:<br>
`/storage/.kodi/userdata/squeezelite/squeezelite -d output=debug`

Die Zeile "output_init_common:411 supported rates:" ist interessant. 
Bei mir ergibt sich eine maximale Sample Rate von 384000. 

Startparamter:<br>
`/storage/.kodi/userdata/squeezelite/squeezelite -o default:CARD=ALSA -r 384000 -n Schlafzimmer -s 10.10.10.2`

<pre>
 - o Ausgabe Device
 - r Maximal Sample Rate
 - n Name des Squeezebox Player
 - s IP-Adresse des Logitech Media Server
</pre>




