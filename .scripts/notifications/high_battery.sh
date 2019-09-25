#!/bin/bash
if [ -r "$HOME/.dbus/Xdbus"  ]; then
    . "$HOME/.dbus/Xdbus"
fi
export DISPLAY=:0
acpi --battery | awk -F, '/Charging/ { if (int($2) > 83) print  }' | xargs -ri /usr/bin/notify-send -u critical "Battery above 80!"
