# **Bài 1**:
# Tạo một tệp tin với tên là `bai1.sh` trong thư mục `HoVaTen_MaSV`, thực hiện:
# Nhập một mảng gồm `n` số nguyên từ bàn phím. Sau đó, tạo một menu box cho phép người dùng lựa chọn để thực thi các yêu cầu sau:
# - **Lựa chọn 1**: Tính tổng tất cả các số chẵn trong mảng vừa nhập. In kết quả ra information box?
# - **Lựa chọn 2**: Đếm số nguyên tố trong mảng vừa nhập. In kết quả ra information box?
# - **Lựa chọn 3**: Kiểm tra xem mảng vừa nhập có đối xứng hay không (một mảng được gọi là đối xứng nếu giá trị tại vị trí đầu và cuối giống nhau, và tiếp tục như vậy). In kết quả ra information box?
# - **Lựa chọn 4**: Thoát

func1() {
    array=("$@")
    local sum=0
    for i in "${arr[@]}"; do
        if ((i % 2 == 0)); then
            ((sum += i))
        fi
    done

    dialog --title "Result of choice 1" \
        --backtitle "Menu" \
        --msgbox "Tổng các số chẵn trong mảng là: $sum" \
        7 50
}

check_prime() {
    local n=$1
    if ((n < 2)); then
        return 1
    fi

    for ((i = 2; i * i <= n; i++)); do
        if ((n % i == 0)); then
            return 1
        fi
    done

    return 0
}

func2() {
    arr=("$@")
    local count=0
    for i in "${arr[@]}"; do
        check_prime "$i"
        if [[ $? -eq 0 ]]; then
            ((count++))
        fi
    done

    dialog --title "Result of choice 2" \
        --backtitle "Menu" \
        --msgbox "Số lượng số nguyên tố trong mảng là: $count" \
        7 50
}

func3() {
    arr=("$@")
    local len=${#arr[@]}
    for ((i = 0; i < len / 2; i++)); do
        if [[ ${arr[i]} -ne ${arr[len - i - 1]} ]]; then
            dialog --title "Result of choice 3" \
                --backtitle "Menu" \
                --msgbox "Mảng không đối xứng." \
                7 50
            return
        fi
    done

    dialog --title "Result of choice 3" \
        --backtitle "Menu" \
        --msgbox "Mảng đối xứng." \
        7 50
}

func4() {
    clear
    exit
}

menu() {
    echo "Nhập mảng các số, cách nhau bởi dấu cách:"
    read -a array

    while true; do
        choice=$(dialog --title "Menu box" \
            --backtitle "Back menu" \
            --menu "Chọn một chức năng" \
            15 40 4 \
            1 "Tính tổng các số chẵn" \
            2 "Đếm số nguyên tố" \
            3 "Kiểm tra mảng đối xứng" \
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
