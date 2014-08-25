#!/bin/bash
set -e
set -u

auth=$(pgrep -a X | awk '{sub(/.*-auth/, "", $0); print $1}')
export XAUTHORITY=${auth?"failed to get XAuthority"}
export DISPLAY=:0

xmodmap -pk | grep -q "Alt_R" && xmodmap - <<EOF
keysym Alt_R = Multi_key
keysym Menu = Hyper_R
keysym Super_R = Hyper_R
EOF

xmodmap - <<EOF
clear Mod1
clear Mod3
clear Mod4

add Mod1 = Alt_L
add Mod3 = Hyper_L Hyper_R
add Mod4 = Super_L
EOF
