#!/bin/bash
#

while true
do
    echo BAT: $(cat /sys/class/power_supply/BAT0/capacity)% '|' $(date)
    sleep 5
done
