#!/bin/bash

set -e
set $*

XAUTH="$(ps -C X f | sed -n 's/.*-auth \([a-zA-Z0-9./]*\).*/\1/p')"
if [[ -z $XAUTH ]]
then
    # if XAUTH is blank try another way to get it 
    XAUTH="$(ps -C xinit f | sed -n 's/.*-auth \(.*\)serverauth.*/\1Xauthority/p')"
fi

export DISPLAY=:0
export XAUTHORITY=$XAUTH

# Hack to detect whether or not we're docked. Thinkpad Mini Dock Plus Series 3
# doesn't show up in sysfs as a dock, so test for the extra USB ports instead
dockusb=/sys/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1.5

function lock {
    xautolock -enable
    xautolock -locknow
}

function setbg {
    sudo -u asarkar bash -c 'eval $(<$HOME/.fehbg)'
}

function dock {
    xrandr --output LVDS1 --off
    xrandr --output HDMI3 --auto --primary --output HDMI2 --auto --right-of HDMI3
    setbg
}

function undock {
    xrandr --output HDMI3 --off --output HDMI2 --off
    xrandr --output LVDS1 --auto
    setbg
}

function standby {
    mount | awk '$5 == "fuse.sshfs" {print $3}' | parallel umount
    lock
    pm-suspend
    # Make sure video outputs are correct on resume
    if [[ -d $dockusb ]]
    then
        dock
    else
        undock
    fi
}

case $1 in
    button/lid)
        if [[ $3 == "close" &&  ! -d $dockusb ]]
        then
            standby
        fi
        ;;
    button/screenlock)
        lock
        ;;
    button/sleep)
        standby
        ;;
    button/f24)
        xinput set-int-prop "SynPS/2 Synaptics TouchPad" "Device Enabled" 8 0
        ;;
    ibm/hotkey)
        if [[ $2 == IBM0068:00 ]]
        then
            if [[ $4 == 00004010 ]]
            then
                dock
            elif [[ $4 == 00004011 ]]
            then
                standby
            fi
        fi
        ;;
    dock)
        dock
        ;;
esac
