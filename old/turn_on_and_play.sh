#!/bin/bash 

# turns on a single computer, specified with ip, mac and ndi 

set -v

touch "/var/www/html/test/testfile $1 $2"

# NDI_STREAM_NAME="${3@Q}"

# if machine is offline, start it and wait 90 seconds for it to boot
# ! ping -c 1 "$1" && sudo etherwake -i enp0s7 -D "$2" && sleep 90

# sudo etherwake -i enp0s7 -D "$2" 

# sleep 90

# ssh ndi@"$1" "bash /home/ndi/play_default.sh" &

touch playndi
scp playndi ndi@"$1":/home/ndi/

