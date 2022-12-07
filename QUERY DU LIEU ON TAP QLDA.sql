
'Câu lệnh bài quản lý ĐỀ ÁN'

 /*Lệnh tạo cơ sở dữ liệu*/

Create DATABASE QUANLY_DA

 /* Sử dung csdl*/
  
 USE QUANLY_DA

/* Lệnh tạo bảng Trình đồ chuyên môn*/

CREATE TABLE CHUYENMON
(
	MaTDCM char (3) Primary key not null,
	TenTDCM Nvarchar (100)
)


/* Lệnh tạo bảng NHANVIEN*/

CREATE TABLE NHANVIEN 
(
	MaNV char(6) PRIMARY KEY NOT NULL, -- Ràng buộc khóa chính, ràng buộc not null
	HoNV nvarchar(20),
	TenLotNV nvarchar(20),
	TenNV nvarchar(20),
	NgaySinh datetime,
	Phai Nvarchar(3), 
	DiaChi varchar(100),
	HeSoLuong dec(4,2),
	MaTDCM char(3) CONSTRAINT RB_TDCM FOREIGN KEY (MaTDCM)REFERENCES CHUYENMON(MATDCM) -- Ràng buộc khóa ngoại
)

alter table nhanvien add constraint checkphai check (PHAI IN (N'Nam', N'Nữ')) -- add ràng buộc check phái

Alter table nhanvien alter column DiaChi nvarchar(100)


/*Bang PHÒNG BAN có cấu trúc như này*/

CREATE TABLE PHONGBAN 
(
	MaPhong Char (2) primary key NOT NULL,
	TenPhong Nvarchar(20) UNIQUE,
)

/*Lệnh tạo bảng NHIEMVU' */

CREATE TABLE NHIEMVU 
(
	MaNhiemVu Char (2) primary key NOT NULL,
	TenNhiemVu Nvarchar(100),
)

/*Lệnh tạo bảng NHAN_NHIEMVU'*/

CREATE TABLE NHAN_NHIEMVU 
(
	MaNV Char (6) CONSTRAINT RB_MNV FOREIGN KEY (MaNV)REFERENCES NHANVIEN(MaNV),
	MaPhong Char (2) CONSTRAINT RB_PB FOREIGN KEY (MaPhong)REFERENCES PHONGBAN(MaPhong),
	MaNhiemVu Char (2) CONSTRAINT RB_NV FOREIGN KEY (MaNhiemVu)REFERENCES NHIEMVU(MaNhiemVu),
	NgayNhanNhiemVu DateTime default (GETDATE()),
	NgayKetThucNhiemVu Datetime, 
	constraint KhoaChinh Primary key (MaNV,MaPhong,MaNhiemVu)
)


/* BẢNG DEAN CÓ  CẤU TRÚC NHƯ SAU */

CREATE TABLE DEAN
(
	MaDA Char (2) Primary key not null,
	TenDA NVARChar (50),
	DiaDiemDA nvarchar(50),
	MaPhong char(2),
	NgayBatDau DateTime,
	NgayKetThuc Datetime
)

/* Bảng phân công có cấu trúc như sau */

CREATE TABLE PHANCONG 
(
	MANV CHAR(6),
	MaDA char (2),
	THOIGIAN DECIMAL(3,1),
	CONSTRAINT PC_MANVIEN_SODA_PK PRIMARY KEY (MaNV, MaDA),
	CONSTRAINT PC_MANVIEN_FK FOREIGN KEY (MaNV) 
		REFERENCES NHANVIEN(MANV),
	CONSTRAINT PC_SODA_FK FOREIGN KEY (MaDA)
		REFERENCES DEAN(MaDA)
)



-- insert dữ liệu cho bảng CHUYÊN MÔN
Select * 
from chuyenmon

insert into CHUYENMON values ('A01',N'Kỹ sư Công nghệ thông tin')
insert into CHUYENMON values ('A02',N'Kỹ sư Mạng máy tính và truyền thông')
insert into CHUYENMON values ('A03',N'Kỹ sư Công nghệ phần mềm')
insert into CHUYENMON values ('A04',N'Kỹ sư Hệ thống thông tin')

insert into CHUYENMON values ('B01',N'Kỹ sư Nông nghiệp')
insert into CHUYENMON values ('C01',N'Cữ nhân kế toán')
insert into CHUYENMON values ('C02',N'Cữ nhân Quản trị doanh nghiệp')

