#!/bin/bash

# Viết shell thực hiện in ra bàn cờ vua
# Để đặt màu chữ dùng cú pháp:
# echo –e "\033[35m <text>"
# (30: Đen, 31: Đỏ, 32: Xanh lá cây, 33: Vàng, 34: Xanh nước biển, 35: Hồng, 36: Xanh da trời, 37: Xám Trắng)
#
# Để đặt màu nền cho chuỗi kết xuất hoặc cho màn hình terminal dùng cú pháp:
# echo –e –n "\033[40m" để đặt nền đen
# (40: Đen, 41: Đỏ, 42: Xanh lá cây, 43: Nâu, 44: Xanh nước biển, 45: Hồng, 46: Xanh da trời, 47: Xám Trắng)

draw_chess() {
    for row in $(seq 0 7); do
        for col in $(seq 0 7); do
    	    tong=$((row + col))
    	    if [[ $((tong % 2)) -eq 0 ]]; then
    		    # echo -n $'\033[47m\033[37m_ \033[0m'     # Đặt màu nền trắng
                # echo -n $'\033[47m \033[37m_\033[0m'
     	        echo -n $'\033[47m  \033[0m'
            else
                # echo -n $'\033[40m\033[30m_ \033[0m'     # Đặt màu nền đen
                # echo -n $'\033[40m \033[30m_\033[0m'
                echo -n $'\033[40m  \033[0m'
    	    fi
        done
        echo "" # Xuống dòng
    done
}

draw_chess
