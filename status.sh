#!/bin/bash
#

BAT="/sys/class/power_supply/BAT0"

while true
do
    output=""
    output=$output\ $(date)

    if [ -d $BAT ]
    then
        PERCENTAGE=BAT:\ $(cat $BAT/capacity)%
        output=$PERCENTAGE\ \|\ $output
    fi

    echo $output
    sleep 5
done
