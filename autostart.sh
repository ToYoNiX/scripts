#!/bin/bash
#

swaybg -i  $(cat ~/.cache/wal/wal) &
flatpak run com.discordapp.Discord --start-minimized &
nextcloud &
swhks &
swhkd
