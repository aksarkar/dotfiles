#!/bin/sh

# Local resources
xrdb -merge .Xresources

# Emacs daemon
emacs --daemon

# URxvt daemon
urxvtd &

# D-bus
if which dbus-launch >/dev/null && test -z "$DBUS_SESSION_BUS_ADDRESS"; then
    eval "$(dbus-launch --sh-syntax --exit-with-session)"
fi

# Trackpoint scrolling
xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 8 1
xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 8 2
xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 8 6 7 4 5

# Keyboard stuff
kb1=$(xinput list | grep "AT" | sed -re "s/.*id=([0-9]+).*/\1/")
kb2=$(xinput list | grep "Topre" | sed -re "s/.*id=([0-9]+).*/\1/")
setxkbmap -device $kb1 -option ctrl:swapcaps
setxkbmap -device $kb1 -option compose:ralt
# if [[ ! -z $kb2]]
#     setxkbmap -device $kb2 -option compose:ralt
# fi

# Disable TouchPad
xinput set-int-prop "SynPS/2 Synaptics TouchPad" "Device Enabled" 8 0

# Set the cursor
xsetroot -cursor_name left_ptr

# Restore background
eval `cat $HOME/.fehbg` &

# Screen locker
xautolock -locker "i3lock -c 000000 -u" &

exec xmonad
