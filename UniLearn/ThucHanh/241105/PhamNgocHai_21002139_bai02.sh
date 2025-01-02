#!/bin/bash

# Viết 1 shell cho phép nhận đối dòng lệnh là một số nguyên (n>0),
# sau đó tính giá trị của S = n!

calculate_and_print() {
    # Check input
    if [[ $# -ne 1 ]]; then
        echo "Usage: $0 <num1>"
        exit 1
    elif [[ $1 -lt 1 ]]; then
        echo "Input must be a positive integer"
        exit 2
    fi

    # Calculate and print
    local n=$1
    local result=1
    for i in $(seq 2 $n); do
        result=$((result * i))
    done
    echo "$n! = $result"
    # echo $result    # Return result value (not recommended)
}

calculate_and_print $1
