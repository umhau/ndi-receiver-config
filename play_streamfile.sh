#!/bin/bash

set -v

# the redirection at the end is necessary to prefent ffmpeg from exiting when 
# run in the background.  The command string will have to be modified in some 
# cases - e.g., where hdmi is not the audio channel being used.

DISPLAY=':0' SDL_AUDIODRIVER="alsa" AUDIODEV='hdmi:CARD=PCH,DEV=0' /home/ndi/bin/ffplay -af aresample=ocl=stereo -fs -f libndi_newtek -allow_video_fields false -i `cat /home/ndi/streamfile.txt`  > /dev/null 2>&1 < /dev/null
