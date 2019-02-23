#!/bin/bash
set -e
xrdb -merge .Xresources
xinput set-prop "DELL08AF:00 06CB:76AF Touchpad" "libinput Accel Speed" 1
xinput set-prop "DELL08AF:00 06CB:76AF Touchpad" "libinput Tapping Enabled" 1
setxkbmap -option ctrl:swapcaps
sh $HOME/.fehbg
emacs --daemon &
urxvtd &
xss-lock -- i3lock -c 000000 -u &
exec i3
