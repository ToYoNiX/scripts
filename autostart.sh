#!/bin/bash
#

swaybg -i  $(cat ~/.cache/wal/wal) &
flatpak run com.discordapp.Discord --start-minimized &
syncthing serve --no-browser --no-restart &
syncthingtray & 
nextcloud &
swhks &
swhkd