insert into CHUYENMON values ('D01',N'Kỹ thuật viên thiết kế, cài đặt mạng')
insert into CHUYENMON values ('D02',N'Kỹ thuật viên thiết kế đồ họa')
insert into CHUYENMON values ('D03',N'Kỹ thuật viên thu thập số liệu')

Select * 
from chuyenmon 


-- Nhập dữ liệu cho bảng nhanvien
Select * 
from NHANVIEN

insert into NHANVIEN values ('A1.001',N'Nguyễn',N'Thanh',N'Tùng', '08/12/1965',N'Nam',N'Trà Vinh','4.66','A01')
insert into NHANVIEN values ('A1.002',N'Nguyễn',N'Mạnh',N'Hùng', '09/15/1962',N'Nam',N'Vĩnh Long','4.33','A02')

insert into NHANVIEN values ('A1.003',N'Trần',N'Thanh',N'Tâm', '07/31/1972',N'Nữ',N'Vĩnh Long','3.99','A03')
insert into NHANVIEN values ('A1.004',N'Bùi',N'Ngọc',N'Hằng', '07/19/1987',N'Nữ',N'Cần Thơ','3.00','A04')

insert into NHANVIEN values ('A1.005',N'Lê',N'Quỳnh',N'Như', '07/20/1971',N'Nữ',N'Trà Vinh','4.33','B01')
insert into NHANVIEN values ('A1.006',N'Trần',N'Thị',N'Hương', '11/10/1975',N'Nữ',N'Cần Thơ','3.99','C01')

insert into NHANVIEN values ('A1.007',N'Trần',N'Hồng',N'Quang', '04/8/1979',N'Nữ',N'Trà Vinh','3.66','C02')
insert into NHANVIEN values ('A1.008',N'Phạm',N'Văn',N'Vinh', '11/10/1985',N'Nam',N'Vĩnh Long','2.67','D01')

insert into NHANVIEN values ('A2.001',N'Trần',N'Hồng',N'Thanh', '12/8/1967',N'Nữ',N'Trà Vinh','4.66','D02')
insert into NHANVIEN values ('A2.002',N'Nguyễn',N'Mạnh',N'Hùng', '09/15/1962',N'Nam',N'Vĩnh Long','4.33','D03')

insert into NHANVIEN values ('A2.003',N'Trần',N'Thanh',N'Hưng', '07/31/1972',N'Nam',N'Vĩnh Long','4.33','A01')
insert into NHANVIEN values ('A2.004',N'Lê',N'Ngọc',N'Hằng', '07/19/1987',N'Nữ',N'Trà Vinh','3.00','A02')

insert into NHANVIEN values ('A2.005',N'Lê',N'Quỳnh',N'Hương', '07/20/1971',N'Nữ',N'Trà Vinh','3.33','A03')
insert into NHANVIEN values ('A2.006',N'Phan',N'Thị',N'Hương', '11/10/1985',N'Nữ',N'Cần Thơ','3.99','C02')

insert into NHANVIEN values ('A2.007',N'Trần',N'Vinh',N'Quang', '04/08/1979',N'Nam',N'Cần Thơ','3.66','D01')
insert into NHANVIEN values ('A2.008',N'Trần',N'Văn',N'Anh', '11/10/1994',N'Nam',N'Trà Vinh','3.33','D03')
insert into NHANVIEN values ('A2.009',N'Phạm',N'Văn',N'Viễn', '11/10/1995',N'Nam',N'Trà Vinh','3.33','D02')

insert into NHANVIEN values ('A2.010',N'Lê',N'Vinh',N'Quang', '04/08/1979',N'Nam',N'Cần Thơ','3.66','D01')
insert into NHANVIEN values ('A2.011',N'Lê',N'Văn',N'Anh', '11/10/1994',N'Nam',N'Trà Vinh','3.33','D03')
insert into NHANVIEN values ('A2.012',N'Lê',N'Văn',N'Viễn', '11/10/1995',N'Nam',N'Trà Vinh','3.33','D02')


-- nhập số liệu bảng phòng ban


insert into PHONGBAN values('KT',N'Kỹ thuật');
insert into PHONGBAN values('KD',N'Kinh Doanh');
insert into PHONGBAN values('SX',N'Sản xuất');

Select * 
from PHONGBAN

-- 4.Nhập dữ liệu barnt NHIEMVU
INSERT INTO NHIEMVU values ('A1',N'Tổ trưởng tổ kỹ thuật')
INSERT INTO NHIEMVU values ('A2',N'Phó Tổ trưởng tổ kỹ thuật')

