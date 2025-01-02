#!/bin/bash

# Viết chương tình shell hiện ra màn hình tam giác pascal với 6 dòng

pascal_triangle() {
    local n=$1
    local i j k
    for ((i = 0; i < n; i++)); do
        for ((j = 0; j < n - i; j++)); do
            echo -n " "
        done
        for ((k = 0; k <= i; k++)); do
            echo -n $((i - k + 1))
        done
        echo
    done
}

pascal_triangle 6
