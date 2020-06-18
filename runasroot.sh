#!/bin/bash

# I need to run some commands as root. This make sure that will work.

# shutdown / reboot
if ! sudo grep --quiet "/usr/bin/reboot" /etc/sudoers 2>/dev/null; then
    TEXT="`whoami` ALL = NOPASSWD: /usr/bin/halt, /usr/bin/poweroff, /usr/bin/reboot, /usr/bin/shutdown, /usr/bin/zzz, /usr/bin/ZZZ"
    echo "$TEXT" | sudo EDITOR='tee -a' visudo
fi

# etherwake
if ! sudo grep --quiet "/usr/sbin/etherwake" /etc/sudoers 2>/dev/null; then
    TEXT="`whoami` ALL = NOPASSWD: /usr/sbin/etherwake"
    echo "$TEXT" | sudo EDITOR='tee -a' visudo
fi

# alternative: wakeonlan
if ! sudo grep --quiet "/usr/bin/wakeonlan" /etc/sudoers 2>/dev/null; then
    TEXT="`whoami` ALL = NOPASSWD: /usr/bin/wakeonlan"
    echo "$TEXT" | sudo EDITOR='tee -a' visudo
fi

echo "A reboot is required."