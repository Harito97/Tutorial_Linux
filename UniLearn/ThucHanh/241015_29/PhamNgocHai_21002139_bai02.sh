#!/bin/bash

# Nhập tên file từ người dùng
read -p "Nhập tên file: " filename

# Kiểm tra sự tồn tại của file
if [ -f "$filename" ]; then
  # Nếu file tồn tại, in nội dung
  cat "$filename"
else
  # Nếu file không tồn tại, in thông báo
  echo "File $filename không tồn tại."
fi
