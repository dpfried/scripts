#!/bin/bash

now_playing=`tail -n 1 /home/dfried/.config/pianobar/nowplaying`
if [[ $? ]]
then
    echo $now_playing
else
    echo "----"
fi
