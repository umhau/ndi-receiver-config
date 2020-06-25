#!/bin/bash

ssh root@192.168.1.112 "shutdown -h now"
ssh root@192.168.1.80  "shutdown -h now"
ssh root@192.168.1.82  "shutdown -h now"

