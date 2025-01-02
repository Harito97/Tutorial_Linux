#!/bin/bash

# Viết 1 shell cho phép nhận đối dòng lệnh là một số nguyên (n>0), sau đó tính giá trị sau
# S = 1 + 2 + 3 +....+ n

# Method 1
cal_sum() {
    # Check input
    if [ $# -ne 1 ]; then
        echo "Usage: $0 <n>"
        exit 1
    elif [ $1 -lt 1 ]; then
        echo "n must be greater than 0"
        exit 2
    fi

    # Calculate sum
    local n=$1
    local sum=0
    for i in $(seq 1 $n); do
    # for ((i=0;i<=$n;i++)); do
        sum=$((sum+i))
    done
    echo $sum       # return the value of sum
    # return ...    # only return the status of the function (0 to 255)
}

print_result() {
    local n=$1
    local sum=$(cal_sum $n)
    # for i in $(seq 1 $n); do
    for ((i=1;i<=$n;i++)); do
        echo -n "$i"
        if [ $i -lt $1 ]; then
            echo -n " + "
        else
            echo " = $sum"
        fi
    done
}

# cal_sum $1
# echo "Status: $?"
echo "Method 1"
print_result $@
echo "Status: $?"

# Method 2
cal_and_print() {
    # Check input
    if [ $# -ne 1 ]; then
        echo "Usage: $0 <n>"
        exit 1
    elif [ $1 -lt 1 ]; then
        echo "n must be greater than 0"
        exit 2
    fi

    local n=$1
    local sum=0
    for ((i=1;i<=$n;i++)); do
        sum=$((sum+i))
        echo -n "$i"
        if [ $i -lt $n ]; then
            echo -n " + "
        else
            echo " = $sum"
        fi
    done
}

echo -e "\nMethod 2"
cal_and_print $@
echo "Status: $?"
