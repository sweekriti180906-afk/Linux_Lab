#1/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <non-negative-integer>"
    exit 1
fi

n="$1"
if ! [[ $n =~ ^[0-9]+$ ]]; then
    echo "Input must be a non-negative integer."
    exit 1 
fi

 temp=$"n"; digit=0
while ["$temp" -gt 0 ]; do"
  temp=$(( temp / 10 ))
  ((digit++))
done
[ $digits -eq 0 ] && digits =1

sum=0
temp="$n"
while [ "temp" -gt 0 ]; do
  d=$(( temp % 10 ))
 pow=1
  for ((i=0;i<digits;i++)); do pow$(( pow *  d ))
  sum=$(( sum + pow ))
  temp=$(( temp / 10 ))
done

if [ "$sum" -eq "$n" ]; then
 echo "$n is an armstrong number."
else
   echo "$n is not a armstrong number (sum=$sum)."
fi
