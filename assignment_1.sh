#!/bin/bash

# input 2 array A AND B .in A check for palindrome if present find location and multiply it With the prime no, in B.IF NEITHER OF THEM IS PRESENT   output is 0

is_palindrome() {
    local num=$1
    local rev=$(echo "$num" | rev)
    [[ "$num" == "$rev" ]] && echo 1 || echo 0
}

is_prime() {
    local num=$1
    if (( num < 2 )); then
        echo 0
        return
    fi
    for ((i=2; i*i<=num; i++)); do
        if (( num % i == 0 )); then
            echo 0
            return
        fi
    done
    echo 1
}


sum_of_digits() {
    local num=$1
    local sum=0
    while (( num > 0 )); do
        (( sum += num % 10 ))
        (( num /= 10 ))
    done
    echo $sum
}

read -p "Enter size of array A: " n
echo "Enter elements of array A:"
read -a A

read -p "Enter size of array B: " m
echo "Enter elements of array B:"
read -a B

prime_found=0
declare -a primes
for num in "${B[@]}"; do
    if [[ $(is_prime "$num") -eq 1 ]]; then
        primes+=("$num")
        prime_found=1
    fi
done

if [[ $prime_found -eq 0 ]]; then
    echo "0"
    exit 0
fi


pal_found=0
for i in "${!A[@]}"; do
    num=${A[$i]}
    if [[ $(is_palindrome "$num") -eq 1 ]]; then
        pal_found=1
        sum_digits=$(sum_of_digits "$num")
        echo "Palindrome $num found at location $i"
        echo "Sum of its digits = $sum_digits"
        for p in "${primes[@]}"; do
            echo "Sum * Prime $p = $(( sum_digits * p ))"
        done
    fi
done

if [[ $pal_found -eq 0 ]]; then
    echo "0"
fi
