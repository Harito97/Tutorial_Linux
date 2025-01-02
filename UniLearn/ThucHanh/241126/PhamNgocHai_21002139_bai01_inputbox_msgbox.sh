#!/bin/bash

reverse() {
    number=$1
    # Kiểm tra xem số đó có phải là số nguyên không
    if ! [[ $number =~ ^[-]*[0-9]+$ ]]; then
        echo "Số bạn nhập không phải là số nguyên"
        return
    fi
    # Đảo ngược số nguyên
    if ((number < 0)); then
        number=$((number * -1))
        echo "number: $number"
        sign="-"
    else
        sign=""
    fi
    number=$(echo "$number" | rev | sed 's/^0*//')
    result=$(echo "$sign$number")
    if [[ $result == "-" || $result == "" ]]; then
        result=0
    fi
}

main() {
    # Sử dụng input box để nhập số nguyên
    number=$(dialog --inputbox "Nhập vào một số nguyên:" 8 40 3>&1 1>&2 2>&3 3>&-)
    # 3>&1: Tạo một file descriptor mới (3) và trỏ nó đến stdout (1).
    # 1>&2: Đổi stdout (1) thành stderr (2). Điều này có nghĩa là bất kỳ đầu ra nào từ lệnh sẽ được gửi đến stderr.
    # 2>&3: Đổi stderr (2) thành file descriptor 3, mà chúng ta đã trỏ đến stdout ban đầu. Điều này có nghĩa là bất kỳ thông báo lỗi nào sẽ được gửi trở lại stdout.
    # 3>&-: Đóng file descriptor 3 sau khi sử dụng.
    # => Đầu vào từ người dùng (từ dialog) được chuyển đến stdout.
    #    Bất kỳ thông báo lỗi nào từ dialog cũng sẽ được gửi trở lại stdout
    # => dễ dàng xem các thông báo lỗi bên trong script.

    reverse $number

    # Hiển thị kết quả bằng information box
    dialog --msgbox "Kết quả đảo ngược của số nguyên là: $result" 8 40
}

main
