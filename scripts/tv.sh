#!/bin/bash
set -e
pkill -USR1 redshift
eval $(<$HOME/.fehbg)
case $(</sys/class/drm/card0-HDMI-A-1/status) in
    connected)
        xrandr --output HDMI1 --auto --right-of LVDS1
        ln -s $HOME/.dotfiles/hdmi.asoundrc $HOME/.asoundrc
        lc.sh
        ;;
    disconnected)
        xrandr --output HDMI1 --off
        rm -f $HOME/.asoundrc
        lc.sh 1
        ;;
esac
