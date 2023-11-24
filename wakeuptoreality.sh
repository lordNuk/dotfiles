#!/bin/bash

read -p "enter username: " username
read -p "enter password: " -s password

echo "settting up git: "
echo $password | sudo -S pacman --noconfirm -S ansible
read -p "enter vault password: " -s vpassword
ansible-vault decrypt id_ed25519 --vault-password-file <(echo ${vpassword}) && eval "$(ssh-agen -s)" && ssh-add id_ed25519

echo "installing required packages..."
echo $password | sudo -S pacman --noconfirm -S go thunar neovim tmux lolcat cowsay ttf-liberation-mono-nerd dunst feh xorg-xrandr network-manager-applet blueman alacritty ugrep bat exa expac

echo "adding files: .bashrc, .bash_profile"
echo $password | sudo -S rm /home/$username/.bashrc /home/$username/.bash_profile /home/$username/.fehbg /home/$username/.dmenurc /home/$username/.tmux.conf
ln -s /home/$username/dotfiles/.bashrc /home/$username/
ln -s /home/$username/dotfiles/.bash_profile /home/$username/
ln -s /home/$username/dotfiles/.fehbg /home/$username/
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
echo $password | sudo -S pacman -S --noconfirm --needed base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
cd ..
echo "installing required aur packages.. "
yay -S --noconfirm mercury-browser

echo ""
echo "hello world!" | lolcat
echo "what happened? Nothing seems to have changed?" | lolcat
echo "oh! noooo.. there must be some bugs or errors in my script." | lolcat
echo "..." | lolcat
echo "....." | lolcat
echo "......." | lolcat
echo "nah nothing's wrong with the script... just reboot or logout and login!" | lolcat
cowsay "bye bye" | lolcat
echo ""
