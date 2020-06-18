#!/bin/bash
set v

# this should be parsed to give just the list of sources
/home/ndi/bin/ffmpeg -f libndi_newtek -find_sources 1 -i dummy