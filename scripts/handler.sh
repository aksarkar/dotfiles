#!/bin/bash
set -e
set -u
set $*

auth=$(pgrep -a Xorg | awk '{sub(/.*-auth/, "", $0); print $1}')
export XAUTHORITY=${auth?"failed to get XAuthority"}
export DISPLAY=:0

# Hack to detect whether or not we're docked. Thinkpad Mini Dock Plus Series 3
# doesn't show up in sysfs as a dock, so test for the extra USB ports instead
dockusb=/sys/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1.5

function lock {
    xautolock -enable
    xautolock -locknow
}

function setbg {
    sh /home/asarkar/.fehbg
}

function dock {
    xrandr --output HDMI2 --auto --output LVDS1 --off
    xrandr --output HDMI3 --auto --primary --left-of HDMI2
    setbg
}

function undock {
    xrandr --output HDMI2 --off
    xrandr --output LVDS1 --auto --primary --output HDMI3 --off
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
    keyboard.sh
    udevadm trigger /sys/devices/platform/i8042/serio1/serio2
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
        if [[ $2 == IBM0068:00 && $4 == 00004010 ]]
        then
            dock
        fi
        ;;
    dock)
        dock
        ;;
    undock)
        undock
        standby
        ;;
esac
