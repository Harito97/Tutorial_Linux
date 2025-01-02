#!/bin/bash

# Lấy giờ hiện tại (dưới dạng số từ 0 đến 23)
hour=$(date +%H)

# Kiểm tra giờ và in lời chào tương ứng
if [ "$hour" -ge 5 -a "$hour" -lt 12 ]; then
  echo "Chào buổi sáng!"
elif [ "$hour" -ge 12 -a "$hour" -lt 18 ]; then
  echo "Chào buổi chiều!"
else
  echo "Chào buổi tối!"
fi
