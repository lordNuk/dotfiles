#!/bin/bash

# screen resolution custom by me
tv=$(xrandr | grep -w connected | cut -d " " -f1)
mode=$(xrandr | grep -w connected | cut -d " " -f4 | cut -d "+" -f1)
if [ $mode != 1920x1200 ]; then 
    xrandr --output "${tv}" --mode 1920x1200 && feh --no-fehbg --bg-fill ~/Pictures/wallpapers/myWall2.jpg
else
    xrandr --output "${tv}" --mode 3200x2000 && feh --no-fehbg --bg-fill ~/Pictures/wallpapers/myWall2.jpg
fi
