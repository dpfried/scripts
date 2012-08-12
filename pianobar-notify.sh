#!/bin/bash
# create variables
while read L; do
k="`echo "$L" | cut -d '=' -f 1`"
v="`echo "$L" | cut -d '=' -f 2`"
export "$k=$v"
done < <(grep -e '^\(title\|artist\|album\|stationName\|pRet\|pRetStr\|wRet\|wRetStr\|songDuration\|songPlayed\|rating\|coverArt\)=' /dev/stdin) # don't overwrite $1...

case "$1" in
songstart)
# echo 'naughty.notify({title = "pianobar", text = "Now playing: ' "$title" ' by ' "$artist" '"})' | awesome-client -
# echo "$title -- $artist" > $HOME/.config/pianobar/nowplaying
# # or whatever you like...
notify-send "Pianobar - $stationName" "Now Playing: $artist - $title"
;;

songfinish)
# scrobble if 50% of song have been played, but only if the song hasn't
# been banned
if [ -n "$songDuration" ] &&
[ $(echo "scale=4; ($songPlayed/$songDuration*100)>50" | bc) -eq 1 ] &&
[ "$rating" -ne 2 ]; then
# scrobbler-helper is part of the Audio::Scrobble package at cpan
# "pia" is the last.fm client identifier of "pianobar", don't use
# it for anything else, please
python /home/dfried/scripts/scrobble.py "songfinish" "title=$title" "artist=$artist" "album=$album" "songDuration=$songDuration" "songPlayed=$songPlayed" &
fi
;;

*)
if [ "$pRet" -ne 1 ]; then
notify-send "Pianobar - ERROR" "$1 failed: $pRetStr"
elif [ "$wRet" -ne 1 ]; then
notify-send "Pianobar - ERROR" "$1 failed: $wRetStr"
fi
;;
esac
