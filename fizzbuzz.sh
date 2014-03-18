#!/bin/bash
# takes an argument (integer) and runs fizzbuzz test on all numbers up to that number

target="$1"

for ((count="1"; count<="$target"; count++)); do

       if [[ $(( $count % 3 )) == 0 ]] && [[ $(( $count % 5 )) == 0 ]]; then echo "$count: Fizzbuzz"
       elif [[ $(( $count % 3 )) == 0 ]]; then echo "$count: Fizz"
       elif [[ $(( $count % 5 )) == 0 ]]; then echo "$count: buzz"
       fi

done
