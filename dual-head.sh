#!/bin/bash

#xrandr --newmode "1280x800_60.00" 83.50 1280 1352 1480 1680 800 803 809 8 31 -hsync +vsync
#xrandr --addmode LVDS1 1280x800_60.00
#xrandr --newmode "1280x1024_60.00" 109.00 1280 1368 1469 1712 1024 1027 1034 1063 -hsync +vsync
#xrandr --addmode VGA1 1280x1024_60.00
xrandr --output LVDS1 --mode 1280x800 --pos 1280x0 --output VGA1 --mode 1280x1024 --pos 0x0 
exec "~/scripts/wallpaper.sh"

exit 0

