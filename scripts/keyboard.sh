#!/bin/bash
set -e
set -u

auth=$(pgrep -a Xorg | awk '{sub(/.*-auth/, "", $0); print $1}')
export XAUTHORITY=${auth?"failed to get XAuthority"}
export DISPLAY=:0

xkbset exp =st -twokey =latchlock
xkbset st -twokey latchlock

xmodmap -pk | grep -q "Alt_R" && xmodmap - <<EOF
keysym Super_R = Hyper_R
keysym Menu = Multi_key
EOF

xmodmap - <<EOF
clear control
clear Mod1
clear Mod3
clear Mod4

add control = Control_L Alt_R
add Mod1 = Alt_L Control_R
add Mod3 = Hyper_L Hyper_R
add Mod4 = Super_L
EOF
