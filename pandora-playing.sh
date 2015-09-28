#!/bin/bash

now_playing=`tail -n 1 /home/dfried/.config/pianobar/nowplaying`
playing=$?
not_running=$?
if (pidof pianobar > /dev/null) && [ $playing ]
then
    echo $now_playing
else
    echo "-"
fi
