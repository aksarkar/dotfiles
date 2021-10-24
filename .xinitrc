#!/bin/bash
set -e
xrdb -merge .Xresources
setxkbmap -device 14 -option ctrl:swapcaps -option compose:ralt
sh $HOME/.fehbg
redshift &
urxvtd &
unclutter &
xss-lock -- i3lock -c 000000 -u &
exec i3
