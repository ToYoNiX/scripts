#!/bin/bash
#

swaybg -i  $(cat ~/.cache/colorscheme/img_path) -m fill &
flatpak run com.discordapp.Discord --start-minimized &
syncthing serve --no-browser --no-restart &
syncthingtray & 
swhks &
swhkd
