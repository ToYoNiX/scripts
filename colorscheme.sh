#!/bin/bash
#

color_count=16
img_size_perc=25

declare -a colors
i=0
for color in $(convert -resize $img_size_perc% -colors $color_count -unique-colors $1 txt:- | tail -n +2 | awk '{ print $3 }')
do
    echo $i $color
    colors[$i]=${color:1:6}
    ((i++))
done

mkdir -p ~/.cache/colorscheme/

cat << EOF > ~/.cache/colorscheme/dwl
0x${colors[15]}ff 0x${colors[0]}ff 0x${colors[8]}ff
0x${colors[15]}ff 0x${colors[2]}ff 0x${colors[15]}ff
0x${colors[15]}ff 0x${colors[1]}ff 0x${colors[1]}ff
EOF
