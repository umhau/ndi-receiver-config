# grab job files out of the web server and give them to the essay generator
# reformat them, and move them to the internal server with more horsepower

shopt -s extglob       # this makes the number detector in the file grabber work

echo "Use CTRL-Z or \'touch stop\' to exit"

while true ; do

    echo "entered while loop"

    RF="$(ls -Art jobs/+([0-9]).job 2>/dev/null | tail -n 1)"     # most Recent File

    echo $RF
   
    [ -n $RF ] && scp "$RF" pp01:/data/ghostwriter-saas/jobs/ && rm -rf "$RF"

    [ -f stop ] && rm -rf stop && exit  # ctrl-c does not work: use `touch stop`

    # split into rand.keyphrases

    # and rand.email

done

# OOPS: grab the oldest file, not the newest