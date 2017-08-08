#!/bin/bash

iwconfig wlan0 2>&1 | grep -q no\ wireless\ extensions\. && {
  echo wired
  exit 0
}

essid=`iwconfig wlan0 | awk -F '"' '/ESSID/ {print $2}'`
stngth=`iwconfig wlan0 | awk -F '=' '/Quality/ {print $2}' | cut -d '/' -f 1`
# status=`nmcli nm | tail -n 1 | awk '{ printf $2; }'`
status=`nmcli g | tail -n 1 | awk '{ printf $1; }'`
bars=`expr $stngth / 10`

#case $bars in
#  0)  bar='[----------]' ;;
#  1)  bar='[/---------]' ;;
#  2)  bar='[//--------]' ;;
#  3)  bar='[///-------]' ;;
#  4)  bar='[////------]' ;;
#  5)  bar='[/////-----]' ;;
#  6)  bar='[//////----]' ;;
#  7)  bar='[///////---]' ;;
#  8)  bar='[////////--]' ;;
#  9)  bar='[/////////-]' ;;
#  10) bar='[//////////]' ;;
#  *)  bar='[----!!----]' ;;
case $bars in 
   0)  bar='[-----]';;
   1)  bar='[.----]';;
   2)  bar='[:----]';;
   3)  bar='[:.---]';;
   4)  bar='[::---]';;
   5)  bar='[::.--]';;
   6)  bar='[:::--]';;
   7)  bar='[:::.-]';;
   8)  bar='[::::-]';;
   9)  bar='[::::.]';;
   10) bar='[:::::]';;
   *)  bar='[--!--]';;
esac

`echo $status | grep "^connected" 1>/dev/null 2>&1`
if [[ "$?" -ne "0" ]]
then
    color='#FF0000'
fi

if [ -z $color ]
then
    echo $essid $bar
else
    echo "<fc=$color>$essid $bar</fc>"
fi

exit 0
