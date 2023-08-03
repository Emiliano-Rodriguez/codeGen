#!/bin/bash

rand_backspace=$(echo "1 + $RANDOM % 501 / 100" | bc)
filename="generate.code"

line_count=0
while read -r line; do
    for ((i=0; i<${#line}; i++)); do
        echo -n "${line:$i:1}"
        rand_backspace=$(echo "5 + $RANDOM % 501 / 100" | bc)
        if [[ $rand_backspace == "8" && $((line_count % 3)) == 0 ]]; then 
            echo -ne "\b \b"
            sleep 0.25
            echo -ne "\b \b"
            sleep 0.25
            echo -n "${line:$i-1:1}"
            sleep 0.1
            echo -n "${line:$i:1}"
            sleep 0.1
        else
            sleep $(echo "scale=3; 0.025 + $RANDOM % 800 / 1000" | bc)
        fi
    done
    line_count=$((line_count + 1))
    echo
done < "$filename"
