#!/bin/bash

git clone --bare git@github.com:animafps/dotfiles.git $HOME/.dotfiles
function config {
   /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no
git clone https://github.com/jandamm/zgenom.git "${HOME}/.zgenom"
mkdir -p ~/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
sudo pacman -S alacritty starship polybar picom dunst rofi pipewire pipewire-pulse spotifyd pipewire-audio wireplumper ranger easyeffects mpv zsh dex feh 
mkdir ~/git
git clone https://aur.archlinux.org/paru.git ~/git/paru
cd ~/git/paru
makepkg -si
cd ~
paru -S xcwd-git xidlehook betterlockscreen
