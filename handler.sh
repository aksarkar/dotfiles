#!/bin/bash

set -e
set $*

XAUTH="$(ps -C X f | sed -n 's/.*-auth \(.*\)/\1/p')"
if [[ -z $XAUTH ]]
then
    # if XAUTH is blank try another way to get it 
    XAUTH="$(ps -C xinit f | sed -n 's/.*-auth \(.*\)serverauth.*/\1Xauthority/p')"
fi

export DISPLAY=:0
export XAUTHORITY=$XAUTH

function lock {
    xautolock -locknow
}

function standby {
    lock
    pm-suspend
}

case $1 in
    button/lid)
        if [[ $3 = "close" ]]
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
esac
