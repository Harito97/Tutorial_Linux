{
    # a.
    # b.
    classes[$5]++
    # c.
    locations[$4]++
    # d.
    students[$5]++    # Đếm số sinh viên theo lớp
    if ($6 > max_score) {
        max_score = $6
        top_student = $2
    }
}

END {
    # a.
    print "-------------------------"
    print "Tổng số sinh viên:", NR
    print "-------------------------"

    # b.
    print "Tổng số lớp:", length(classes)
    print "-------------------------"

    # c.
    print "Số địa điểm:", length(locations)
    for (loc in locations) {
        print loc, ":", locations[loc]
    }
    print "-------------------------"

    # d.
    print "Sinh viên theo lớp:"
    for (class in students) {
        print "Lớp", class, ":", students[class], "sinh viên"
    }
    print "Sinh viên có điểm cao nhất:", top_student, "-", max_score
    print "-------------------------"
}
