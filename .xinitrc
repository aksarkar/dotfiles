#!/bin/sh

# Local resources
xrdb -merge .Xresources

# Emacs daemon
emacs --daemon &

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

# Compose key
setxkbmap -option compose:ralt

# Disable TouchPad
xinput set-int-prop "SynPS/2 Synaptics TouchPad" "Device Enabled" 8 0

# Set the cursor
xsetroot -cursor_name left_ptr

# Openoffice quickstarter
soffice --quickstart --nodefault --nologo &

# Restore background
eval `cat $HOME/.fehbg` &

exec xmonad