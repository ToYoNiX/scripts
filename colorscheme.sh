#!/bin/bash
#

color_count=16
img_size_perc=25
output_path="/home/assem/.cache/colorscheme/"

declare -a colors
i=0
for color in $(convert -resize $img_size_perc% -colors $color_count -unique-colors $1 txt:- | tail -n +2 | awk '{ print $3 }')
do
    echo $i $color
    colors[$i]=${color:1:6}
    ((i++))
done

mkdir -p $output_path

echo $1 > $output_path/img_path

cat << EOF > $output_path/dwl
0x${colors[15]}ff 0x${colors[0]}ff 0x${colors[8]}ff
0x${colors[15]}ff 0x${colors[2]}ff 0x${colors[15]}ff
0x${colors[15]}ff 0x${colors[1]}ff 0x${colors[1]}ff
EOF

cat << EOF > $output_path/fuzzel
[colors]
background=${colors[0]}FF
prompt=${colors[15]}FF
text=${colors[15]}FF
placeholder=${colors[15]}FF
input=${colors[15]}FF
match=${colors[15]}FF
selection=${colors[1]}FF
selection-text=${colors[15]}FF
selection-match=${colors[8]}FF
border=${colors[1]}FF
EOF
