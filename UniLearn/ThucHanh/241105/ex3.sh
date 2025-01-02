#!/bin/bash

# Viết chương trình shell đếm số dòng của một tệp tin

# count_line() {
#     local file=$1
#     local count=0
#     while read -r line; do
#         ((count++))
#     done < "$file"
#     echo "$count"
# }

count_line() {
    local file="$1"
    if [[ -f "$file" ]]; then
        local line_count=$(wc -l < "$file")
        echo "Number of lines in $file: $line_count"
    else
        echo "$file is not a valid file." >&2
    fi
}

# count_line "$1"
count_line "data_bai4.txt"
