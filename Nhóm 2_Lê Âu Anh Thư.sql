﻿CREATE DATABASE QLSV3
create table SINHVIEN
(
MASV varchar(15) CONSTRAINT PK_SVIEN PRIMARY KEY ,
HOTEN NVARCHAR(50) NOT NULL,
NGAYSINH DATETIME,
SODT_ VARCHAR(10) NOT NULL,
GIOITINH nvarchar(8) not null,
DIACHI nvarchar(50) not null,
MALOP varchar(10)
CONSTRAINT FK_SINHVIEN_LOP FOREIGN KEY (MALOP) REFERENCES LOP(MALOP)
)

create table LOP
(
MALOP varchar(10) constraint PK_LOP primary key,
TENLOP nvarchar(20) not null unique,
LOPTRUONG NVARCHAR(15) NOT NULL
CONSTRAINT U_MALOP UNIQUE (MALOP)
CONSTRAINT FK_LT_SV FOREIGN KEY(LOPTRUONG) REFERENCES SINHVIEN(MASV)
)

CREATE TABLE HOCPHAN
(
MAHP VARCHAR(10) CONSTRAINT PK_MAHP PRIMARY KEY,
TENHP NVARCHAR(50) NOT NULL,
SOTINCHI INT,
CONSTRAINT CHK_TINCHI_MAKHOA CHECK (SOTINCHI>=2 AND SOTINCHI<=4),
)

CREATE TABLE KETQUA1
(
MASV varchar(15) NOT NULL,
MAHP INT,
DIEM REAL,
CONSTRAINT PK_KETQUA PRIMARY KEY(MASV,MAHP),
CONSTRAINT CHK_DIEM_KQUA CHECK (DIEM>=0 AND DIEM <=10)
)
DROP TABLE KETQUA

INSERT INTO LOP
VALUES('46K25.1','Quản trị kinh doanh','Nguyễn Anh Thư')
INSERT INTO LOP
VALUES('46K19.2','Luật','Trần Hoàng Danh')
INSERT INTO LOP
VALUES('46K21.3','Quản trị thông tin','Nguyễn Chí')
DROP TABLE LOP

SELECT*FROM SINHVIEN
INSERT INTO SINHVIEN
values('0017',N'Nguyễn Anh Thư','2003/06/15',0766721299,'NỮ','49 Cao Thắng','46.K25.1')
INSERT INTO SINHVIEN
values('0019',N'Trần Hoàng Danh','2003/05/25',0796626276,'NAM','78 Nguyễn Hữu Thọ','46K19.2')
INSERT INTO SINHVIEN
values('0020',N'Lê Viết Mỹ','2003/03/20',0798826254,'NAM','65 Trưng Trắc','46K25.1')

insert into HOCPHAN
VALUES('1','TH0001',3)
insert into HOCPHAN
VALUES('2','TO0001',3)
insert into HOCPHAN
VALUES('3','TA0001',3)


insert into KETQUA1(MASV,MAHP,DIEM)
values('0019','0002',8.0)
insert into KETQUA1(MASV,MAHP,DIEM)
values('0017','0003',7.0)
insert into KETQUA1(MASV,MAHP,DIEM)
values('0020','0004',8.0)
ALTER TABLE KETQUA DROP CONSTRAINT PK_KETQUA
ALTER TABLE KETQUA ADD CONSTRAINT PK_KETQUA
DROP TABLE KETQUA

--CÂU 3:
select MASV,HOTEN,YEAR(GETDATE())-YEAR(NGAYSINH) TUỔI
FROM SINHVIEN
where (YEAR(GETDATE())-YEAR(NGAYSINH)>=20) AND GIOITINH=N'NỮ'
--CÂU 4:
SELECT MASV,HOTEN,MONTH(NGAYSINH) tháng
FROM SINHVIEN,LOP
WHERE MONTH(NGAYSINH) BETWEEN 7 AND 10 AND MALOP LIKE N'%46K21.3%' AND MALOP.SINHVIEN=MALOP.LOP
--CÂU 5:
SELECT MASV,HOTEN,TENHP
FROM SINHVIEN,HOCPHAN

--CÂU 6:
SELECT MASV,HOTEN
FROM SINHVIEN SV, HOCPHAN HP
WHERE TENHP=N'Cơ sở dữ liệu'
--Cấu 7:

--Câu 4--:
select MASV,HOTEN,MALOP,MONTH(NGAYSINH) tháng
from SINHVIEN,LOP
WHERE MALOP=N'46K21.3' and month(ngaysinh) between 7 and 10 AND MALOP.SINHVIEN=MALOP.LOP
--Câu 5:
select masv,hoten,HOCPHAN.MAHP,TENHP
from SINHVIEN,HOCPHAN,KETQUA
WHERE HOCPHAN.MAHP=KETQUA.MAHP
--CÂU 6:--
SELECT MASV,HOTEN,TENHP,MAHP
FROM SINHVIEN,HOCPHAN,KETQUA
WHERE HOCPHAN.MAHP=KETQUA.MAHP
EXCEPT
SELECT MASV,HOTEN,TENHP,MAHP
FROM SINHVIEN,HOCPHAN,KETQUA
WHERE HOCPHAN.MAHP=KETQUA.MAHP AND TENHP LIKE N'%Cơ sở dữ liệu'
--Câu 7--:
select masv,hoten


--Câu 8--:
Select top 2 DIEM,SV.MASV,HOTEN,tenhp
 from SINHVIEN SV,KETQUA1,HOCPHAN
 where TENHP LIKE N'%Cơ sở dữ liệu'
 order by DIEM DESC
 --Câu 9--:
 alter table KETQUA1 add XEPLOAI nvarchar(20)
UPDATE KETQUA1
SET XEPLOAI=
CASE
	WHEN DIEM >=8.0 THEN N'GIỎI'
	WHEN DIEM >=6.5 THEN N'KHÁ'
	WHEN DIEM >=5 THEN N'TRUNG BÌNH'
	WHEN DIEM <5 THEN N'YẾU'
END
--Câu 10--:

SELECT SV.MASV,HOTEN ,TENHP,DIEM
FROM SINHVIEN SV,HOCPHAN HP,KETQUA1 KQ
WHERE SV.MASV=KQ.MASV AND KQ.MAHP=HP.MAHP AND DIEM >=ALL
														( SELECT DIEM
														FROM KETQUA1)