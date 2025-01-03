**Bài 1**:
Tạo một tệp tin với tên là `bai1.sh` trong thư mục `HoVaTen_MaSV`, thực hiện:
Nhập một mảng gồm `n` số nguyên từ bàn phím. Sau đó, tạo một menu box cho phép người dùng lựa chọn để thực thi các yêu cầu sau:
- **Lựa chọn 1**: Tính tổng tất cả các số chẵn trong mảng vừa nhập. In kết quả ra information box?
- **Lựa chọn 2**: Đếm số nguyên tố trong mảng vừa nhập. In kết quả ra information box?
- **Lựa chọn 3**: Kiểm tra xem mảng vừa nhập có đối xứng hay không (một mảng được gọi là đối xứng nếu giá trị tại vị trí đầu và cuối giống nhau, và tiếp tục như vậy). In kết quả ra information box?
- **Lựa chọn 4**: Thoát

---

**Bài 2**:
Tạo tệp tin `bai2.txt` trong thư mục `HoVaTen_MaSV` với nội dung sau:
```
Nguyen_Van_Hoa  Nam   7 8
Tran_Thi_Lan    Nu    6 7
Le_Thanh_Nhan   Nam   5 6
```
Tạo một tệp tin `bai2.awk` để thực hiện các công việc sau:
1. Tính tổng điểm của tất cả các sinh viên trong tệp tin `bai2.txt` và in ra theo định dạng:
   ```
   Tên_sinh_viên   Tổng_điểm
   ```
2. Hiển thị tên của các sinh viên nam có tổng điểm > 10. Nếu không có, in ra: `Không có sinh viên thỏa mãn yêu cầu lọc`.
3. Tìm và in ra tên của tất cả các sinh viên có điểm thấp nhất?

---

**Bài 3**:
Tạo một tệp tin với tên là `bai3.sh` trong thư mục `HoVaTen_MaSV`, thực hiện:
Nhập một chuỗi ký tự từ bàn phím. Sau đó, tạo một menu box cho phép người dùng lựa chọn để thực thi các yêu cầu sau:
- **Lựa chọn 1**: Kiểm tra xem chuỗi có phải là chuỗi palindrome không (chuỗi palindrome là chuỗi đọc xuôi và ngược đều giống nhau). In kết quả ra information box?
- **Lựa chọn 2**: Đếm số từ trong chuỗi vừa nhập. In kết quả ra information box?
- **Lựa chọn 3**: In ra chuỗi đảo ngược của chuỗi vừa nhập. In kết quả ra information box?
- **Lựa chọn 4**: Thoát

---

**Bài 4**:
Tạo tệp tin `bai4.txt` trong thư mục `HoVaTen_MaSV` với nội dung sau:
```
Nguyen_Thi_Thu 90 85 95
Le_Van_Hieu 70 60 80
Tran_Minh_Anh 50 40 60
Nguyen_Van_Nam 85 75 95
```
Mỗi dòng gồm: `Tên_sinh_viên`, `Điểm_Toán`, `Điểm_Lý`, `Điểm_Hóa`.

Tạo một tệp tin `bai4.awk` để thực hiện các công việc sau:
1. Tính điểm trung bình của từng sinh viên và hiển thị kết quả theo định dạng:
   ```
   Tên_sinh_viên
   Điểm_trung_bình
   ```
2. Hiển thị danh sách các sinh viên có điểm trung bình > 8.0. Nếu không có, in ra: `Không có sinh viên thỏa mãn yêu cầu`.
3. Tìm và in ra tên của sinh viên có điểm Toán cao nhất.

---

**Bài 5**:
Tạo một tệp tin với tên là `bai6.sh` trong thư mục `HoVaTen_MaSV`, thực hiện:
Tạo một menu box sử dụng `dialog` để nhập một mảng gồm `n` số nguyên từ bàn phím. Sau đó, cho phép người dùng lựa chọn các chức năng sau:
- **Lựa chọn 1**: Sắp xếp mảng vừa nhập theo thứ tự tăng dần. Hiển thị mảng đã sắp xếp ra information box.
- **Lựa chọn 2**: Đếm số lượng số chia hết cho 3 trong mảng. Hiển thị kết quả ra information box.
- **Lựa chọn 3**: Kiểm tra xem mảng có chứa số nguyên tố nào không. Nếu có, hiển thị các số nguyên tố ra information box. Nếu không, hiển thị: `Không có số nguyên tố nào`.
- **Lựa chọn 4**: Thoát

---

**Bài 6**:
Tạo tệp tin `bai6.txt` trong thư mục `HoVaTen_MaSV` với nội dung sau:
```
A001 Le_Van_A     8 9
A002 Tran_Thi_B   7 8
A003 Nguyen_Van_C 6 7
A004 Hoang_Minh_D 7 8
A005 Pham_Thi_E   9 9
```
Mỗi dòng đầu là `Mã_sinh_viên` và `Tên_sinh_viên`. Các dòng sau là `Điểm Toán` và `Điểm Văn` tương ứng.

Tạo một tệp tin `bai5.awk` để thực hiện các công việc sau:
1. Tính điểm trung bình của từng sinh viên và hiển thị danh sách có định dạng:
   ```
   Mã_sinh_viên Tên_sinh_viên Điểm_trung_bình
   ```
2. Hiển thị danh sách các sinh viên có điểm Văn > 8.0. Nếu không có, in ra: `Không có sinh viên thỏa mãn yêu cầu`.
3. Tìm và in ra mã sinh viên có điểm trung bình cao nhất.
