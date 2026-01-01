#!/bin/bash
#

color_count=20
img_size_perc=25

declare -a colors
i=0
for color in $(convert -resize $img_size_perc% -colors $color_count -unique-colors $1 txt:- | tail -n +2 | awk '{ print $3 }')
do
    echo $i $color
    colors[$i]=${color:1:6}
    ((i++))
done

