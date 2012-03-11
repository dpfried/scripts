#!/bin/bash

Xephyr -ac -screen "1280x800" -br -reset -title "dfried@lectura" -terminate 2> /dev/null :2 &
DISPLAY=:2
ssh -XfC -c blowfish lectura gnome-session &
exit

