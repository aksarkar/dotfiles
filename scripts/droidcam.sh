#!/bin/bash
sudo modprobe v4l2loopback video_nr=9 card_label=DroidCam
adb forward tcp:4747 tcp:4747
ffmpeg -i http://localhost:4747/mjpegfeed?{$1:-1920x1080} -c:v rawvideo -vf format=yuv420p,vflip -f v4l2 /dev/video9
