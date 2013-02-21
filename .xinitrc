#!/bin/bash

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

# Ultranav configuration
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5
xinput set-prop "SynPS/2 Synaptics TouchPad" "Device Enabled" 0

# Keyboard configuration
kb1=$(xinput list | grep "AT" | sed -re "s/.*id=([0-9]+).*/\1/")
kb2=$(xinput list | grep "Topre" | sed -re "s/.*id=([0-9]+).*/\1/")
setxkbmap -device $kb1 -option ctrl:swapcaps
setxkbmap -device $kb1 -option compose:ralt
if [[ ! -z $kb2 ]]
then
    setxkbmap -device $kb2 -option compose:ralt
fi

# Set the cursor
xsetroot -cursor_name left_ptr

# Restore background
eval `cat $HOME/.fehbg` &

# Daemons
emacs --daemon
redshift &
unclutter &
urxvtd &
xautolock -locker "i3lock -c 000000 -u" &

xmonad
