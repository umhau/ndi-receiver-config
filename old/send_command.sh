#!/bin/bash

set v

SERVER="$1"
REMOTE_SCRIPT="$2"

ssh ndi@"$SERVER" /home/ndi/ndi-receiver-config/"$REMOTE_SCRIPT" 