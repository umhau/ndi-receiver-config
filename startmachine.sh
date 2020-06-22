#!/bin/bash

# dependency: sudo apt install etherwake
# use: bash startmachine.sh <MAC address>

# see runasroot.sh; this should not require a password
sudo etherwake -i enp0s7 -D "$1" 