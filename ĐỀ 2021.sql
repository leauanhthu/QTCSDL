CREATE DATABASE QUANLYDUAN


CREATE TABLE NHANVIEN
(
MaNhanVien nvarchar(20) not null constraint PK_MANV primary key,
TenNhanVien nvarchar(50) not null,
GioiTinh nvarchar(20) not null,
CongViec nvarchar(20) not null,
DienThoai varchar(10) not null,
QueQuan nvarchar(20) not null,
)
CREATE TABLE DUAN
(
MaDuAn varchar(10) CONSTRAINT PK_Ma PRIMARY KEY not null,
TenDuAn nvarchar(50) not null,
LoaiDuAn nvarchar(50) not null,
ThoiGianThucHien_Thang INT,
NgayBatDau Datetime,
NgayKetThuc_DuKien Datetime
)

CREATE TABLE TRIENKHAIDUAN
(
ID_PhanCong nvarchar(20) constraint PK_ID primary key,
MaNhanVien nvarchar(20) not null,
MaDuAn varchar(10) not null,
NhiemVu nvarchar(20) not null,
NgayThamGia date,
NgayKetThuc date,
SoNgayThamGia INT,
TinhTrang nvarchar(20)not null,
CONSTRAINT FK_TK_DA FOREIGN KEY(MaDuAn) REFERENCES DUAN(MaDuAn),
CONSTRAINT FK_NV_MA FOREIGN KEY(MaNhanVien) references NHANVIEN(MaNhanVien)
)
DROP TABLE TRIENKHAIDUAN
INSERT INTO NHANVIEN
VALUES('E001',N'Nguyễn Văn Chung',1,N'Software','0905123456',N'Đà Nẵng')
INSERT INTO NHANVIEN
VALUES('E002',N'Nguyễn Thị Hoa',0,N'Software','0905123457',N'Huế')
INSERT INTO NHANVIEN
VALUES('E003',N'Trần Văn Thái',1,N'App Mobile','0905123458',N'Quảng Nam')

INSERT INTO DUAN
VALUES('DA001','ERP','Software',12,'2021-01-15',NULL)
INSERT INTO DUAN
VALUES('DA002','Phân tích dữ liệu','Data Analysis',3,'2021-09-15',NULL)
INSERT INTO DUAN
VALUES('DA003','Chăm sóc khách hàng','App Mobile',6,'2021-10-01',NULL)

INSERT INTO TRIENKHAIDUAN
VALUES('T0001','E001','DA001',N'Lập trình','2021-01-15','2021-03-20',NULL,'Đã kết thúc')
INSERT INTO TRIENKHAIDUAN
VALUES('T0002','E002','DA001',N'Kiểm thử','2021-03-21','2021-03-27',NULL,'Đã kết thúc')
INSERT INTO TRIENKHAIDUAN
VALUES('T0003','E003','DA003',N'Triển khai','2021-12-20','2022-02-15',NULL,'Đang triển khai')


--Câu 6:--
SELECT NV.MaNhanVien,COUNT(CongViec) AS 'SỐ lượng nhân viên'
from NHANVIEN NV, DUAN DA
GROUP BY NV.MaNhanVien
ORDER BY MaNhanVien DESC

--Câu 7:--
select NV.MaNhanVien,TenNhanVien,TK.MaDuAn,NHIEMVU
from NHANVIEN NV, TRIENKHAIDUAN TK
WHERE NhiemVu=N'Lập Trình' and TK.MaDuAn ='DA001' AND NV.MaNhanVien=TK.MaNhanVien

--Câu 9:--
SELECT NV.MaNhanVien, TenNhanVien, TenDuAn, LoaiDuAn, NGAYTHAMGIA, DAY(NgayKetThuc)-DAY(NgayThamGia) 'SỐ NGÀY THAM GIA'
FROM NHANVIEN NV, DUAN DA, TRIENKHAIDUAN TKDA
WHERE NV.MaNhanVien=TKDA.MaNhanVien AND DA.MaDuAn=TKDA.MaDuAn AND DA.MaDuAn='DA001' AND NHIEMVU=N'Kiểm thử'

--Câu 5:--
UPDATE TRIENKHAIDUAN
SET SoNgayThamGia=DATEDIFF(day,NgayThamGia,NgayKetThuc)

--Câu 4:
update DUAN
set NgayKetThuc_DuKien=dateadd(MONTH, ThoiGianThucHien_Thang,NgayBatDau)

--Câu 6:--
SELECT CONGVIEC,COUNT(MANHANVIEN) SONHANVIEN
FROM NHANVIEN
GROUP BY CONGVIEC
ORDER BY SONHANVIEN DESC

--Câu 8:--
SELECT TK.MaDuAn,LoaiDuAn,TenDuAn,NgayKetThuc_DuKien
from TRIENKHAIDUAN TK,DUAN DA
WHERE (MONTH(NGAYKETTHUC_DUKIEN) BETWEEN 1 AND 3) AND YEAR(NGAYKETTHUC_DUKIEN)='2022'AND TK.MaDuAn=DA.MaDuAn
ORDER BY NGAYKETTHUC_DUKIEN ASC


