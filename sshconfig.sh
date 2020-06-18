#!/bin/bash
set v

addresses=("112" "80" "82")

if [ ! -f $HOME/.ssh/id_rsa ]; then ssh-keygen; fi

for i in "${addresses[@]}"; do ssh-copy-id ndi@"192.168.1.$i"; done
