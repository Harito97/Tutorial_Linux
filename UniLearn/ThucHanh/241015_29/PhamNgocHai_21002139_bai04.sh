#!/bin/bash

# Hiển thị menu lựa chọn
echo "Xin mời bạn chọn hành động?"
echo "1. Xem dung lượng sử dụng của máy tính"
echo "2. Xem nội dung thư mục hiện hành"
echo "3. Xem các tiến trình đang chạy trên máy tính dưới dạng cây"
echo "4. Xem tên người dung đang đăng nhập hệ thống"

# Nhập lựa chọn từ người dùng
read choice

# Thực hiện hành động tương ứng với lựa chọn
case $choice in
    1)
        # Xem dung lượng sử dụng của máy tính
        echo "Thông tin sử dụng RAM:"
        free -m
        ;;
    2)
        # Xem nội dung thư mục hiện hành
        echo "Nội dung thư mục hiện hành:"
        ls -la
        ;;
    3)
        # Xem các tiến trình đang chạy dưới dạng cây
        echo "Các tiến trình đang chạy:"
        pstree
        ;;
    4)
        # Xem tên người dùng đang đăng nhập
        echo "Tên người dùng đang đăng nhập:"
        whoami
        ;;
    *)
        echo "Lựa chọn không hợp lệ!"
        ;;
esac
