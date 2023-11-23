#!/bin/bash

echo "installing required packages..."
pacman --noconfirm -S neovim tmux lolcat cowsay ttf-liberation-mono-nerd dunst feh xorg-xrandr network-manager-applet blueman

echo "adding files: .bashrc, .profile, .dmenurc"
rm ~/.bashrc ~/.profile ~/.fehbg ~/.dmenurc ~/.tmux.conf
ln -s ~/dotfiles/.bashrc ~/
ln -s ~/dotfiles/.profile ~/
ln -s ~/dotfiles/.fehbg ~/
ln -s ~/dotfiles/.dmenurc ~/
ln -s ~/dotfiles/.tmux.conf ~/

echo "checking for required directories..."
if [ ! -d "~/Pictures" ]; then
    mkdir ~/Pictures
    echo "created ~/Pictures directory"
fi
if [ -d "~/Pictures/wallpapers" ]; then
    rm -rf ~/Pictures/wallpapers
fi
if [ ! -d "~/.config" ]; then
    mkdir ~/.config
    echo "created ~/.config directory"
fi

rm -rf .config/nvim .config/i3 .config/i3status .config/dunst

echo "creating symlinks... "
ln -s ~/dotfiles/wallpapers ~/Pictures/
echo "- ~/dotfiles/wallpapers ~/Pictures/"
ln -s ~/dotfiles/i3 ~/.config/
echo "- ~/dotfiles/i3 ~/.config/"
ln -s ~/dotfiles/i3status ~/.config/
echo "- ~/dotfiles/i3status ~/.config/"
ln -s ~/dotfiles/nvim ~/.config/
echo "- ~/dotfiles/nvim ~/.config/"
ln -s ~/dotfiles/dunst ~/.config/
echo "- ~/dotfiles/dunst ~/.config/"

echo "installing yay"
pacman -S --noconfirm --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
cd ..
echo "installing required aur packages.. "
yay -S --noconfirm mercury-browser

echo ""
echo "hello world!" | lolcat
echo ""
