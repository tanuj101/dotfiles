#!/bin/sh
#Ask for PDF Name
chosen="$(ls ~/sem5/ | dmenu -i -p "Open which pdf?")"
if [ "$chosen"  ]; then
  zathura ~/sem5/"$chosen"
fi