INSERT INTO NHIEMVU values ('A3',N'Tổ trưởng tổ sản xuất')
INSERT INTO NHIEMVU values ('A4',N'Phó Tổ trưởng tổ sản xuất')

INSERT INTO NHIEMVU values ('A5',N'Tổ trưởng tổ kinh doanh')
INSERT INTO NHIEMVU values ('A6',N'Phó Tổ trưởng tổ kinh doanh')

INSERT INTO NHIEMVU values ('B1',N'Kỹ thuật viên thiết kế, cài đặt mạng')
INSERT INTO NHIEMVU values ('B2',N'Kỹ thuật viên thiết kế đồ họa')
INSERT INTO NHIEMVU values ('B3',N'Kỹ thuật viên thu thập số liệu')

Select *
from NHIEMVU

--5. Nhập dữ liệu cho bảng NHAN_NHIEMVU

		
INSERT INTO NHAN_NHIEMVU (MaNV, MaPhong, MaNhiemVu, NgayKetThucNhiemVu) 
		values 
			('A1.001','KT','A1', NULL),
			('A1.002','KT','A2', NULL),
			('A1.003','KT','A3', NULL),
			('A1.004','SX','A4', NULL),
			('A1.005','SX','A5', NULL),
			('A1.006','SX','A6', NULL),
			('A1.007','SX','A1', NULL),
			('A2.001','KT','B2', NULL),
			('A2.002','KT','B3', NULL),
			('A2.003','KD','A2', NULL),
			('A2.004','KD','A3', NULL),
			('A2.005','KD','A4', NULL),
			('A2.006','KD','A5', NULL),
			('A2.007','KD','B1', NULL),
			('A2.008','KD','B2', NULL),
			('A2.009','KD','B3', NULL)
		
Select *
from NHAN_NHIEMVU

--6. Nhập dữ liệu cho bang DEAN

INSERT INTO DEAN values ('A1',N'Dự án IoT nông nghiệp', N'Trà Vinh', 'KT', '07/30/2019','07/30/2020')
INSERT INTO DEAN values ('B2',N'Dự án hạ tầng viễn thông', N'Vĩnh Long', 'KD', '07/01/2020','04/07/2021')
INSERT INTO DEAN values ('C3',N'Dự án phát triển phần mềm', N'Cần Thơ', 'SX', '05/02/2020','12/30/2021')

SELECT *
FROM DEAN

--7. Nhập dữ liệu cho bảng PHANONG

INSERT INTO PHANCONG values ('A1.001','A1', '32.5')

INSERT INTO PHANCONG values ('A1.002','A1', '7.5')
INSERT INTO PHANCONG values ('A1.003','B2', '40.0')
INSERT INTO PHANCONG values ('A1.004','A1', '40.0')
INSERT INTO PHANCONG values ('A1.005','B2', '20.0')
INSERT INTO PHANCONG values ('A1.006','C3', '20.0')


INSERT INTO PHANCONG values ('A1.007','A1', '30.0')
INSERT INTO PHANCONG values ('A1.008','B2', '50.0')
INSERT INTO PHANCONG values ('A2.001','C3', '20.0')
INSERT INTO PHANCONG values ('A2.002','A1', '20.0')
INSERT INTO PHANCONG values ('A2.003','B2', '20.0')


INSERT INTO PHANCONG values ('A2.004','B2', '30.0')
INSERT INTO PHANCONG values ('A2.005','A1', '50.0')
INSERT INTO PHANCONG values ('A2.006','B2', '20.0')
INSERT INTO PHANCONG values ('A2.007','C3', '30.0')
INSERT INTO PHANCONG values ('A2.008','B2', '50.0')
INSERT INTO PHANCONG values ('A2.009','C3', '20.0')

INSERT INTO PHANCONG values ('A2.001','A1', '20.0')
INSERT INTO PHANCONG values ('A2.002','A1', '20.0')
INSERT INTO PHANCONG values ('A2.003','B2', '10.0')
INSERT INTO PHANCONG values ('A2.004','C3', '10.0')
INSERT INTO PHANCONG values ('A2.001','B2', '10.0')
INSERT INTO PHANCONG values ('A2.002','C3', '10.0')

SELECT *
FROM PHANCONG

--3.1
-- Cho biết thông tin: MaNV, HoNV, TenLotNV, TenNV, Phai của table nhân viên
select  MaNV, HoNV, TenLotNV, TenNV, Phai
from NHANVIEN

