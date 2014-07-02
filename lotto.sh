#!/bin/bash

# needs to be refactored to prevent duplicate per row (version from home box)

tickets="$1"

function get_tickets { printf "How many tickets are you going to get? "; read tickets;}

function gen_numbers { printf "\nThese are your winning lottery numbers: \n"; 

    for ((z=1 ; z<=tickets ; z++)); do
         for ((i=0; i<6; i++ )); do 
            x=`echo $[ 1 + $[ RANDOM % 49 ]]`; 
            printf "\t $x"; 
         done;
         printf "\n" 
    done; 
    printf "\n"; }


############################
if [[ -z $tickets ]]  ; then
    get_tickets
    gen_numbers
else
    gen_numbers
fi
