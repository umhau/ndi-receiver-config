#!/bin/bash
# assume the machines are running.  Send the command to stop the default NDI stream on each machine.
ssh ndi@192.168.1.112 "killall ffplay" &
ssh ndi@192.168.1.108 "killall ffplay" &
ssh ndi@192.168.1.31  "killall ffplay" &