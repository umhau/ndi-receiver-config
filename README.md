# NDI CONTROL

[ ] simple command scripts
[ ]     start stream (save PID)
[ ]     stop stream (needs PID)
[ ]     wake on lan

[ ] configure a server to control the machines (good use for the 1 core emachine?)

[ ] reboot / shutdown without sudo

## use

    bash startmachine.sh 3 # i.e. machine ndi03
    bash list_sources.sh
    bash play.sh 'NDI source'
    
## setup 

    bash ./autologin.sh
    bash ./runasroot.sh

On the master controller, 

    bash sshconfig.sh

