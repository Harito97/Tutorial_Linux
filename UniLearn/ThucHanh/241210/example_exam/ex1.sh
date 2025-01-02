#!/bin/bash
## Thuat toans: UCLN, BCNN, so hoan hao, so nguyen to
## Tim max, tim min, tim so lon thu 3 cua mang, tim so nho thu 3 cua mang
## So Fibonacci, so chinh phuong, so doi xung, so thuan nghich
## ... - bai menu box co tu 1 den 2 lua chon ve thuat toan kho

# Hàm kiểm tra số hoàn hảo
isPerfect() {
    local num=$1
    local sum=0
    for ((i=1; i<num; i++)); do
        if ((num % i == 0)); then
            sum=$((sum + i))
        fi
    done
    if ((sum == num)); then
        echo 1
    else
        echo 0
    fi
}

# Hàm tìm số lớn nhất
func1() {
    arr=("$@")
    max=${arr[0]}
    for num in "${arr[@]}"; do
        if ((num > max)); then
            max=$num
        fi
    done
    dialog --title "Result of choice 1" \
        --backtitle "Menu" \
        --msgbox "Số lớn nhất là: $max" \
        7 40
}

# Hàm tìm số nhỏ nhất
func2() {
    arr=("$@")
    min=${arr[0]}
    for num in "${arr[@]}"; do
        if ((num < min)); then
            min=$num
        fi
    done
    dialog --title "Result of choice 2" \
        --backtitle "Menu" \
        --msgbox "Số nhỏ nhất là: $min" \
        7 40
}

# Hàm tìm số hoàn hảo
func3() {
    arr=("$@")
    perfect_numbers=()
    for num in "${arr[@]}"; do
        if [[ $(isPerfect "$num") -eq 1 ]]; then
            perfect_numbers+=("$num")
        fi
    done

    if [[ ${#perfect_numbers[@]} -eq 0 ]]; then
        dialog --title "Result of choice 3" \
            --backtitle "Menu" \
            --msgbox "Không có số hoàn hảo nào trong mảng." \
            7 50
    else
        dialog --title "Result of choice 3" \
            --backtitle "Menu" \
            --msgbox "Các số hoàn hảo là: ${perfect_numbers[*]}" \
            7 50
    fi
}

# Hàm thoát
func4() {
    clear
    exit
}

# Hàm menu
menu() {
    echo "Nhập mảng các số, cách nhau bởi dấu cách:"
    read -a array

    # Vòng lặp menu
    while true; do
        choice=$(dialog --title "Menu box" \
            --backtitle "Back menu" \
            --menu "Chọn một chức năng" \
            15 40 4 \
            1 "Tìm số lớn nhất" \
            2 "Tìm số nhỏ nhất" \
            3 "Tìm số hoàn hảo" \
            4 "Thoát" \
            3>&1 1>&2 2>&3 3>&-)

        case $choice in
            1)
                func1 "${array[@]}"
                ;;
            2)
                func2 "${array[@]}"
                ;;
            3)
                func3 "${array[@]}"
                ;;
            4)
                func4
                ;;
            *)
                dialog --title "Error" \
                    --backtitle "Menu" \
                    --msgbox "Lựa chọn không hợp lệ!" \
                    7 40
                ;;
        esac
    done
}

menu
