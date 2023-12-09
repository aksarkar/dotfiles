#!/bin/bash
set -e
xrdb -merge .Xresources
xinput disable $(xinput -list | sed -n '/ELAN901C:00/ s/.*id=\([0-9]*\).*/\1/p')
setxkbmap -device $(xinput -list | sed -n '/AT Translated Set 2 keyboard/ s/.*id=\([0-9]*\).*/\1/p') -option ctrl:swapcaps -option compose:ralt
sh $HOME/.fehbg
redshift &
urxvtd &
unclutter &
xss-lock -- i3lock -c 000000 -u &
exec i3
