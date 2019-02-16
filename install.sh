#!/bin/sh
sudo apt update
sudo apt install i3lock xss-lock xautolock scrot alacritty amixer light feh
cp i3/config ~/.config/i3
sudo cp i3/i3status.conf /etc/.
cp alacritty/alacritty.yml ~/.config/alacritty/
sudo cp i3/lock_and_blur.sh /usr/local/bin/lock_and_blur.sh

