#!/bin/bash

# Viết 1 shell trong đó có hàm sum() trả về tổng các đối số truyền vào của nó.
# In tổng vừa tính được ra màn hình?

sum() {
    local sum=0
    for i in $@; do
        if [[ ! $i =~ ^[0-9]+$ ]]; then
            echo "Invalid input"
            return 1
        fi
        sum=$((sum + i))
    done
    echo "Sum is: $sum"
}

sum 1 2 3 4 5 6 7 8 9 10
