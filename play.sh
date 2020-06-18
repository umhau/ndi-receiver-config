#!/bin/bash

set v
SOURCE="$1"

# this will have to be modified in some cases - e.g., where hdmi is not the 
# audio channel being used.
DISPLAY=':0' \
SDL_AUDIODRIVER="alsa" \
AUDIODEV='hdmi:CARD=PCH,DEV=0' \
/home/ndi/bin/ffplay -fs -f libndi_newtek -allow_video_fields false -i "$SOURCE"