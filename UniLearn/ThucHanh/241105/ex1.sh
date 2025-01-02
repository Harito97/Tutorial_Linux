#!/bin/bash

print_menu() {
    echo 'Lựa chọn 1: Hiển thị thư mục đang hiện hành'
    echo 'Lựa chọn 2: Hiển thị tất cả nội dung của thư mục hiện hành'
    echo 'Lựa chọn 3: Hiển thị các tiến trình đang hoạt động'
    echo 'Lựa chọn 4: Đổi tên tất cả các tệp tin có đuôi .doc sang .txt trong thư mục hiện hành'
    echo 'Lựa chọn 5: Tìm kiếm và hiển thị các tệp tin có tên bắt đầu bằng chuỗi abc trong thư mục hiện hành'
    echo 'Lựa chọn 6: Tìm kiếm và hiển thị các dòng có chứa chữ số trong thư mục hiện hành.'
    echo 'Lựa chọn 0: Thoát khỏi menu'
}

func_1() {
    echo 'Thư mục hiện hành là:'
    pwd
}

func_2() {
    echo 'Tất cả nội dung của thư mục hiện hành là:'
    ls -la
}

func_3() {
    echo 'Các tiến trình đang hoạt động là:'
    ps -aux
    # ps aux
}

func_4() {
    echo 'Đổi tên tất cả các tệp tin có đuôi .doc sang .txt trong thư mục hiện hành'
    for file in *.doc; do
        mv "$file" "${file%.doc}.txt"   # %: remove the shortest match from the end
        mv $file ${file/.doc/.txt}
    done
}

func_5() {
    echo 'Tìm kiếm và hiển thị các tệp tin có tên bắt đầu bằng chuỗi abc trong thư mục hiện hành'
    # find . -type f -name "abc*"
    # ls -f abc*
    # ls -f | grep ^abc
    ls | grep -E "^abc.*"
}

func_6() {
    echo 'Tìm kiếm và hiển thị các dòng có chứa chữ số trong thư mục hiện hành.'
    # ls -a *[0-9]*
    ls | grep -E ".*[0-9].*"
}

func0() {
    echo 'Cảm ơn bạn đã sử dụng chương trình!'
    exit 0
}

menu() {
    while true; do
        print_menu
        read -p 'Nhập lựa chọn của bạn: ' choice
        case $choice in
            1) func_1 ;;
            2) func_2 ;;
            3) func_3 ;;
            4) func_4 ;;
            5) func_5 ;;
            6) func_6 ;;
            0) func_0 ;;
            *) echo 'Lựa chọn không hợp lệ. Vui lòng chọn lại.' ;;
        esac
    done
}

# Nho la phai to chuc moi thu trong ham khong thi lai bi tinh kieu tru diem
# Moi thu trong ham bao gom:
# Moi y func_0: de exit, func_{1..6}: thuc hien cac chuc nang khac
# Uu tien dung grep <Bieu thuc chinh quy> thay vi ls khong thoi (anh cham hoi vl)

menu
