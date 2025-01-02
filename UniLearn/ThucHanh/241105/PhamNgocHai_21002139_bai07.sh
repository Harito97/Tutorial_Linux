#!/bin/bash

# Viết 1 shell trong đó chứa hàm count()
# có đối số truyền vào là tên của một thư mục,
# và trả về số lượng file trong thư mục đó?

count() {
    local dir=$1
    local count=0
    for file in $dir/*; do
        if [ -f $file ]; then
            count=$((count + 1))
        fi
    done
    echo "Number file in $dir is: $count"
}

count . # Đếm số file trong thư mục hiện tại
count /etc # Đếm số file trong thư mục /etc
