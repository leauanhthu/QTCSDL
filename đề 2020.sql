CREATE DATABASE ThueXeOto

CREATE TABLE KHACHTHUE
(
MaKhach nvarchar(20) constraint PK_MA primary key,
TenKhach nvarchar(50) not null,
NgaySinh datetime not null,
GioiTinh nvarchar(10) not null,
DiaChi nvarchar(50) not null,
DienThoai varchar(10) not null,
)
CREATE TABLE XECHOTHUE
(
BienSo varchar(20) constraint PK_Bien PRIMARY KEY,
SoChoNgoi int,
HangSanXuat nvarchar(50) not null,
DonGiaThue float,
)
create table HOPDONGTHUEXE
(
SoHopDong nvarchar(20) constraint PK_So primary key,
MaKhach nvarchar(20) not null,
BienSo varchar(20) not null,
NgayThue datetime,
NgayTra datetime,
ThoiGianThue int ,
GiaTriHopDong float,
DatTruoc nvarchar(20) not null,
ConLai varchar(20) not null,
CONSTRAINT FK_MA_HD FOREIGN KEY(MaKhach) references KHACHTHUE(MaKhach),
CONSTRAINT FK_Bien_Xe FOREIGN KEY(BienSo) REFERENCES XECHOTHUE(BienSo)
)
insert into KHACHTHUE
values('K001',N'Nguyễn Văn Dũng','2003/06/15','Nam','49 Cao Thắng','0766721299')
insert into KHACHTHUE
values('K002',N'Nguyễn Văn Hùng','2000/10/09','Nam','6 Nhuậm Hiền','0984751567')
insert into KHACHTHUE
values('K003',N'Lê Âu Anh Thư','2005/11/10','Nữ','69 Hà Huy Tập','0984798567')

insert into HOPDONGTHUEXE
values ('0001','K001','43D01','2022/12/08','2023/08/08',8,15000000,10000000,5000000)
insert into HOPDONGTHUEXE
values ('0002','K002','43D02','2022/11/10','2022/12/10',1,1000000,500000,500000)
insert into HOPDONGTHUEXE
values ('0002','K002','43D03','2022/08/10','2022/11/10',3,3000000,1000000,2000000)

INSERT INTO XECHOTHUE
VALUES ('43D01',4,'Toyota',4000000)
INSERT INTO XECHOTHUE
VALUES ('43D02',9,'Vinfast',5000000)
INSERT INTO XECHOTHUE
VALUES ('43D03',7,'Honda',100000)

UPDATE XECHOTHUE
SET DonGiaThue=
CASE
	WHEN SoChoNgoi=4 THEN 1000000
	WHEN SoChoNgoi=7 THEN 1500000
	WHEN SoChoNgoi=9 THEN 2000000
	WHEN SoChoNgoi>=9 THEN 2500000
END

--câu d:--
update HOPDONGTHUEXE
set ThoiGianThue= datediff(day,ngaythue,ngaytra)

--câu e:--
update HOPDONGTHUEXE
set GiaTriHopDong= GiaTriHopDong*ThoiGianThue
from XECHOTHUE XT inner join HOPDONGTHUEXE TX on XT.BienSo=TX.BienSo 

--Câu f:--
select sochongoi,hangsanxuat,DONGIATHUE
FROM HOPDONGTHUEXE,XECHOTHUE
WHERE SOCHONGOI=4 AND HangSanXuat='Toyota' 
Group by sochongoi,hangsanxuat,DONGIATHUE
order by DonGiaThue desc

--câu g:--
select KT.MaKhach,tenkhach,DienThoai,SoHopDong
from HOPDONGTHUEXE HD,KHACHTHUE KT
WHERE SoHopDong='HD1111' AND KT.MaKhach=HD.MaKhach

--câu h:--
Select XT.BienSo,COUNT(HangSanXuat)'Số lượng'
from XECHOTHUE XT,HOPDONGTHUEXE TX
WHERE xt.BienSo=tx.BienSo
group by HangSanXuat

--câu i:--
SELECT SoHopDong,TX.BienSo,ThoiGianThue
from HOPDONGTHUEXE TX, XECHOTHUE XT
WHERE (DAY(ThoiGianThue)>7) AND (MONTH(NgayThue) BETWEEN 7 AND 9) AND (YEAR(NGAYTHUE)='2020') AND TX.BienSo=XT.BienSo
ORDER BY ThoiGianThue DESC

