#!/bin/bash

# this should make it actually possible to run commands without needing a password.  

sudo passwd root
sudo passwd -u root
echo "PermitRootLogin yes" | sudo tee -a /etc/ssh/sshd_config
service ssh reload