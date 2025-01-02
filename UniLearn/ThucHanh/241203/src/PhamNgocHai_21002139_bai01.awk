BEGIN {
    print "Diem trung binh: "
}

{
    sum = 0
    for (i = 3; i <= NF; i++)
    {
        sum += $i
    }
    avg = sum / (NF - 2)
    print $2, avg
}

END {
    print "Ket thuc!"
}
