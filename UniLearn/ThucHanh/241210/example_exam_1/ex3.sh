# **Bài 3**:
# Tạo một tệp tin với tên là `bai3.sh` trong thư mục `HoVaTen_MaSV`, thực hiện:
# Nhập một chuỗi ký tự từ bàn phím. Sau đó, tạo một menu box cho phép người dùng lựa chọn để thực thi các yêu cầu sau:
# - **Lựa chọn 1**: Kiểm tra xem chuỗi có phải là chuỗi palindrome không (chuỗi palindrome là chuỗi đọc xuôi và ngược đều giống nhau). In kết quả ra information box?
# - **Lựa chọn 2**: Đếm số từ trong chuỗi vừa nhập. In kết quả ra information box?
# - **Lựa chọn 3**: In ra chuỗi đảo ngược của chuỗi vừa nhập. In kết quả ra information box?
# - **Lựa chọn 4**: Thoát

func1() {
    arr=("$@")
    local len=${#arr[@]}
    for ((i = 0; i < len / 2; i++)); do
        if [[ ${arr[i]} -ne ${arr[len - i - 1]} ]]; then
            dialog --title "Result of choice 1" \
                --backtitle "Menu" \
                --msgbox "Chuỗi không phải là chuỗi palindrome" \
                7 50
            return
        fi
    done
}

fucl2() {
    arr=("$@")

}

func3() {
    arr=("$@")

}

func4() {
    clear
    exit 0
}

menu() {
    echo 'Nhap vao 1 mang cac chuoi, cach nhau boi dau cach: '
    read -a array

    while true; do
        choice=$(dialog --title "Menu" \
            --menu "Chon mot trong cac lua chon sau:" \
            15 50 4 \
            1 "Kiem tra chuoi co phai la chuoi palindrome khong" \
            2 "Dem so tu trong chuoi" \
            3 "In ra chuoi dao nguoc" \
            4 "Thoat" \
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
                    --msgbox "Chon sai, vui long chon lai" \
                    7 50
        esac
    done
}

menu
