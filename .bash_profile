#
# ~/.bash_profile
#

# screen resolution custom by me
xrandr --newmode "1920x1200_90.00"  300.50  1920 2072 2280 2640  1200 1203 1209 1266 -hsync +vsync
xrandr --addmode eDP1 "1920x1200_90.00"
xrandr --output eDP1 --mode "1920x1200_90.00"

[[ -f ~/.bashrc ]] && . ~/.bashrc
