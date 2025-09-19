 #!/bin/bash
 if [ $# -ne 3 ]; then
 echo "usage: $0 <num1, num2, operator>"
 exit 1
 fi
 
 sum(){
     echo "result=$(($1 + $2))"
 }
 subtract(){
      echo "result=$(($1 - $2))"
 }
 multiply(){
       echo"result=(($1 * $2))"        
 }      
 divide(){
 if [ $2 -eq 0 ]; then
 echo"ynvalid"
 else
    echo"result=(($1 / $2))"
    fi
 }
    
