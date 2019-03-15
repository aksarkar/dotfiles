#!/bin/bash
set -e
xrdb -merge .Xresources
xinput set-prop "ELAN292F:00 04F3:292F" "Device Enabled" 0
xinput set-prop "DELL08AF:00 06CB:76AF Touchpad" "libinput Accel Speed" 1
xinput set-prop "DELL08AF:00 06CB:76AF Touchpad" "libinput Tapping Enabled" 1
setxkbmap -device $(xinput | perl -ne '/AT Translated Set 2 keyboard.*id=([0-9]*)/; print $1') -option ctrl:swapcaps
sh $HOME/.fehbg
emacs --daemon &
redshift &
urxvtd &
unclutter &
xss-lock -- i3lock -c 000000 -u &
exec i3
