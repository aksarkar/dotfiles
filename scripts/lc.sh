#!/bin/bash
set -e
if [[ ! -z $1 ]]
then
    xautolock -enable
    xset +dpms s on
else
    xautolock -disable
    xset -dpms s off
fi
