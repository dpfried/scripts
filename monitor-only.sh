#!/bin/bash

#xrandr --newmode "1280x1024_60.00" 109.00 1280 1368 1469 1712 1024 1027 1034 1063 -hsync +vsync
#xrandr --addmode VGA1 1280x1024_60.00
xrandr --output VGA1 --mode 1680x1050 --pos 0x0 --output LVDS1 --off
exec "~/scripts/wallpaper.sh"

exit 0

