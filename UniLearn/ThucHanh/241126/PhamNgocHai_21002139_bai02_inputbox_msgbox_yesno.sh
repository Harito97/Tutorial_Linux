#!/bin/bash

check() {
    directory=$1
    if [[ -d $directory ]]; then
        # Ask user if they want to delete the directory
        dialog --yesno "Thư mục đã tồn tại. Bạn có muốn xóa thư mục không?" 8 40
        response=$?
        case $response in
            0)
                # mkdir temp && temp/temp1
                # ls -r temp
                # directory="temp"    # only delete temp directory for testing
                # rm -rf $directory
                dialog --msgbox "Thư mục đã được xóa" 8 40
                ;;
            1)
                dialog --msgbox "Thư mục không được xóa" 8 40
                ;;
            255)
                dialog --msgbox "Thư mục không được xóa" 8 40
                ;;
        esac
    else
        dialog --msgbox "Thư mục không tồn tại" 8 40
    fi
}

main() {
    # Nhập tên thư mục bằng input box
    #directory=$(dialog --inputbox "Nhập vào tên thư mục:" 8 40 3>&1 1>&2 2>&3 3>&-)
    directory=$(dialog --output-fd 1 --inputbox "Nhập vào tên thư mục:" 8 40)

    # Kiểm tra sự tồn tại của thư mục
    check $directory
    echo $directory
}

main
