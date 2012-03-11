#!/bin/bash

Xephyr -ac -screen "1024x768" -br -reset -title "dfried@lectura" -terminate 2> /dev/null :2 &
DISPLAY=:2
ssh -XfC -c blowfish lectura gnome-session &
exit

