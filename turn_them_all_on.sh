#!/bin/bash

set -v
source hardware.list

for address in "${mac_addresses[@]}"
do 

  sudo etherwake -i enp0s7 -D  "$address"
  
done