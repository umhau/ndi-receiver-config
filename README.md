# NDI CONTROL

## useful commands

list available NDI sources

  /home/ndi/bin/ffmpeg -f libndi_newtek -find_sources 1 -i dummy

## hardware addresses 

All logins are 

    ndi::adclare55ndi03

The addresses of the three (so far) NDI recievers are: 

   ndi02 | 78:45:c4:13:be:9e | 192.168.1.112 | 
   ndi03 | 00:1d:09:8e:e1:36 | 192.168.1.80  | small screen upstairs
   ndi04 | c8:1f:66:1c:97:ee | 192.168.1.82

The address of the master server is: 

   ndi05 | f8:0f:41:18:4e:95 | 192.168.1.75

## TODO

[ ] simple command scripts
[ ]     start stream
[ ]     stop stream 
[ ]     wake on lan

[ ] website design: include a restart button for the controller

## use

    bash startmachine.sh 78:45:c4:13:be:9e
    bash list_sources.sh
    bash play.sh 'NDI source'
    
## setup 

    bash ./autologin.sh
    bash ./runasroot.sh

On the master controller, 

    bash sshconfig.sh



