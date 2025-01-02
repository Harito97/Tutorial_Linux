{
    # a.
    if ($5 == "K69A2") {
        a_result = a_result $2 "\n"  # Sử dụng toán tử nối chuỗi
    }

    # b.
    total_students++

    # c.
    if ($3 == "nu") {
        c_result = c_result $0 "\n"
    }

    # d.
    if (NR % 2 == 1) {
        d_result = d_result $0 "\n"
    }
}

END {
    # a.
    print "-----------------------------------------"
    print "Họ và tên các sinh viên trong lớp K69A2:"
    print a_result
    print "-----------------------------------------"

    # b.
    print "Số lượng sinh viên trong danh sách:"
    print total_students "\n"
    print "-----------------------------------------"

    # c.
    print "Thông tin của tất cả các bạn sinh viên có giới tính nữ:"
    print c_result
    print "-----------------------------------------"

    # d.
    print "Nội dung các dòng lẻ trong tệp tin:"
    print d_result
    print "Tổng số dòng:", NR "\n"
    print "-----------------------------------------"
    print "Kết thúc!"
}



# # Phần 1: Hiển thị họ và tên các sinh viên trong lớp K69A2
# BEGIN {
#     print "Họ và tên các sinh viên trong lớp K69A2:"
# }
#
# {
#     if ($5 == "K69A2") {
#         print $2
#     }
# }
#
# # Phân cách sau khi hoàn thành phần 1
# END {
#     print "-----------------------------------------"
# }

# # Phần 2: Tính số lượng sinh viên trong danh sách
# BEGIN {
#     print "Số lượng sinh viên trong danh sách:"
# }
# {
#     total_students++
# }
# END {
#     print total_students
#     print "-----------------------------------------"
# }

# Phần 3: In thông tin sinh viên có giới tính nữ
# BEGIN {
#     print "Thông tin của tất cả các bạn sinh viên có giới tính nữ:"
# }
# {
#     if ($3 == "nu") {
#         print $0
#     }
# }
# END {
#     print "-----------------------------------------"
# }

# # Phần 4: Tổng số dòng và nội dung các dòng lẻ
# BEGIN {
#     print "Nội dung các dòng lẻ trong tệp tin:"
# }
# {
#     if (NR % 2 == 1) {
#         print $0
#     }
# }
# END {
#     print "Tổng số dòng:", NR
#     print "-----------------------------------------"
#     print "Kết thúc!"
# }
