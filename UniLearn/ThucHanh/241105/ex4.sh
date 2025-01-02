#!/bin/bash

# Viết chương trình shell tìm đảo ngược của một số

inverse_number() {
    local num=$1
    local inverse_num=0

    while [ $num -gt 0 ]; do
        local digit=$((num % 10))
        inverse_num=$((inverse_num * 10 + digit))
        num=$((num / 10))
    done

    echo "$inverse_num is inverse number of $1"
}

read -p "Enter a number: " num
inverse_number $num
