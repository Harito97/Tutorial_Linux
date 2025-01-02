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
    if (( x % 2 == 0 )); then
        echo 'a. YES'
    else
        echo 'a. NO'
    fi

    if (( x % 2 == 1 )); then
        echo 'b. YES'
    else
        echo 'b. NO'
    fi
}

func1c() {
    x=$1
    if (( x < 2 )); then
        echo 'c. NO'
        return
    fi
    for (( i = 2; i * i <= x; i++ )); do
        if (( x % i == 0 )); then
            echo 'c. NO'
            return
        fi
    done
    echo 'c. YES'
}

func1d() {
    x=$1
    sqrt_x=$(echo "sqrt($x)" | bc)
    if (( sqrt_x * sqrt_x == x )); then
        echo 'd. YES'
    else
        echo 'd. NO'
    fi
}

func1() {
    echo "Nhập số nguyên x:"
    read x
    func1ab $x
    func1c $x
    func1d $x
}

func2() {
    if (( $# != 1 || $1 <= 0 )); then
        echo 'Invalid value. Please enter a positive integer.'
        return
    fi
    n=$1
    str_result='S = '
    sum_result=0
    for (( i = 1; i <= n; i++ )); do
        sum_result=$(( sum_result + i ))
        str_result+="$i + "
    done
    str_result="${str_result% + } = $sum_result"  # Remove last " + "
    echo $str_result
}

func3() {
    if (( $# != 1 || $1 <= 0 )); then
        echo 'Invalid value. Please enter a positive integer.'
        return
    fi
    n=$1
    fact=1
    for (( i = 1; i <= n; i++ )); do
        fact=$(( fact * i ))
    done
    echo "$n! = $fact"
}

func4() {
    if (( $# != 1 || $1 <= 0 )); then
        echo 'Invalid value. Please enter a positive integer.'
        return
    fi
    n=$1
    for (( i = 1; i <= 10; i++ )); do
        echo "$n * $i = $(( n * i ))"
    done
}

func5() {
    if [ $# -ne 1 ]; then
        echo 'Usage: func5 <filename>'
        return
    fi
    max_length=0
    longest_line=""
    while IFS= read -r line; do
        length=${#line}
        if (( length > max_length )); then
            max_length=$length
            longest_line=$line
        fi
    done < "$1"
    echo "Longest line: $longest_line"
}

func6() {
    sum() {
        local total=0
        for num in "$@"; do
            total=$(( total + num ))
        done
        echo "Sum: $total"
    }
    echo "Enter numbers to sum (space-separated):"
    read -a numbers
    sum "${numbers[@]}"
}

func7() {
    count() {
        if [ ! -d "$1" ]; then
            echo "Not a directory."
            return
        fi
        local files_count=$(find "$1" -type f | wc -l)
        echo "Number of files in directory $1: $files_count"
    }
    echo "Enter directory name:"
    read dir_name
    count "$dir_name"
}

menu() {
    while true; do
        print_menu
        read choice
        case $choice in
            1) func1 ;;
            2) func2 "$@" ;;
            3) func3 "$@" ;;
            4) func4 "$@" ;;
            5) echo "Enter filename:"; read filename; func5 "$filename" ;;
            6) func6 ;;
            7) func7 ;;
            0) func0 ;;
            *) echo 'Invalid choice. Try again!' ;;
        esac
    done
}

menu
