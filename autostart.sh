#!/bin/bash
#

swaybg -i  $(cat ~/.cache/wal/wal) -m fill &
flatpak run com.discordapp.Discord --start-minimized &
syncthing serve --no-browser --no-restart &
syncthingtray & 
swhks &
swhkd
