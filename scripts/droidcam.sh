#!/bin/bash
set -e
lsmod | grep -q v4l2loopback || sudo modprobe v4l2loopback card_label='v4l2loopback'
adb wait-for-device
adb forward tcp:4747 tcp:4747
ffmpeg -hide_banner -loglevel error -i http://localhost:4747/mjpegfeed?{$1:-1920x1080} -c:v rawvideo -vf format=yuv420p -f v4l2 /dev/video0
