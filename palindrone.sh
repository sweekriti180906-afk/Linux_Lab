  #!/bin/bash
   if [ $# -ne 1 ]; then
        echo "usage: $0 <non-negative-integers>"
        exit 1
      fi
      n="$1"
     if ! [[ $n =~ ^[0-9]+$ ]]; then
       echo"MUST BE A NON NEGATIVE INTEGER."
       exit 1
     fi   
     
     orig="$n"
     rev=0
     while [ "$n" -gt 0 ]; do
       rev=$(( rev * 10 + (n % 10) ))
       n=$(( n / 10 ))
     done
     
     [ "$orig" -eq "rev" ] && echo "$orig is a palindrome" || echo "$orig is NOT a palindrome." 
