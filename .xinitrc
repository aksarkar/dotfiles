#!/bin/bash
set -e

# System xinitrc
if [[ -d /etc/X11/xinit/xinitrc.d ]]
then
    for f in $(find /etc/X11/xinit/xinitrc.d/ -type f -executable)
    do
        . $f
    done
fi

# Local resources
xrdb -merge .Xresources

sh .fehbg

# Ultranav configuration
xinput set-prop "SynPS/2 Synaptics TouchPad" "Device Enabled" 0

# Daemons
ionice -c 3 dropbox start -i &
redshift &
unclutter -not QEMU &
urxvtd &
xautolock -locker "i3lock -c 000000 -u" &

exec i3
