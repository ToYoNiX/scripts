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

cat << EOF > $output_path/foot
[colors]
background=${colors[0]}
foreground=${colors[15]}
regular0=${colors[8]}
regular1=${colors[9]}
regular2=${colors[10]}
regular3=${colors[11]}
regular4=${colors[12]}
regular5=${colors[13]}
regular6=${colors[14]}
regular7=${colors[15]}
bright0=${colors[1]}
bright1=${colors[2]}
bright2=${colors[3]}
bright3=${colors[4]}
bright4=${colors[5]}
bright5=${colors[6]}
bright6=${colors[7]}
bright7=${colors[8]}
EOF
