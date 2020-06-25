#!/bin/bash


ssh ndi@192.168.1.80  "killall ffplay &"
ssh ndi@192.168.1.82  "killall ffplay &"
ssh ndi@192.168.1.112 "killall ffplay &"
