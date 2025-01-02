#!/bin/bash

# Viết 1 shell cho phép nhận đối dòng lệnh là 1 số nguyên (>0), sau đấy in ra kết quả là số đó nhân với các số từ 1→10.
# Ví dụ: `$./multiply 7`
# Output:
# 7x1 = 7
# 7x2 = 14
# ...
# 7x10 = 70

multiply() {
    # Check input
    if [[ $# -lt 1 ]]; then
        echo "Usage: $0 <n>"
        return 1
    elif [[ $1 -lt 1 ]]; then
        echo "Error: <n> must be a positive integer"
        return 1
    fi

    local n=$1
    for i in {1..10}; do
    # for i in $(seq 1 10); do
        echo "$n * $i = $((n * i))"
    done
}

multiply "$@"
