#!/bin/bash 

# turns on a single computer, specified with ip, mac and ndi 

set -v

NDI_STREAM_NAME="${3@Q}"

sudo etherwake -i enp0s7 -D "$2" 

sleep 90

ssh ndi@$1 "bash /home/ndi/play.sh $NDI_STREAM_NAME" &
