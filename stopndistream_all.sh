#!/bin/bash
# assume the machines are running.  Send the command to stop the default NDI stream on each machine.

set -v
source /home/ndi/ndi-receiver-config/hardware.list

for address in "${ip_addresses[@]}"
do 

  ssh ndi@$address  "killall ffplay"
  
done