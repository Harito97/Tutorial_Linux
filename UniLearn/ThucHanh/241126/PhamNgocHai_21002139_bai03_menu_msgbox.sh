#!/bin/bash

func1() {
    current_dir=$(pwd)
    dialog --msgbox "Thư mục đang hiện hành: $current_dir" 8 40
}

func2() {
    contents=$(ls)
    dialog --msgbox "Nội dung của thư mục hiện hành:\n$contents" 15 50
}

func3() {
    processes=$(ps)
    dialog --msgbox "Tiến trình đang hoạt động:\n$processes" 15 50
}

func4() {
    files=$(ls | grep '^abc')
    dialog --msgbox "Các tệp tin bắt đầu bằng 'abc':\n$files" 15 50
}

func5() {
    grep_output=$(ls | grep '[0-9]')
    dialog --msgbox "Các dòng có chứa chữ số:\n$grep_output" 15 50
}

func0() {
    exit 0
}

other() {
    dialog --msgbox "Lựa chọn không hợp lệ." 8 40
}

main() {
    while true; do
        # Tạo menu box
        choice=$(dialog --menu "Chọn một lựa chọn:" 15 50 6 \
            1 "Hiển thị thư mục đang hiện hành" \
            2 "Hiển thị tất cả nội dung của thư mục hiện hành" \
            3 "Hiển thị các tiến trình đang hoạt động" \
            4 "Tìm kiếm tệp tin bắt đầu bằng 'abc'" \
            5 "Tìm kiếm dòng có chứa chữ số" \
            0 "Thoát" 3>&1 1>&2 2>&3 3>&-)

        case $choice in
            1) func1 ;;
            2) func2 ;;
            3) func3 ;;
            4) func4 ;;
            5) func5 ;;
            0) func0 ;;
            *) other ;;
        esac
    done
}

main
