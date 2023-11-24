#
# ~/.bash_profile
#

# screen resolution custom by me
tv=$(xrandr | grep -w connected | cut -d " " -f1)
xrandr --newmode "1920x1200-90.00"  300.50  1920 2072 2280 2640  1200 1203 1209 1266 -hsync +vsync
xrandr --addmode "${tv}" "1920x1200-90.00"
xrandr --output "${tv}" --mode "1920x1200-90.00"

[[ -f ~/.bashrc ]] && . ~/.bashrc
