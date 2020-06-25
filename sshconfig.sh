#!/bin/bash
set v

if [ ! -f $HOME/.ssh/id_rsa ]; then ssh-keygen; fi

ssh-copy-id ndi@192.168.1.112
ssh-copy-id ndi@192.168.1.80
ssh-copy-id ndi@192.168.1.82

ssh-copy-id root@192.168.1.112
ssh-copy-id root@192.168.1.80
ssh-copy-id root@192.168.1.82
