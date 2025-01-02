#!/bin/bash

# Viết 1 shell tìm dòng có độ dài lớn nhất trong một tập tin
# Input: file
# Output: dòng có độ dài lớn nhất

find_longest_line() {
    # Check input
    if (( $# < 1 )); then
    # if [[ $# -lt 1 ]]; then
        echo "Usage: $0 FILE" >&2
        # echo to stderr
        exit 1
    elif [[ ! -f $1 ]]; then
        echo "$1 is not a file" >&2
        exit 2
    fi

    local file=$1
    local longest_line=""
    local max_length=0

    while read -r line; do
        current_length=${#line}
        # length of the current line
        if (( current_length > max_length )); then
            max_length=$current_length
            longest_line=$line
        fi
    done < "$file"

    echo "$longest_line"

    # num_string=$(wc -L "$file")
    # echo "Number of characters in the longest line: $num_string"
}

# find_longest_line $@
find_longest_line data_bai4.txt
