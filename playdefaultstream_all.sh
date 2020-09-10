#!/bin/bash
# assume the machines are running.  Send the command to play the default NDI stream on each machine.
ssh ndi@192.168.1.112 "bash /home/ndi/play_default.sh" &
ssh ndi@192.168.1.108 "bash /home/ndi/play_default.sh" &

