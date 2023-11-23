#!/bin/bash

read -p "enter username: " username
read -p "enter password: " password

echo "installing required packages..."
echo $password | sudo -S pacman --noconfirm -S neovim tmux lolcat cowsay ttf-liberation-mono-nerd dunst feh xorg-xrandr network-manager-applet blueman

echo "adding files: .bashrc, .profile, .dmenurc"
echo $password | sudo -S rm /home/$username/.bashrc /home/$username/.profile /home/$username/.fehbg /home/$username/.dmenurc /home/$username/.tmux.conf
ln -s /home/$username/dotfiles/.bashrc /home/$username/
ln -s /home/$username/dotfiles/.profile /home/$username/
ln -s /home/$username/dotfiles/.fehbg /home/$username/
ln -s /home/$username/dotfiles/.dmenurc /home/$username/
ln -s /home/$username/dotfiles/.tmux.conf /home/$username/

echo "checking for required directories..."
if [ ! -d "/home/$username/Pictures" ]; then
    mkdir /home/$username/Pictures
    echo "created /home/$username/Pictures directory"
fi
if [ -d "/home/$username/Pictures/wallpapers" ]; then
    rm -rf /home/$username/Pictures/wallpapers
fi
if [ ! -d "/home/$username/.config" ]; then
    mkdir /home/$username/.config
    echo "created /home/$username/.config directory"
fi

rm -rf /home/$username/.config/nvim /home/$username/.config/i3 /home/$username/.config/i3status /home/$username/.config/dunst

echo "creating symlinks... "
ln -s /home/$username/dotfiles/wallpapers /home/$username/Pictures/
echo "- /home/$username/dotfiles/wallpapers /home/$username/Pictures/"
ln -s /home/$username/dotfiles/i3 /home/$username/.config/
echo "- /home/$username/dotfiles/i3 /home/$username/.config/"
ln -s /home/$username/dotfiles/i3status /home/$username/.config/
echo "- /home/$username/dotfiles/i3status /home/$username/.config/"
ln -s /home/$username/dotfiles/nvim /home/$username/.config/
echo "- /home/$username/dotfiles/nvim /home/$username/.config/"
ln -s /home/$username/dotfiles/dunst /home/$username/.config/
echo "- /home/$username/dotfiles/dunst /home/$username/.config/"

echo "installing yay"
cd /home/$username
echo $password | sudo -S pacman -S --noconfirm --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
cd ..
echo "installing required aur packages.. "
yay -S --noconfirm mercury-browser

echo ""
echo "hello world!" | lolcat
echo ""
