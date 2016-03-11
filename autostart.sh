#!/bin/sh

# Start SqueezeLite

(sleep 20; \

exec /storage/.kodi/userdata/squeezelite/squeezelite -o default:CARD=ALSA -r 8000 -n Schlafzimmer -s 10.10.10.2

)&amp;
