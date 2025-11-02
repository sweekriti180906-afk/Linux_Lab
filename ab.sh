#!/bin/bash

fruits=("cherry" "apple" "peach")
 
  echo "first fruit ${fruits[0]}"
 echo "second  fruit ${fruits[1]}"
fruits+=("mango")  # adds new elementxy
  echo "all fruits ${fruits[@]}"

