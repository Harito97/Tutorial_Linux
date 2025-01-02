#!/bin/bash

print_menu(){
    echo 'Nhap vao lua chon'
    echo '1) Hiển thị thông tin của tất cả các thư mục hoặc tệp tin bắt đầu bởi chữ cái "a" trong thư mục /etc
2) Hiển thị ngày và giờ của hệ thống
3) Đếm số lượng tệp tin hoặc thư mục trong thư mục /etc
4) Nhập vào một số n, tạo ra n tệp tin có tên file_1.txt, file_2.txt, …, file_n.txt với nội dung lần lượt là: "Xin chào sinh viên 1", "Xin chào sinh viên 2", …., "Xin chào sinh viên n"
5) Nhập vào một số nguyên x. Tính tổng số các chữ số của x
Ví dụ nhập vào số nguyên x=123
Tổng số các số của x là 1+2+3=6
6) Nhập vào một số nguyên x. Kiểm tra xem x có phải số nguyên tố không?
Ví dụ nhập vào số nguyên x=9 => In ra "9 không phải số nguyên tố"
0) Thoát khỏi menu'
}

func1(){
    ls -a /etc | grep -E "^a"
}
func2(){
    date
}
func3(){
    ls -a /etc | wc -l
}
func4(){
    echo "Nhap vao so n:"
    read n
    for i in $(seq 1 $n); do
        echo "Xin chao sinh vien thu $i" > file_$i.txt
    done
}
func5(){
    echo "Nhap vao x:"
    read x
    sum=0
    while [[ $x != 0 ]]; do
        sum=$((sum + x % 10))
        x=$((x / 10))
    done
    if [[ $sum < 0 ]]; then
        sum=$((sum * -1))
    fi
    echo "Tong cac chu so cua $x la: $sum"
}
func6(){
    echo "Nhap vao x:"
    read x
    if (( $x < 2 )); then
        echo "$x khong phai so nguyen to"
        return
    fi
    for i in $(seq 2 $($x - 1)); do
        if (( $x % $i == 0 )); then
            echo "$x khong phai so nguyen to"
            return
        fi
    done
    echo "$x la so nguyen to"
}
func0(){
    echo "Cam on ban da dung!"
    exit 0
}

menu(){
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
            *) echo 'Invalid choice. Try again!' ;;
        esac
    done
}

menu
