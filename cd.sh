
#!/bin/bash
colors=("red" "blue" "green" "a" "b" "c""d" "e" "f" "g" "h" "hh""HHH" "GNGN" "fbg")     # double inverted commas ke beech me space nh do ek sath print hote haiek word i tarah

for colors in "${colors[@]}"
do
 echo " color: $colors"
done
  echo " array length ${#colors[@]}"
