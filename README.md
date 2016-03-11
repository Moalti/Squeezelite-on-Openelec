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

<b>Audio-Device wählen:</b><br>
`aplay -l` oder `/storage/.kodi/userdata/squeezelite/squeezelite –l`

<pre>
Output devices:
  null                           - Discard all samples (playback) or generate zero samples (capture)
  default:CARD=ALSA              - bcm2835 ALSA, bcm2835 ALSA - Default Audio Device
  sysdefault:CARD=ALSA           - bcm2835 ALSA, bcm2835 ALSA - Default Audio Device
</pre>

<b>Maximal Sample Rate ermitteln:</b><br>
`/storage/.kodi/userdata/squeezelite/squeezelite -d output=debug`

<pre>
[20:51:23.099236] output_init_alsa:865 init output
[20:51:23.100201] output_init_alsa:895 requested alsa_buffer: 40 alsa_period: 4 format: any mmap: 1
[20:51:23.100419] output_init_common:347 outputbuf size: 3528000
[20:51:23.100834] output_init_common:371 idle timeout: 0
[20:51:23.143305] output_init_common:411 supported rates: 384000 352800 192000 176400 96000 88200 48000 44100 32000 24000 22500 16000 12000 11025 8000 
[20:51:23.162866] output_init_alsa:911 memory locked
[20:51:23.163854] output_thread:664 open output device: default
[20:51:23.163885] output_init_alsa:934 set output sched fifo rt: 45
[20:51:23.164203] alsa_open:381 opening device at: 44100
[20:51:23.168111] alsa_open:432 opened device default using format: S32_LE sample rate: 44100 mmap: 1
[20:51:23.169308] alsa_open:511 buffer: 40 period: 4 -> buffer size: 1760 period size: 440
[20:51:23.182427] output_flush:424 flush output buffer
[20:51:23.184440] output_flush:424 flush output buffer
</pre>

Die Zeile "output_init_common:411 supported rates:" ist interessant.<br>
Bei mir ergibt sich eine maximale Sample Rate von 384000. 

<b>Startparamter:</b><br>
`/storage/.kodi/userdata/squeezelite/squeezelite -o default:CARD=ALSA -r 384000 -n Schlafzimmer -s 10.10.10.2`

<pre>
 - o Ausgabe Device
 - r Maximal Sample Rate
 - n Name des Squeezebox Player
 - s IP-Adresse des Logitech Media Server
</pre>

3. AUTOSTART
---

<b>Autostart von Squeezelite:</b><br>
`cd /storage/.config/`<br>
`touch autostart.sh`<br>
`chmod +x autostart.sh`<br>
`vi autostart.sh`

<pre>
#!/bin/sh
# Start SqueezeLite

(sleep 20; \

exec /storage/.kodi/userdata/squeezelite/squeezelite -o default:CARD=ALSA -r 384000 -n Schlafzimmer -s 10.10.10.2

)&amp;
</pre>

<b>Hinweis:</b> Die Startparamter in der autostart.sh entsprechend der ermittelten Werte und Wünschen anpassen!!!




