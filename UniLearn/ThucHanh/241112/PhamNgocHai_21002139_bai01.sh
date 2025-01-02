#!/bin/bash

# Hàm nhập
get_input() {
    read -a arr
    # Duyệt qua mảng để đảm bảo đó là số nguyên
    for i in "${arr[@]}"; do
        if ! [[ "$i" =~ ^-?[0-9]+$ ]]; then
            echo 'Mảng nhập vào không phải là mảng số nguyên'
            exit 1
        fi
    done
    # Trả về mảng số nguyên
    echo "${arr[@]}"
}

# Hàm tính tổng các phần tử trong mảng
cal_sum() {
    arr=($@)
    sum=0
    for i in "${arr[@]}"; do
        sum=$((sum + i))
    done
    echo "Tổng các phần tử trong mảng: $sum"
}

# Hàm tìm min, max trong mảng
find_min_max() {
    arr=($@)
    # Gán phần tử đầu tiên của mảng là min, max
    min_element=${arr[0]}
    max_element=${arr[0]}
    for i in "${arr[@]}"; do
        if [[ $i -lt $min_element ]]; then
            min_element=$i
        fi
        if [[ $i -gt $max_element ]]; then
            max_element=$i
        fi
    done
    echo "Min: $min_element"
    echo "Max: $max_element"
}

# Hàm kiểm tra số nguyên tố
func_is_prime() {
    local i=$1
    if [[ $i -lt 2 ]]; then
        echo 0
        return
    fi
    for ((j = 2; j <= i / 2; j++)); do
        if [[ $((i % j)) -eq 0 ]]; then
            echo 0
            return
        fi
    done
    echo 1
}

# Hàm tìm số nguyên tố trong mảng
find_prime() {
    arr=($@)
    prime_arr=()
    for i in "${arr[@]}"; do
        if [[ $i -lt 0 ]]; then
            continue
        fi
        is_prime=$(func_is_prime $i)
        if [[ $is_prime -eq 1 ]]; then
            prime_arr+=($i)
        fi
    done
    echo "Số nguyên tố trong mảng: ${prime_arr[@]}"
}

# Hàm tìm tất cả số chính phương trong mảng
find_square() {
    arr=($@)
    square_arr=()
    for i in "${arr[@]}"; do
        if [[ $i -lt 0 ]]; then
            # temp=$((i * -1))
            continue
        else
            temp=$i
        fi
        sqrt_i=$(echo "scale=0; sqrt($temp)" | bc)  # Đảm bảo không có số thập phân
        if [[ $((sqrt_i * sqrt_i)) -eq $i ]]; then
            square_arr+=($i)
        fi
    done
    echo "Số chính phương trong mảng: ${square_arr[@]}"
}

func_exit() {
    echo "Cam on ban da su dung!"
    exit 0
}

# main() {
#     echo "Nhập mảng số nguyên: "
#     arr=$(get_input)
#     echo "Mảng: ${arr[@]}"
#     cal_sum ${arr[@]}
#     find_min_max ${arr[@]}
#     find_prime ${arr[@]}
#     find_square ${arr[@]}
# }

print_menu() {
    echo "------------------"
    echo "Nhap vao lua chon:"
    echo "------------------"
    echo "1. Tính và in ra tổng các phần tử trong mảng"
    echo "2. Tìm phần tử lớn nhất và nhỏ nhất trong mảng"
    echo "3. Tìm và in ra tất cả các số nguyên tố trong mảng"
    echo "4. Tìm và in ra tất cả các số chính phương trong mảng"
    echo "-----------------------------------------------------"
}

menu() {
    print_menu
    read -p "Lua chon cua ban la: " choice
    case $choice in
        1) cal_sum $@ ;;
        2) find_min_max $@ ;;
        3) find_prime $@ ;;
        4) find_square $@ ;;
        0) func_exit ;;
        *) echo "Invalid choice!"
    esac
}

main() {
    echo "Nhập mảng số nguyên:"
    arr=$(get_input)
    echo "Mảng: ${arr[@]}"
    while true; do
        menu ${arr[@]}
    done
}

main
