#!/bin/bash

print_menu() {
    echo '------------------'
    echo 'Nhập vào lựa chọn:'
    echo '------------------'
    echo '1) Hiển thị thông tin của tất cả các thư mục hoặc tệp tin bắt đầu bởi chữ cái "a" trong thư mục /etc'
    echo '2) Hiển thị ngày và giờ của hệ thống'
    echo '3) Đếm số lượng tệp tin hoặc thư mục trong thư mục /etc'
    echo '4) Nhập vào một số n, tạo ra n tệp tin có tên file_1.txt, file_2.txt, …, file_n.txt với nội dung lần lượt là:'
    echo '   "Xin chào sinh viên 1", "Xin chào sinh viên 2", …., "Xin chào sinh viên n"'
    echo '5) Nhập vào một số nguyên x. Tính tổng số các chữ số của x'
    echo '   Ví dụ nhập vào số nguyên x=123 => Tổng số các số của x là 1+2+3=6'
    echo '6) Nhập vào một số nguyên x. Kiểm tra xem x có phải số nguyên tố không?'
    echo '   Ví dụ nhập vào số nguyên x=9 => In ra "9 không phải số nguyên tố"'
    echo '0) Thoát khỏi menu'
    echo '------------------'
}

func1() {
    ls -a /etc | grep -E "^a"
}

func2() {
    date
}

func3() {
    ls -a /etc | wc -l
}

func4() {
    echo "Nhập vào số n:"
    read n
    for i in $(seq 1 $n); do
        echo "Xin chào sinh viên $i" > "file_$i.txt"
    done
}

func5() {
    echo "Nhập vào x:"
    read x
    sum=0
    original_x=$x  # Lưu giá trị gốc của x
    if (( x < 0 )); then
        x=$((x * -1))
    fi
    while [[ $x -ne 0 ]]; do
        sum=$((sum + x % 10))
        x=$((x / 10))
    done
    echo "Tổng các chữ số của $original_x là: $sum"
}

func6() {
    echo "Nhập vào x:"
    read x
    if (( x < 2 )); then
        echo "$x không phải số nguyên tố"
        return
    fi
    for (( i = 2; i * i <= x; i++ )); do
        if (( x % i == 0 )); then
            echo "$x không phải số nguyên tố"
            return
        fi
    done
    echo "$x là số nguyên tố"
}

func0() {
    echo "Cảm ơn bạn đã dùng!"
    exit 0
}

menu() {
    while true; do
        print_menu
        read choice
        case $choice in
            1) func1 ;;
            2) func2 ;;
            3) func3 ;;
            4) func4 ;;
            5) func5 ;;
            6) func6 ;;
            0) func0 ;;
            *) echo 'Lựa chọn không hợp lệ. Vui lòng thử lại!' ;;
        esac
    done
}

menu
