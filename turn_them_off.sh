#!/bin/bash

source /home/ndi/ndi-receiver-config/hardware.list

for address in "${ip_addresses[@]}"
do 

  ssh root@"$address" "shutdown -h now" 
  
done
