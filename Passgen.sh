#!/bin/bash

echo "Password Generator."
echo -n "Length of password (min 8): "

symbols=({a..z} {A..Z} {0..10} "!" "@" "#" "$" "%" "^" "*" "&")

while :; do
    read length
    if ! [[ "$length" =~ ^[0-9]+$ ]]; then
        echo -n "It's not a valid number, type again: "
    elif [[ $length -lt 8 ]]; then
        echo -n "Password must be minimum of length 8, type again: "
    else
        break
    fi
done

echo -n "Generated password: "

for i in $(seq 1 $length); do
    echo -n ${symbols[ $RANDOM % ${#symbols[@]} ]}
done

echo
