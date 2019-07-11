#!/bin/sh

#dmenu prompt to open pdfs from sem4 folder
chosen="$(ls ~/sem4/ | dmenu -i -p "Open which pdf?")"
echo $chosen
if [ "$chosen"  ]; then
  echo $chosen
  (zathura ~/sem4/$chosen)
fi
