#!/bin/bash

# This is the comprehensive script, that combines all the others. It should not
#  be used by itself, however, since it has no way to recover from errors.

# [ -z "$1" ] && echo "specify NDI stream" && exit

set -v

# NDI_STREAM_NAME="${1@Q}"

# echo "$NDI_STREAM_NAME"



bash /home/ndi/ndi-receiver-config/turn_on_and_play.sh  192.168.1.108 78:45:c4:13:be:9e "$NDI_STREAM_NAME" &
# bash /home/ndi/ndi-receiver-config/turn_on_and_play.sh  192.168.1.80  00:1d:09:8e:e1:36 "$NDI_STREAM_NAME" &
bash /home/ndi/ndi-receiver-config/turn_on_and_play.sh  192.168.1.112  c8:1f:66:1c:97:ee "$NDI_STREAM_NAME" &
