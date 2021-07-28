#!/bin/bash

sudo docker run -it --rm --net=host --runtime nvidia  -e DISPLAY=$DISPLAY -w /opt/nvidia/deepstream/deepstream-5.1 -v /tmp/.X11-unix/:/tmp/.X11-unix --device /dev/video0 $1
