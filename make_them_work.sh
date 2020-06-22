#!/bin/bash

# This is the comprehensive script, that combines all the others. It should not
#  be used by itself, however, since it has no way to recover from errors.

NDI_STREAM_NAME="$1"                 # pass the stream name to the shell script
STARTTIME=$(date +%s)
TOO_LONG=180        # seconds before something went wrong starting the computer

# turn on the computers, if they aren't already on
ensure_reciever_is_on() { [ ! ping -c 1 "$1" ] && sudo etherwake -i enp0s7 -D "$2"; }
ensure_reciever_is_on 192.168.1.112 
ensure_reciever_is_on 192.168.1.80 
ensure_reciever_is_on 192.168.1.82

# wait until they successfully turn on
until ping -c 1 192.168.1.112 && ping -c 1 192.168.1.80 && ping -c 1 192.168.1.82
do
  sleep 10
  ENDTIME=$(date +%s)
  TOTALTIME=$(($ENDTIME - $STARTTIME))
  if [ "$TOTALTIME" -gt "$TOO_LONG" ]; then
    echo "something went wrong in the startup process"
    exit
  fi
done

# play the NDI stream on each system. Note that the exact command is different
# for some of the computers; thus, we use a wrapper script that we can 
# customize locally.
ssh ndi@192.168.1.112 "/home/ndi/play.sh $NDI_STREAM_NAME"
ssh ndi@192.168.1.80  "/home/ndi/play.sh $NDI_STREAM_NAME"
ssh ndi@192.168.1.82  "/home/ndi/play.sh $NDI_STREAM_NAME"