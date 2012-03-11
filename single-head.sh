#!/bin/bash

#xrandr --newmode "1280x800_60.00" 83.50 1280 1352 1480 1680 800 803 809 8 31 -hsync +vsync
#xrandr --addmode LVDS1 1280x800_60.00
xrandr --output LVDS1 --mode 1280x800 --pos 0x0 --output VGA1 --off
exec "~/scripts/wallpaper.sh"

exit 0

