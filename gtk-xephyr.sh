#!/bin/bash

resolution=$(zenity --title="Gtk-Xephyr" --entry --text "Please enter a screen resolution." --entry-text "1280x800")

return_value=$?
case $return_value in

1)

echo -e '\E[31m'"Canceled"
exit ;;

0)

display=$(zenity --title="Gtk-Xephyr" --scale --text "Pick a Display Number\n[0 is default and used]" --min-value=1 --max-value=100 --value=2 --step 2)

return_value=$?
case $return_value in

1)

echo -e '\E[31m'"Canceled"
exit ;;

0)

Xephyr -ac -screen $resolution -br -reset -terminate 2> /dev/null :$display &

cmd=$(zenity --title="Gtk-Xephyr" --entry --text "Command to run on Xephyr:" --entry-text "ssh -XfC -c blowfish lectura gnome-session")

return_value=$?
case $return_value in

1)

echo -e '\E[31m'"Canceled"
exit ;;

0)

DISPLAY=:$display
$cmd &

exit ;;

esac
esac
esac

exit 0

