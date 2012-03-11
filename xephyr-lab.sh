#!/bin/bash

Xephyr -ac -screen "1280x800" -br -reset -terminate 2> /dev/null :2 &
DISPLAY=:2
ssh -XC -c blowfish lab startkde &
exit

