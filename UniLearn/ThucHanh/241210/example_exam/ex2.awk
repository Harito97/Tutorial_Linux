# write function
function find_max(arr, n) {
    max = arr[1];
    for (i = 2; i <= n; i++) {
        if (arr[i] > max) {
            max = arr[i];
        }
    }
    return max;
}

BEGIN {
    OFS = "\t";
    diemtb = 0;
    ketquathi = "";
    print "Câu 1:";
    print "Tên_sinh_viên", "Điểm_trung_bình", "Kết_quả_thi";
}

{
    # Tính điểm trung bình
    diemtb = ($3 + $4) / 2;

    # Xác định kết quả thi
    if (diemtb >= 5) {
        ketquathi = "Đỗ";
    } else {
        ketquathi = "Trượt";
    }

    # Lưu thông tin sinh viên vào mảng
    sinhvien[NR] = $0;
    diemtbs[NR] = diemtb;

    # In kết quả câu 1
    print $1, diemtb, ketquathi;
}

END {
    # Câu 2: Hiển thị tên của các sinh viên nữ có điểm trung bình > 8.0
    print "\nCâu 2:";
    has_female = 0;
    for (i in sinhvien) {
        split(sinhvien[i], fields, " ");
        if (fields[2] == "Nu" && diemtbs[i] > 8) {
            print fields[1];
            has_female = 1;
        }
    }
    if (has_female == 0) {
        print "Không có sinh viên thỏa mãn yêu cầu lọc";
    }

    # Câu 3: Tìm và in ra sinh viên có điểm toán lớn nhất
    print "\nCâu 3:";
    max_toan = 0;
    for (i in sinhvien) {
        split(sinhvien[i], fields, " ");
        if (fields[3] > max_toan) {
            max_toan = fields[3];
        }
    }
    print "Sinh viên có điểm toán cao nhất:";
    for (i in sinhvien) {
        split(sinhvien[i], fields, " ");
        if (fields[3] == max_toan) {
            print fields[1];
        }
    }
}
