#!/bin/bash

rm -rf /tmp/.X20-lock

export DISPLAY=:20

Xvfb :20 -screen 0 1366x768x16 &

x11vnc -passwd password -display :20 -N -forever &

websockify -D --web=/usr/share/novnc/ 0.0.0.0:6080 localhost:5920

java -jar /root/selenium-server-standalone.jar
