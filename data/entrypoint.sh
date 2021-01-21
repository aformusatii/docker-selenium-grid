#!/bin/bash

export DISPLAY=:20

Xvfb :20 &

x11vnc -passwd password -display :20 -N -forever &

java -jar /root/selenium-server-standalone.jar
