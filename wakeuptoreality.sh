#!/bin/bash

echo "installing required packages..."
pacman --noconfirm -S neovim tmux lolcat cowsay ttf-liberation-mono-nerd dunst feh xorg-xrandr network-manager-applet blueman

echo "adding files: .bashrc, .profile, .dmenurc"
rm /home/$USER/.bashrc /home/$USER/.profile /home/$USER/.fehbg /home/$USER/.dmenurc /home/$USER/.tmux.conf
ln -s /home/$USER/dotfiles/.bashrc /home/$USER/
ln -s /home/$USER/dotfiles/.profile /home/$USER/
ln -s /home/$USER/dotfiles/.fehbg /home/$USER/
ln -s /home/$USER/dotfiles/.dmenurc /home/$USER/
ln -s /home/$USER/dotfiles/.tmux.conf /home/$USER/

echo "checking for required directories..."
if [ ! -d "/home/$USER/Pictures" ]; then
    mkdir /home/$USER/Pictures
    echo "created /home/$USER/Pictures directory"
fi
if [ -d "/home/$USER/Pictures/wallpapers" ]; then
    rm -rf /home/$USER/Pictures/wallpapers
fi
if [ ! -d "/home/$USER/.config" ]; then
    mkdir /home/$USER/.config
    echo "created /home/$USER/.config directory"
fi

rm -rf .config/nvim .config/i3 .config/i3status .config/dunst

echo "creating symlinks... "
ln -s /home/$USER/dotfiles/wallpapers /home/$USER/Pictures/
echo "- /home/$USER/dotfiles/wallpapers /home/$USER/Pictures/"
ln -s /home/$USER/dotfiles/i3 /home/$USER/.config/
echo "- /home/$USER/dotfiles/i3 /home/$USER/.config/"
ln -s /home/$USER/dotfiles/i3status /home/$USER/.config/
echo "- /home/$USER/dotfiles/i3status /home/$USER/.config/"
ln -s /home/$USER/dotfiles/nvim /home/$USER/.config/
echo "- /home/$USER/dotfiles/nvim /home/$USER/.config/"
ln -s /home/$USER/dotfiles/dunst /home/$USER/.config/
echo "- /home/$USER/dotfiles/dunst /home/$USER/.config/"

# echo "installing yay"
# pacman -S --noconfirm --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
# cd ..
echo "installing required aur packages.. "
yay -S --noconfirm mercury-browser

echo ""
echo "hello world!" | lolcat
echo ""
