# **Bài 2**:
# Tạo tệp tin `bai2.txt` trong thư mục `HoVaTen_MaSV` với nội dung sau:
# ```
# Nguyen_Van_Hoa  Nam   7 8
# Tran_Thi_Lan    Nu    6 7
# Le_Thanh_Nhan   Nam   5 6
# ```
# Tạo một tệp tin `bai2.awk` để thực hiện các công việc sau:
# 1. Tính tổng điểm của tất cả các sinh viên trong tệp tin `bai2.txt` và in ra theo định dạng:
#    ```
#    Tên_sinh_viên   Tổng_điểm
#    ```
# 2. Hiển thị tên của các sinh viên nam có tổng điểm > 10. Nếu không có, in ra: `Không có sinh viên thỏa mãn yêu cầu lọc`.
# 3. Tìm và in ra tên của tất cả các sinh viên có điểm thấp nhất?

#!/usr/bin/awk -f

BEGIN {
    print "Processing file bai2.txt...";
}

# Xử lý từng dòng của tệp tin
{
    # Lấy tên sinh viên
    if (NR % 3 == 1) {
        student_name = $0;
        students[student_name]["name"] = student_name;
    }
    # Lấy điểm toán hoặc điểm văn
    else if (NR % 3 == 2) {
        students[student_name]["math"] = $1;
        students[student_name]["literature"] = $2;
    }
    # Lấy giới tính
    else if (NR % 3 == 0) {
        students[student_name]["gender"] = $1;
    }
}

END {
    print "Tính điểm trung bình và kết quả thi...";
    for (name in students) {
        math = students[name]["math"];
        literature = students[name]["literature"];
        avg = (math + literature) / 2.0;
        students[name]["average"] = avg;

        # Xác định kết quả thi
        if (avg >= 5.0) {
            students[name]["result"] = "Đỗ";
        } else {
            students[name]["result"] = "Trượt";
        }

        # In thông tin sinh viên
        print name;
        printf "%.2f\n", avg;
        print students[name]["result"];
    }

    print "\nHiển thị sinh viên nữ có điểm trung bình > 8.0...";
    has_female = 0;
    for (name in students) {
        if (students[name]["gender"] == "Nu" && students[name]["average"] > 8.0) {
            print name;
            has_female = 1;
        }
    }
    if (!has_female) {
        print "Không có sinh viên thỏa mãn yêu cầu lọc";
    }

    print "\nTìm sinh viên có điểm toán lớn nhất...";
    max_math = -1;
    for (name in students) {
        if (students[name]["math"] > max_math) {
            max_math = students[name]["math"];
            best_student = name;
        }
    }
    print best_student;
}
