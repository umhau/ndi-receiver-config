#!/bin/bash

# The webserver has very minimal permissions; all it can do is write files to a
#  local folder with 777 permissions.  To pass a command elsewhere, I use this 
# script to detect those files, and execute the corresponding commands.  This 
# script is turned on and runs permanently in a loop.  To prevent race 
# conditions we grab the oldest modified file, then delete them all.

# to run this file, it is essential that it have a tty on which to output text.
# ffplay can't function otherwise.  Set up a systemd service, and enable it, to
# run a command on boot.  To get the tty, use tmux: create a default tmux 
# session that runs the script we want inside it. 

while : ;
do
  if [ "$(ls -A /var/www/html/commands)" ]; then # directory is not empty.

    # get name of oldest modified file
    filename="$(ls -t /var/www/html/commands/ | tail -1)"; echo $filename

    # delete all command files
    rm -rf /var/www/html/commands/*

    case "$filename" in
      poweron)
        bash /home/ndi/ndi-receiver-config/turn_them_all_on.sh
        ;;
      startndi)
        bash /home/ndi/ndi-receiver-config/playdefaultstream_all.sh
        ;;
      stopndi)
        bash /home/ndi/ndi-receiver-config/stopndistream_all.sh
        ;;
      poweroff)
        bash /home/ndi/ndi-receiver-config/turn_them_off.sh
    esac

  fi

  sleep 1

done
