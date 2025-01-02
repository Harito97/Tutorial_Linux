BEGIN {
    print "Ho cua cac sinh vien: "
}

{
    split($2, parts, "_") # Tách chuỗi $1 bằng dấu "_"
    ho = parts[1]         # Lấy họ
    print ho              # In họ ra
}

END {
    print "Ket thuc!"
}
