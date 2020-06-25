#!/bin/bash

# run this from the development machine: it pushes the website from my laptop to the management server.

scp -P 56357 site/* ndi@192.168.1.75:/var/www/html/
