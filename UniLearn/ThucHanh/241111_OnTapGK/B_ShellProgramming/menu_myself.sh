#!/bin/bash

print_menu() {
    echo '------------------'
    echo 'Enter your choice:'
    echo '------------------'
    echo '0. Exit'
    echo '=================='
    echo '1. Nhập một số nguyên x từ bàn phím.'
    echo '  a. Kiểm tra x có phải số chẵn không? Nếu có thì in ra màn hình “YES”, ngược lại in ra màn hình “NO”.'
    echo '  b. Kiểm tra x có phải số lẻ không? Nếu có thì in ra màn hình “YES”, ngược lại in ra màn hình “NO”.'
    echo '  c. Kiểm tra x có phải số nguyên tố không? Nếu có thì in ra màn hình “YES”, ngược lại in ra màn hình “NO”.'
    echo '  d. Kiểm tra x có phải số chính phương không? Nếu có thì in ra màn hình “YES”, ngược lại in ra màn hình “NO”.'
    echo '=================='
    echo '2. Viết 1 shell cho phép nhận đối dòng lệnh là một số nguyên (n>0), sau đó tính giá trị sau'
    echo '  S = 1 + 2 + 3 +....+ n'
    echo '=================='
    echo '3. Viết 1 shell cho phép nhận đối dòng lệnh là một số nguyên (n>0), sau đó tính giá trị của S = n!'
    echo '=================='
    echo '4. Viết 1 shell cho phép nhận đối dòng lệnh là 1 số nguyên (>0), sau đấy in ra kết quả là số đó nhân với các số từ 1 -> 10'
    echo '=================='
    echo '5. Viết 1 shell tìm dòng có độ dài lớn nhất trong một tập tin'
    echo '=================='
    echo '6. Viết 1 shell trong đó có hàm sum() trả về tổng các đối số truyền vào của nó. In tổng vừa tính được ra màn hình?'
    echo '=================='
    echo '7. Viết 1 shell trong đó chứa hàm count() có đối số truyền vào là tên của một thư mục, và trả về số lượng file trong thư mục đó?'
    echo '------------------'
}

func0() {
    echo 'See you soon!'
    exit 0
}

func1ab() {
    x=$1
    echo $x
    if (( x % 2 == 0 )); then
        echo -ne 'a. YES\nb. NO\n'
    else
        echo -ne 'a. NO\nb. YES\n'
    fi
}
func1c() {
    x=$1
    if (( x < 2 )); then
        echo -ne 'c. NO\n'
        return
    fi
    for (( i = 2; i * i <= x; i++ )); do
        if (( x % i == 0 )); then
            echo -ne 'c. NO\n'
            return
        fi
    done
    echo -ne 'c. YES\n'
}
func1d() {
    x=$1
    # Method 1
    # if (( $(( int((x ** 0.5) ** 2) )) == x )); then
    #     echo -n 'd. YES\n'
    # else
    #     echo -n 'd. NO\n'
    # fi
    # Method 2
    # x_sqrt=$(( x ** 0.5 ))
    for i in $(seq 2 $x); do
        if (( i * i == x )); then
            echo -ne 'd. YES\n'
            return
        fi
    done
    echo -ne 'd. NO\n'
}
func1() {
    read x
    func1ab $x
    func1c $x
    func1d $x
}

func2() {
    read x
    if (( x <= 0 )); then
        echo 'Invalid value'
        return
    fi
    str_result='S = '
    sum_result=0
    flag=$(( x - 1 ))
    for i in $(seq 1 $flag); do
        sum_result=$(( sum_result + $i ))
        str_result=$(( str_result + "$i + " ))
    done
    sum_result=$(( sum_result + x ))
    str_result=$(( str_result + "$x = $sum_result" ))
    echo $str_result
}

menu() {
    while true; do
        print_menu
        read choice
        case $choice in
            1) func1 ;;
            2) func2 ;;
            3) func3 ;;
            4) func4 ;;
            5) func5 ;;
            6) func6 ;;
            7) func7 ;;
            0) func0 ;;
            *) echo 'Invalid choice. Try again!'
        esac
    done
}

menu