--3.2
-- Liệt kê các thông tin gồm: MaNV, HoNV, TenLotNV, TenNV, Phai của những nhân viên có giới tính là “Nữ”
select  MaNV, HoNV, TenLotNV, TenNV, Phai
from NHANVIEN
where Phai = N'Nữ'

-- Liệt kê các thông tin gồm: MaNV, HoNV, TenLotNV, TenNV, Phai của các nhân viên Nữ VÀ có hệ số lương = 4.33 trong table nhân viên
select  MaNV, HoNV, TenLotNV, TenNV, Phai
from NHANVIEN
where Phai = N'Nữ' AND HeSoLuong =4.33

-- Liệt kê các thông tin gồm: MaNV, HoNV, TenLotNV, TenNV, Phai của các nhân viên Nữ OR có hệ số lương = 4.33 trong table nhân viên
select  MaNV, HoNV, TenLotNV, TenNV, Phai
from NHANVIEN
where Phai = N'Nữ' OR HeSoLuong =4.33

-- Liệt kê các thông tin gồm MaNV, HoNV, TenLotNV, TenNV, Phai, HESOLUONG của các nhân viên có mã số nhân viên là A1
select  MaNV, HoNV, TenLotNV, TenNV, Phai, HeSoLuong
from NHANVIEN
where MaNV LIKE 'A1%'

-- Liệt kê các thông tin gồm MaNV, HoNV, TenLotNV, TenNV, Phai,HESOLUONG của các nhân viên có mã số nhân viên là ký tự đầu là A và ký tự cuối là 1
select  MaNV, HoNV, TenLotNV, TenNV, Phai, HeSoLuong
from NHANVIEN
where MaNV LIKE 'A%1'

-- Liệt kê các thông tin gồm MaNV, HoNV, TenLotNV, TenNV,HESOLUONG của các nhân viên có hệ số lương nằm trong khoảng từ 3.00 đến 4.00
select  MaNV, HoNV, TenLotNV, TenNV, HESOLUONG
from NHANVIEN
where HeSoLuong between 3.00 and 4.00

-- Liệt kê các thông tin gồm MaNV, HoNV, TenLotNV, TenNV,HESOLUONG của các nhân viên có hệ số lương nằm ngo khoảng từ 3.00 đến 4.00
select  MaNV, HoNV, TenLotNV, TenNV, HESOLUONG
from NHANVIEN
where HeSoLuong not between 3.00 and 4.00

-- Cho biết địa chỉ của những nhân viên có giới tính “nam” trong công ty
select distinct Phai, Diachi 
from NHANVIEN
where Phai = 'Nam'

-- Liệt kê các thông tin gồm MaNV, HoNV, TenLotNV, TenNV, HESOLUONG của các nhân viên, kết quả sắp xếp theo thứ tự tăng dần của cột tên.
select  MaNV, HoNV, TenLotNV, TenNV, HESOLUONG
from NHANVIEN
order by TenNV ASC

-- Liệt kê các thông tin gồm MaNV, HoNV, TenLotNV, TenNV, HESOLUONG của các nhân viên nữ, kết quả sắp xếp theo thứ tự tăng dần của cột tên, cùng tên sắp xếp giảm dần theo hệ số lương.
select  MaNV, HoNV, TenLotNV, TenNV, HESOLUONG
from NHANVIEN
where Phai = N'Nữ'
order by TenNV ASC,HeSoLuong DESC

-- Liệt kê tất cả các thông tin của bảng PHANCONG
select * 
from PHANCONG

--Cần hiển thị Mada, Thoigian từ bảng PHANCONG và nhóm theo mã dự án,thời gian.
select MaDA, THOIGIAN
from PHANCONG
group by MaDA, THOIGIAN

--- Cho biết thời gian được phân công thực hiện dự án nhỏ nhất có trong từng dự ánselect MaDA, min(THOIGIAN)from PHANCONGgroup by MaDA-- Đếm số dự án mà mỗi nhân viên tham gia thực hiệnselect MANV, COUNT(MaDA)as 'SO_DA'from PHANCONGgroup by MaNV--- Tìm thời gian lớn nhất, trung bình, tổng thời gian thực hiện đối với từng dự ánselect max(THOIGIAN), AVG(THOIGIAN), SUM(THOIGIAN)from PHANCONGgroup by MaDA-- Viết lệnh đếm số người thực hiện cho mỗi dự án; -- Đếm số dự án mà mỗi nhân viên tham gia thực hiệnselect MADA, COUNT(MANV)as 'SO_NGUOI_THAM_GIA'from PHANCONGgroup by MaDA