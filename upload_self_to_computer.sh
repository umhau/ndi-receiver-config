#!/bin/bash

# push the current version of these files to the ndi home dir of the specified IP address

scp -r ../ndi-receiver-config ndi@"$1":/home/ndi/