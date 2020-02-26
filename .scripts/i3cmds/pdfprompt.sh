#!/bin/sh
#Ask for PDF Name
chosen="$(ls ~/sem6/ | dmenu -i -p "Open which pdf?")"
if [ "$chosen"  ]; then
  zathura ~/sem6/"$chosen"
fi
