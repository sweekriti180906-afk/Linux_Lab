  #!/bin/bash
   if [ $# -ne 1 ]; then
        echo "usage: $0 <non-negative-integers>"
        exit 1
      fi
      n="$1"
      IF ! [[ $N =~ 
