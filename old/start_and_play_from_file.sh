#!/bin/bash
set -v

ip_address="$1"
mac_address="$2"

# start one machine (if not on) and play the stream specified in the file /var/www/html/streamname.txt

# if machine is offline, start it and wait 90 seconds for it to boot
! ping -c 1 "$ip_address" && sudo etherwake -i enp0s7 -D "$mac_address" && sleep 90

# upload stream file to the computer
scp /var/www/html/streamname.txt "$ip_address":/home/ndi/streamname.txt

# tell the machine to play the NDI stream named in the file, using its own ffplay command
ssh ndi@"$ip_address" "bash /home/ndi/play_streamfile.sh"

