#!/bin/bash

# dependency: sudo apt install etherwake
# use: bash startmachine.sh <machine number>

# set v

MACHINE="$1"

# given the machine name, wake it up using the associated MAC address
case $MACHINE in
   2) MAC='78:45:c4:13:be:9e';;
   3) MAC='00:1d:09:8e:e1:36';;
   4) MAC='c8:1f:66:1c:97:ee';;
   *) echo "ERROR: bad machine name given!" && exit;;
esac

sudo etherwake -i enp0s7 -D "$MAC"