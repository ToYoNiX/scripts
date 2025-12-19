#!/bin/bash
#

BAT_LOCATION="/sys/class/power_supply/BAT0"

while true
do
    output=""
    output=$output\ $(date +"%a %b %e %Y %I:%M:%S %p")

    if [ -d $BAT_LOCATION ]
    then
        BAT=BAT:\ $(cat $BAT_LOCATION/capacity)%\ -\ $(cat $BAT_LOCATION/status)
        output=$BAT\ \|\ $output
    fi

    echo $output
    sleep 5
done
