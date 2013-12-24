#!/bin/bash
#
# Public domain
# Author: roman [] tsisyk.com
#
# Usage: ./me url [youtube-dl parameters]
#

COOKIE_FILE=/tmp/yt-cookies.txt
mpv --cookies --cookies-file ${COOKIE_FILE} $(youtube-dl -g --cookies ${COOKIE_FILE} $*)
