USE QLNV
--1.Liệt kê những nhân viên (MANV,HONV,TENLOT,TENNV) làm việc ở phòng "NC"
SELECT MANV,HONV,TENLOT,TENNV,PHONG
FROM NHANVIEN,PHONGBAN
WHERE PHONG='NC' AND PHONG=MAPHG
--Cách 2:
SELECT MANV, HONV +' ' + TENLOT +' ' + TENNV +' ' 'HỌ VÀ TÊN NHÂN VIÊN', MAPHG
FROM NHANVIEN, PHONGBAN
WHERE MAPHG= 'NC' AND PHONG=MAPHG

SELECT MANV, HONV +' ' + TENLOT +' ' + TENNV +' ' 'HỌ VÀ TÊN NHÂN VIÊN', MAPHG
FROM NHANVIEN INNER JOIN PHONGBAN ON PHONG =MAPHG
WHERE MAPHG='NC'
--2.Liệt kê những nhân viên (MANV, HONV, TENLOT, TENNV,PHAI) có mức lương trên 3.000.000
SELECT MANV,HONV,TENLOT,TENNV,PHAI,MLUONG
FROM NHANVIEN
WHERE MLUONG>30000000
--3.Liệt  kê  họ  tên  nhân  viên  và  tên  phòng  ban  nhân  viên đó  trực  thuộc  có  mức  lương  từ  2.000.000  đến 3.000.000
SELECT NV.MANV,HONV +' '+TENLOT +' '+TENNV +' ' 'HỌ TÊN NHÂN VIÊN',PB.TENPHG,MLUONG
FROM NHANVIEN NV,PHONGBAN PB
WHERE (MLUONG BETWEEN 2000000 AND 3000000) AND NV.PHONG=PB.MAPHG
--4.Liệt kê họ tên đầy đủ của các nhân viên ở “TP HCM”
SELECT MANV,HONV +' '+TENLOT +' '+TENNV +' ' 'HỌ TÊN NHÂN VIÊN',DCHI
FROM NHANVIEN
WHERE DCHI LIKE N'%TpHCM'
--5.Liệt kê ngày sinh và địa chỉ của nhân viên “Dinh Ba Tien”
SELECT MANV,HONV +' '+TENLOT +' '+TENNV +' ' 'HỌ TÊN NHÂN VIÊN', NGSINH,DCHI
FROM NHANVIEN
WHERE HONV =N'Đinh' and TENLOT=N'Bá' and TENNV=N'Tiên'  
--6.Liệt kê danh sách các thân nhân dưới 18 tuổi của các nhân viên có mã là “NV001"
SELECT NV.MANV, TN.MATN, TN.NGSINH
FROM NHANVIEN NV, THANNHAN TN
WHERE YEAR(GETDATE())- YEAR(TN.NGSINH) < 18 AND TN.MANV=NV.MANV AND NV.MANV LIKE N'%001'

--7.Liệt kê danh sách tất cả các nhân viên nữ trên 30 tuổi
SELECT HONV+' ' +TENLOT+' '+TENNV 'TENNV', NGSINH,PHAI
FROM NHANVIEN
WHERE YEAR(GETDATE())-YEAR(NGSINH)>30 and PHAI=N'NỮ'

--2.2.PHÉP KẾT
--8.Với mỗi phòng ban, liệt kê tên phòng ban và địa điểm phòng
SELECT DIADIEM,TENPHG
FROM PHONGBAN PB,DIADIEM_PHG
WHERE PB.MAPHG=DIADIEM_PHG.MAPHG
--CÁCH 2:
SELECT PB.MAPHG, TENPHG,DDP.DIADIEM
FROM PHONGBAN PB INNER JOIN DIADIEM_PHG DDP ON PB.MAPHG=DDP.MAPHG
WHERE PB.MAPHG=DDP.MAPHG
--9.Liệt kê tên những người trưởng phòng của từng phòng ban
SELECT HONV+' ' +TENLOT+' '+TENNV 'Tên Trưởng Phòng',TRPHG,TENPHG,MANV
FROM PHONGBAN PB,NHANVIEN NV
WHERE PB.TRPHG=NV.MANV
--10.Liệt kê TENDA, MADA, DDIEM_DA, PHONG, TENPHG, MAPHG, TRPHG, NGNC
SELECT TENDA, MADA, DDIEM_DA, DA.MAPHG, TENPHG, PB.MAPHG, TRPHG, NGNC
FROM DEAN DA,PHONGBAN PB
WHERE PB.MAPHG=DA.MAPHG
--PHÒNG KHÔNG CÓ Ở TRONG BẢNG ĐỀ ÁN MÀ CHỈ CÓ MÃ PHÒNG
--11.Liệt kê tên và địa chỉ của tất cả các nhân viên của phòng "Nghien cuu"
SELECT TENNV,DCHI,TENPHG
FROM NHANVIEN NV,PHONGBAN PB
WHERE TENPHG=N'Nghiên Cứu' AND NV.PHONG=PB.MAPHG
--12.Liệt kê tên những nữ nhân viên và tên người thân của họ
SELECT TENNV,NV.PHAI,TENTN
FROM NHANVIEN NV,THANNHAN TN
WHERE NV.PHAI=N'NỮ' AND NV.MANV=TN.MANV
--13.Liệt kê mã số và tên những nhân viên thuộc phòng “Nghien Cuu”  tham gia đề án “Tin Hoc Hoa” với thời gian làm việc 20 giờ/tuần
SELECT NV.MANV,TENNV,TENPHG,TENDA,THOIGIAN,PC.MADA
FROM NHANVIEN NV,PHONGBAN PB,DEAN DA,PHANCONG PC
WHERE TENPHG=N'Nghiên Cứu' and TENDA LIKE N'%Tin học hoá%' and THOIGIAN=20 AND PB.MAPHG=NV.PHONG and PB.MAPHG=DA.MAPHG and DA.MADA=PC.MADA and PC.MANV=NV.MANV
--14.Với mọi đề án ở "Ha Noi", liệt kê các mã số đề án (MADA), mã số phòng ban chủ trì đề án(PHONG), họ tên trưởng phòng (HONV, TENLOT, TENNV) cũng như địa chỉ (DCHI) và ngày sinh (NGSINH) của người ấy
select DDIEM_DA,DA.MADA,DA.MAPHG,HONV+' '+ TENLOT+' '+TENNV AS 'TEN TRUONG PHONG'
FROM PHONGBAN PB,NHANVIEN NV,DEAN DA, PHANCONG PC
WHERE PHONG=DA.MAPHG and DA.MADA=PC.MADA and PC.MANV=PB.TRPHG and PB.TRPHG=NV.MANV and DDIEM_DA ='HANOI'

select	MADA,DA.MAPHG,HONV,TENLOT,TENNV,NGSINH,DCHI
from	DEAN DA,PHONGBAN PB,NHANVIEN NV
where	DA.MAPHG=PHONG and TRPHG=NV.MANV and DDIEM_DA='HANOI'
go
SELECT*FROM NHANVIEN
SELECT*FROM PHONGBAN
--15.Với mỗi nhân viên, liệt kê họ tên nhân viên và họ tên người quản lý trực tiếp của nhân viên đó
select NV.HONV+' '+NV.TENLOT+' '+ NV.TENNV 'Họ Và Tên Nhân Viên',QL.HONV+ ' ' +QL.TENLOT+ ' ' +QL.TENNV 'Họ Và Tên Quản Lí'
from NHANVIEN NV,NHANVIEN QL
where NV.MA_NQL=QL.MANV
--16.Với mỗi nhân viên, liệt kê họ tên nhân viên và họ tên trưởng phòng của phòng ban mà nhân viên đó làm việc
select nv.HONV+ ' ' +nv.TENLOT+ ' ' +nv.TENNV as 'Họ Và Tên Nhân Viên',ql.HONV+ ' ' +ql.TENLOT+ ' ' +ql.TENNV as 'Họ Và Tên Quản Lí',tp.HONV+ ' ' +tp.TENLOT+ ' ' +tp.TENNV as 'Họ Và Tên Trưởng Phòng'
from NHANVIEN nv,NHANVIEN ql,NHANVIEN tp,PHONGBAN pb
where nv.MA_NQL = ql.MANV and tp.manv = pb.TRPHG and NV.PHONG =TP.PHONG
--Cách 2:
SELECT distinct NV.HONV+' '+NV.TENLOT+' '+ NV.TENNV 'Họ Và Tên Nhân Viên', TP.HONV+ ' ' +TP.TENLOT+ ' ' + TP.TENNV 'Họ Và Tên Trưởng Phòng'
FROM NHANVIEN NV, NHANVIEN TP, PHONGBAN PB
WHERE TP.MANV=PB.TRPHG AND NV.PHONG =TP.PHONG
--17.Liệt kê họ tên nhân viên (HONV, TENLOT, TENNV) và tên các đề án mà nhân viên ấy tham gia nếu có
select HONV,TENLOT,TENNV,pc.MADA,TENDA
from NHANVIEN nv,PHANCONG pc,DEAN da
where nv.manv=pc.manv and da.mada=pc.mada

--2.4.CÂU TRUY VẤN LỒNG
--23.Liệt kê danh sách các đề án (MADA) có: nhân công với họ (HONV) là ‘Dinh’ hoặc có người trưởng phòng chủ trì đề án với họ (HONV) là ‘Dinh’
SELECT PC.MADA,HONV
FROM PHANCONG PC, NHANVIEN NV
WHERE NV.MANV=PC.MANV AND HONV=N'Đinh'
UNION
SELECT DEAN.MADA,HONV
FROM NHANVIEN,PHONGBAN,DEAN
WHERE NHANVIEN.MANV = PHONGBAN.TRPHG AND PHONGBAN.MAPHG = DEAN.MAPHG AND NHANVIEN.HONV = N'Đinh'
--24.Liệt kê danh sách những nhân viên (HONV, TENLOT, TENNV) có trên 2 thân nhân
SELECT HONV,TENLOT,TENNV
FROM NHANVIEN

Cho biết họ tên các nhân viên đã đến tuổi về hưu (nam 60 tuổi, nữ 55 tuổi)
select honv,tenlot,tennv,phai,year(getdate())-year(ngsinh) tuoi
from nhanvien

SELECT HONV, TENNV
FROM NHANVIEN
WHERE YEAR(GETDATE())-YEAR(NGSINH) >= ( CASE PHAI
									WHEN'Nam'THEN 1
									WHEN'Nu'THEN 2
									END ) AS PHAI
								select*from NHANVIEN 


/*ĐSQH và SQL
C1
 Phép chiếu --> SELECT <Các thuộc tính>
 Phép x     --> FROM   <Các quan hệ>
 Phép chọn  --> WHERE  <DK kết> [and] [<DK Chon>]
C2:
 Phép chiếu --> SELECT <Các thuộc tính>
 Phép kết   --> FROM   R1 [INNER] JOIN R2 ON  <DK kết>
 Phép chọn  --> WHERE  [<DK Chon>]
 */
/*Các câu truy vấn đơn giản*/
USE QLNV
/*Câu 1: Tìm những nhân viên làm việc ở phòng 'NC'*/

select	MANV,HONV,TENLOT,TENNV, PHONG
from	NHANVIEN
where	PHONG='NC'
GO

select	MANV 'MÃ NHÂN VIÊN',HONV AS 'HỌ',TENLOT AS 'TÊN LÓT',TENNV AS 'TÊN'
from	NHANVIEN
where	PHONG='NC'
go

select	MANV 'MÃ NHÂN VIÊN',HONV+' '+TENLOT+' '+TENNV 'HỌ TÊN'
from	NHANVIEN
where	PHONG='NC'
go
-- CHO BIẾT MANV, HOTEN, MLUONG VÀ THUE=0.1*MLUONG CỦA NỮ NHÂN VIÊN
select	MANV,HONV+' '+TENLOT+' '+TENNV AS 'HỌ TÊN',MLUONG,MLUONG*0.1 'THUẾ'
from	NHANVIEN
where	PHAI='NU'
go
-- CHO BIẾT CÁC MLUONG CỦA DOANH NGHIỆP
select MLUONG
from   NHANVIEN
go
select DISTINCT	MLUONG
from	NHANVIEN
go
/*Câu 2: Tìm những nhân viên có mức lương trên 2000000*/

select	MANV,HONV,TENLOT,TENNV,PHAI,MLUONG
from	NHANVIEN
where	MLUONG>2000000
go
--phép kết
/*Câu 3: Tìm họ tên nhân viên và tên phòng ban nhân viên đó trực thuộc có mức lương từ 2000000 đến 3000000*/
--[2000000,3000000]
select	HONV,TENLOT,TENNV,TENPHG,MLUONG
from	NHANVIEN,PHONGBAN
where	PHONG=MAPHG and MLUONG between 2000000 and 3000000
go
select	HONV,TENLOT,TENNV,TENPHG,MLUONG
from	NHANVIEN,PHONGBAN
where	PHONG=MAPHG and (MLUONG>=2000000 and MLUONG<=3000000)
go
-- Tìm họ tên nhân viên và tên phòng ban nhân viên đó trực thuộc có mức lương BÉ HƠN 2000000 VÀ LỚN HƠN 2500000
select	HONV,TENLOT,TENNV,TENPHG,MLUONG
from	NHANVIEN,PHONGBAN
where	PHONG=MAPHG and MLUONG not between 2000000 and 2500000
go

select	HONV,TENLOT,TENNV,TENPHG,MLUONG
from	NHANVIEN,PHONGBAN
where	PHONG=MAPHG and (MLUONG<2000000 or MLUONG>2500000)
go

select	HONV,TENLOT,TENNV,TENPHG,MLUONG
from	NHANVIEN JOIN PHONGBAN ON PHONG=MAPHG
where	MLUONG not between 2000000 and 2500000
go
/*TÌM NHÂN VIÊN (MANV, HOTEN, PHAI, MLUONG) CỦA 
PHÒNG NGHIÊN CỨU, CÓ MLUONG TRONG KHOẢNG 2TR - 3TR*/
SELECT MANV, HONV+' '+TENLOT+' '+TENNV AS HOTEN, PHAI, MLUONG
FROM NHANVIEN, PHONGBAN
WHERE PHONG=MAPHG
AND TENPHG='NGHIEN CUU'
AND MLUONG BETWEEN 2000000 AND 3000000
GO
--NGAY THANG
SELECT MANV, TENNV, NGSINH 
FROM NHANVIEN
WHERE NGSINH BETWEEN '1955-12-08' AND '1966-07-19'
go
SELECT MANV, TENNV, MONTH(NGSINH) THÁNG 
FROM NHANVIEN
WHERE MONTH(NGSINH)=7

--NULL/NOT NULL
SELECT MANV, TENNV, MA_NQL
FROM NHANVIEN
WHERE MA_NQL IS NULL
go
SELECT MANV, TENNV, MA_NQL
FROM NHANVIEN
WHERE MA_NQL IS NOT NULL
go
/*Câu 4: Cho biết họ tên đầy đủ của các nhân viên ở 'TP HCM'*/

select	HONV,TENLOT,TENNV,DCHI
from	NHANVIEN
where	DCHI like '%TP HCM%'
go

select	HONV,TENLOT,TENNV,DCHI
from	NHANVIEN
where	DCHI='TP HCM'
go
/*Câu 5: Cho biết ngày sinh và địa chỉ của nhân viên 'Dinh Ba Tien'*/

select	HONV,TENLOT,TENNV,NGSINH,DCHI
from	NHANVIEN
where	HONV='Dinh' and TENLOT='Ba' and TENNV='Tien'
go

/*Câu 6: Danh sách tất cả các nhân viên nữ trên 30 tuổi, sắp xếp tuổi tăng (giảm) dần*/

select	*
from	NHANVIEN
where	PHAI='Nu' and (year(getdate())-year(NGSINH))>50
order by (year(getdate())-year(NGSINH)) DESC
go

select	MANV, TENNV, (year(getdate())-year(NGSINH)) AS TUOI
from	NHANVIEN
where	PHAI='Nu' and (year(getdate())-year(NGSINH))>40
order by TUOI DESC
go

/*Câu 7: Lập danh sách các nhân viên (MANV,TENNV) và thân nhân (TENTN, TUOI) 
có tuổi TRÊN 40 ,  sắp xếp tuổi thân nhân tăng (giảm) dần*/
select	NV.MANV,TENNV,TENTN, YEAR(GETDATE())-YEAR(TN.NGSINH) 'TUỔI'
from	NHANVIEN NV, THANNHAN TN
where	NV.MANV=TN.MANV AND YEAR(GETDATE())-YEAR(TN.NGSINH)>40
order by TUỔI DESC
go

/*Câu 8: Tìm tên những người trưởng phòng của từng phòng ban (TENPHG)*/

select	HONV+' '+TENLOT+' '+TENNV AS 'TÊN TRƯỞNG PHÒNG', TENPHG
from	NHANVIEN,PHONGBAN
where	MANV=TRPHG
go

select	HONV+' '+TENLOT+' '+TENNV AS TENTRGPHG, TENPHG
from	NHANVIEN,PHONGBAN
where	MANV=TRPHG
go

/*Câu 9: Tìm tên và địa chỉ của tất cả các nhân viên của phòng 'Nghien cuu'*/

select	HONV,TENLOT,TENNV,TENPHG,DCHI
from	NHANVIEN,PHONGBAN
where	PHONG=MAPHG and TENPHG='Nghien cuu'
go
select	*
from	NHANVIEN,PHONGBAN
where	PHONG=MAPHG and TENPHG='Nghien cuu'
go
/*Câu 10: Tìm tên những nữ nhân viên và tên người thân của họ*/

select	HONV,TENLOT,TENNV,TENTN
from	NHANVIEN,THANNHAN
where	NHANVIEN.MANV=THANNHAN.MANV and NHANVIEN.PHAI='Nu'
go

select	HONV,TENLOT,TENNV,TENTN
from	NHANVIEN NV,THANNHAN TN
where	NV.MANV=TN.MANV and NV.PHAI='Nu'
go
/*Câu 11: Tìm mã số và tên những nhân viên thuộc phòng 'Nghien cuu'
tham gia đề án 'Tin Hoc Hoa'  với thời gian làm việc 20 giờ/tuần*/

SELECT NV.MANV,HONV,TENLOT,TENNV,TENPHG,TENDA,THOIGIAN
FROM NHANVIEN NV, PHONGBAN PB, DEAN DA, PHANCONG PC
WHERE   NV.PHONG=PB.MAPHG 
	AND PB.MAPHG=DA.MAPHG
	AND DA.MADA=PC.MADA
	AND TENPHG='NGHIEN CUU'
	AND TENDA LIKE '%TIN HOC HOA%'
	AND THOIGIAN=20
GO

select	NV.MANV,HONV,TENLOT,TENNV,TENPHG,TENDA,THOIGIAN
from	NHANVIEN NV,PHONGBAN PB,DEAN DA,PHANCONG PC
where	NV.PHONG=PB.MAPHG and NV.MANV=PC.MANV and PC.MADA=DA.MADA
		and TENPHG='Nghien cuu' and TENDA not like 'Tin hoc hoa %'
		and THOIGIAN>20
go
/*Câu 12: Với mọi đề án ở 'Ha Noi', liệt kê các mã số đề án,
mã số phòng ban chủ trì đề án, họ tên trưởng phòng cũng như
địa chỉ và ngày sinh của người ấy*/

select	MADA,DA.MAPHG,HONV,TENLOT,TENNV,NGSINH,DCHI
from	DEAN DA,PHONGBAN PB,NHANVIEN NV
where	DA.MAPHG=PHONG and TRPHG=NV.MANV and DDIEM_DA='Ha Noi'
go
/*Câu 13: Với mỗi nhân viên, cho biết họ tên nhân viên và họ tên
người quản lí trực tiếp của nhân viên đó*/

select	NV1.HONV+' '+NV1.TENLOT+' '+NV1.TENNV as "Tên NV",
		NV2.HONV+' '+NV2.TENLOT+' '+NV2.TENNV as "Tên NQL"
from	NHANVIEN NV1, NHANVIEN NV2
where	NV1.MA_NQL=NV2.MANV
go
/*Câu 14: Với mỗi nhân viên, cho biết họ tên nhân viên và họ tên
trưởng phòng của phòng ban mà nhân viên đó làm việc*/
select	NV1.HONV+' '+NV1.TENLOT+' '+NV1.TENNV as "Tên NV",TENPHG as "Phòng",
		NV2.HONV+' '+NV2.TENLOT+' '+NV2.TENNV as "Trưởng phòng"
from	NHANVIEN NV1, PHONGBAN PB, NHANVIEN NV2
where	NV1.PHONG=PB.MAPHG and PB.TRPHG=NV2.MANV
go

/*Câu 15: Cho biết họ tên nhân viên và tên các đề án 
mà nhân viên ấy tham gia, nếu có*/
select	HONV,TENLOT,TENNV,TENDA
from	(DEAN DA join PHANCONG PC on DA.MADA=PC.MADA) RIGHT join NHANVIEN NV 
		on NV.MANV=PC.MANV
go
select	HONV,TENLOT,TENNV,TENDA
from	NHANVIEN NV join
		(DEAN DA join PHANCONG PC on DA.MADA=PC.MADA)
		on NV.MANV=PC.MANV
go


/*PHÉP TOÁN TẬP HỢP
SELECT <ds cột> FROM <ds bảng> WHERE <điều kiện>
UNION [ALL]/INTERSECT [ALL]/EXCEPT [ALL]
SELECT <ds cột> FROM <ds bảng> WHERE <điều kiện>
*/

/*Câu 23: Cho biết danh sách các đề án có nhân công với họ là 'Dinh'
hoặc có người trưởng phòng chủ trì đề án với họ là 'Dinh'*/

select	MADA
from	NHANVIEN NV,PHANCONG PC
where	NV.MANV=PC.MANV and HONV='Dinh'
INTERSECT
select	MADA
from	DEAN DA,PHONGBAN PB,NHANVIEN NV
where	DA.PHONG=MAPHG and TRPHG=MANV and HONV='NGUYEN'
go

--TIM HO TEN NHAN VIEN KHONG THAM GIA DE AN NAO

select	MANV, TENNV
from	NHANVIEN 
EXCEPT
select	NV.MANV, TENNV
from	NHANVIEN NV, PHANCONG PC
where	NV.MANV=PC.MANV
go

SELECT MANV, TENNV, PHAI, NGSINH, TENPHG
FROM   NHANVIEN NV, PHONGBAN PB
WHERE  PHONG=MAPHG AND MANV NOT IN
				(SELECT NV.MANV
				 FROM NHANVIEN NV, PHANCONG PC
				 WHERE NV.MANV=PC.MANV)
GO

SELECT MANV, TENNV, PHAI, NGSINH
FROM   NHANVIEN NV1
WHERE  NOT EXISTS
				(SELECT *
				 FROM NHANVIEN NV2, PHANCONG PC
				 WHERE NV2.MANV=PC.MANV AND NV1.MANV=NV2.MANV)
GO
/*Câu truy vấn lồng Ở WHERE
SELECT <danh sách các cột>
FROM <danh sách các bảng>
WHERE <so sánh tập hợp> (
	SELECT <danh sách các cột>
	FROM <danh sách các bảng>
	WHERE <điều kiện>)
Mệnh đề WHERE của câu truy vấn cha
	<biểu thức> <so sánh tập hợp> <truy vấn con>
	So sánh tập hợp thường đi cùng với một số toán tử
		IN, NOT IN
		ALL
		ANY hoặc SOME
	Kiểm tra sự tồn tại
		EXISTS
		NOT EXISTS

-- Cho biết các nhân viên cùng phòng với nhân viên “Nguyen Thanh Tung”*/

SELECT MANV, HONV, TENLOT, TENNV, PHONG
FROM NHANVIEN
WHERE PHONG IN (SELECT PHONG
   FROM NHANVIEN
   WHERE HONV='NGUYEN' AND TENLOT='THANH' AND TENNV= 'TUNG')
GO

SELECT MANV, HONV, TENLOT, TENNV
FROM NHANVIEN NV1
WHERE EXISTS (SELECT *
   FROM NHANVIEN NV2
   WHERE HONV='NGUYEN' AND TENLOT='THANH' AND TENNV= 'TUNG' AND NV1.PHONG=NV2.PHONG)
GO

/*Câu 25: Danh sách những nhân viên không có thân nhân nào*/

select	HONV,TENLOT,TENNV
from	NHANVIEN
where	MANV not in
		(select	MANV
		from	THANNHAN)
go
select	HONV,TENLOT,TENNV, TENPHG
from	NHANVIEN NV, PHONGBAN PB
where	NV.PHONG=PB.MAPHG AND NOT exists
		(select	*
		from	THANNHAN TN
		where NV.MANV=TN.MANV)
go
select	HONV,TENLOT,TENNV
from	NHANVIEN
where	MANV <> ALL
		(select	MANV
		from	THANNHAN)
go
--c2
select	HONV,TENLOT,TENNV
from	NHANVIEN NV
where	not exists
		(select	*
		from	THANNHAN TN
		where NV.MANV=TN.MANV)
go


/*Câu 26: Danh sách những trưởng phòng có tối thiểu một thân nhân*/

select	HONV,TENLOT,TENNV
from	NHANVIEN,PHONGBAN
where	MANV=TRPHG and MANV in
		(select	MANV
		from	THANNHAN)
go
--C2
select	HONV,TENLOT,TENNV
from	NHANVIEN,PHONGBAN
where	MANV=TRPHG and EXISTS
		(select	*
		from	THANNHAN
		where NHANVIEN.MANV=THANNHAN.MANV)
go
/*Cho biết họ tên nhân viên (HONV, TENLOT, TENNV) có mức lương lớn hơn mức lương 
của một nhân viên nào đó của phòng “Nghiên cứu”*/

SELECT HONV, TENLOT, TENNV, MLUONG,PHONG
FROM NHANVIEN
WHERE MLUONG > ANY ( SELECT MLUONG
   FROM NHANVIEN NV, PHONGBAN PB
   WHERE NV.PHONG=PB.MAPHG AND PB.TENPHG='NGHIEN CUU')
/*Câu 27: Tìm họ của những trưởng phòng chưa có gia đình*/

select	HONV
from	NHANVIEN,PHONGBAN
where	MANV=TRPHG and MANV not in
		(select	MANV
		from	THANNHAN
		where	QUANHE='Vo chong')
go
-- CHO BIẾT NHÂN VIÊN CÓ LƯƠNG CAO NHẤT
SELECT MANV, TENNV, MLUONG
FROM NHANVIEN
WHERE MLUONG >=ALL (SELECT MLUONG FROM NHANVIEN)
GO

GO
/*Câu 28: Cho biết họ tên nhân viên có mức lương trên mức lương
trung bình của phòng 'Nghien cuu'*/






/*LẤY SELECT TOP*/
 select top 3 HONV, TENLOT, TENNV, MLUONG
 from NHANVIEN
 order by MLUONG DESC
 go



/*SỬ DỤNG CASE: Cho phép kiểm tra điều kiện và xuất thông tin theo từng 
trường hợp
   Hàm Simple CASE: so sánh một biểu thức với một bộ các biểu thức đơn 
   giản để xác định kết quả.
	CASE bieuthuc_dauvao
		WHEN bieuthuc_1 THEN ketqua_1
		WHEN bieuthuc_2 THEN ketqua_2
		...
		WHEN bieuthuc_n THEN ketqua_n
		[ELSE ketqua_khac]
	END
   Hàm Searched CASE: đánh giá một bộ các biểu thức Boolean để xác định 
   kết quả.
	CASE
		WHEN dieukien_1 THEN ketqua_1
		WHEN dieukien_2 THEN ketqua_2
		...
		WHEN dieukien_n THEN ketqua_n
		[ELSE ketqua_khac]
	END */
/*Cho biết họ tên các nhân viên đã đến tuổi về hưu (nam 60 tuổi, nữ 55 tuổi)*/
SELECT HONV, TENLOT, TENNV, phai, YEAR(GETDATE())-YEAR(NGSINH) TUOI
FROM NHANVIEN
WHERE YEAR(GETDATE())-YEAR(NGSINH) >= 
					( CASE PHAI
					WHEN 'Nam' THEN 60
					WHEN 'Nu' THEN 55
					END )
GO

/*Cho biết họ tên các nhân viên và năm về hưu*/
SELECT HONV, TENLOT, TENNV,
(CASE PHAI  
	WHEN 'Nam' THEN  YEAR(NGSINH) + 60
	WHEN 'Nu' THEN YEAR(NGSINH) + 55
	END ) AS NAMVEHUU
FROM NHANVIEN


SELECT HONV, TENLOT, TENNV,
(CASE PHAI  
	WHEN 'Nam' THEN  1
	WHEN 'Nu' THEN 0
	END ) AS phai
FROM NHANVIEN


UPDATE NHANVIEN
Set MLUONG=
Case 
    when MLUONG=1800000 then 1900000
	when MLUONG=2200000 then 2300000
	ELSE 4000000
end

UPDATE DEAN
Set TENDA=
Case 
    when MADA like '%TH%1' then N'Tin học hóa 1'
	when MADA like '%TH%2' then N'Tin học hóa 2'
	when MADA like '%DT%1' then N'Đào tạo 1'
	when MADA like '%DT%2' then N'Đào tạo 2'
end
SELECT *
FROM NHANVIEN

SELECT HONV, TENLOT, TENNV, MLUONG,
(CASE   
	WHEN MLUONG < 2000000 THEN  MLUONG*0
	WHEN MLUONG between 2000000 and 2500000 THEN  MLUONG*0.1
	ELSE MLUONG*0.15
	END ) AS THUẾ
FROM NHANVIEN					


--Thêm bảng: 
VD: ALTER TABLE HOCPHAN ALTER COLUMN MAHP VARCHAR(15)
--Thêm khóa ngoại: 
VD: ALTER TABLE SINHVIEN1 ADD CONSTRAINT FK_SINHVIEN1_KHOA FOREIGN KEY(MAKHOA) REFERENCES KHOA1(MAKHOA)
--Xóa khóa ngoại:
ALTER TABLE NHANVIEN DROP CONSTRAINT FK_NHANVIEN_NHANVIEN
--Cập nhật dữ liệu:
UPDATE NHANVIEN SET MA_NQL='001' WHERE MANV='002'

SELECT HONV, TENLOT, TENNV,
(CASE PHAI  
	WHEN 'Nam' THEN  YEAR(NGSINH) + 60
	WHEN 'Nu' THEN YEAR(NGSINH) + 55
	END ) AS NAMVEHUU
FROM NHANVIEN

ALTER TABLE HOCPHAN drop COLUMN NAMHOC
ALTER TABLE HOCPHAN ADD NAMHOC INT
ALTER TABLE HOCPHAN 
Thêm bảng: 
VD: ALTER TABLE HOCPHAN ALTER COLUMN MAHP VARCHAR(15)
→ Tổng quát: ALTER TABLE “TÊN BẢNG” ALTER COLUMN TÊN CỘT VARCHAR (...)
Xóa bảng alter table hocphan drop column mahp varchar (15)


Thêm khóa ngoại: 
VD: ALTER TABLE SINHVIEN1 ADD CONSTRAINT FK_SINHVIEN1_KHOA FOREIGN KEY(MAKHOA) REFERENCES KHOA1(MAKHOA)
Xóa khóa ngoại:
ALTER TABLE NHANVIEN DROP CONSTRAINT FK_NHANVIEN_NHANVIEN
-Cập nhật dữ liệu:
UPDATE NHANVIEN SET MA_NQL='001' WHERE MANV='002'


--2.3 GOM NHÓM--
--CÂU 18: Với mỗi đề án, liệt kê tên đề án (TENDA) và tổng số giờ làm việc một tuần của tất cả các nhân viên tham dự đề án đó--
SELECT DA.TENDA,SUM(THOIGIAN) 'số giờ làm việc'
FROM DEAN DA,PHANCONG PC
where DA.MADA=PC.MADA
group by DA.TENDA
--Câu 19: Với mỗi nhân viên, liệt kê họ và tên nhân viên và nhân viên đó có bao nhiêu thân nhân--
select HONV +' ' + TENNV AS 'HỌ VÀ TÊN NHÂN VIÊN',COUNT(MATN) AS'SỐ LƯỢNG THÂN NHÂN'
from NHANVIEN,THANNHAN 
where NHANVIEN.MANV=THANNHAN.MANV
GROUP BY HONV,TENNV

--Cách 2:

select HONV+' '+TENNV as 'Họ Và Tên',count(*) as 'Số lượng thân nhân'
from NHANVIEN,THANNHAN
where NHANVIEN.MANV = THANNHAN.MANV
group by HONV,TENNV

--Câu 20:Với mỗi phòng ban, liệt kê tên phòng ban (TENPHG) và lương trung bình của những nhân viên làm việc cho phòng ban đó--
SELECT MANV, TENPHG,AVG(MLUONG) AS 'LƯƠNG TRUNG BÌNH'
from NHANVIEN nv,PHONGBAN pb
WHERE nv.PHONG=pb.MAPHG
group by MANV, TENPHG

--Câu 21:Cho biết lương trung bình của tất cả các nữ nhân viên--
select MANV,PHAI,AVG(MLUONG) AS 'MỨC LƯƠNG TRUNG BÌNH'
FROM NHANVIEN NV
WHERE PHAI LIKE N'NỮ'
GROUP BY MANV, PHAI

--Câu 22:Với các phòng ban có mức lương trung bình trên 30,000, liệt kê tên phòng ban và số lượng nhân viên của phòng ban đó--
select PB.TENPHG,COUNT(manv) as 'SỐ LƯỢNG NHÂN VIÊN'
from NHANVIEN NV, PHONGBAN PB
GROUP BY PB.TENPHG
HAVING AVG(MLUONG)>30000
--2.4.CÂU TRUY VẤN LỒNG--
--23.Liệt kê danh sách các đề án (MADA) có: nhân công với họ (HONV) là ‘Dinh’ hoặc có người trưởng phòng chủ trì đề án với họ (HONV) là ‘Dinh’--
--Câu 24:Liệt kê danh sách những nhân viên (HONV, TENLOT, TENNV) có trên 2 thân nhân--
SELECT NV.MANV,NV.HONV,NV.TENLOT,NV.TENNV,COUNT(MATN) AS SO_TN
FROM NHANVIEN NV,THANNHAN TN
WHERE NV.MANV =TN.MANV
GROUP BY NV.MANV,NV.HONV,NV.TENLOT,NV.TENNV 
HAVING COUNT(MATN) >2
--CÂU 25:Liệt kê danh sách những nhân viên (HONV, TENLOT, TENNV) không có thân nhân nào--
SELECT (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' '+ NHANVIEN.TENNV) AS 'Họ tên nhân viên không có thân nhân'
FROM NHANVIEN
WHERE NHANVIEN.MANV NOT IN (SELECT THANNHAN.MANV
							FROM NHANVIEN, THANNHAN
							WHERE NHANVIEN.MANV = THANNHAN.MANV)
--CÂU 26:Liệt kê danh sách những trưởng phòng (HONV, TENLOT, TENNV) có tối thiểu một thân nhân--
SELECT (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' '+ NHANVIEN.TENNV) AS 'Họ tên trưởng phòng có ít nhất 1 thân nhân'
FROM NHANVIEN, PHONGBAN
WHERE NHANVIEN.MANV = PHONGBAN.TRPHG AND
		PHONGBAN.TRPHG IN (SELECT THANNHAN.MANV
							FROM NHANVIEN, THANNHAN
							WHERE NHANVIEN.MANV = THANNHAN.MANV
							 )
--CÂU 27:Liệt kê họ tên của những trưởng phòng chưa có gia đình--
	SELECT NHANVIEN.HONV
	FROM NHANVIEN, PHONGBAN
	WHERE NHANVIEN.MANV = PHONGBAN.TRPHG AND
		  PHONGBAN.TRPHG NOT IN (SELECT PHONGBAN.TRPHG
								 FROM PHONGBAN, THANNHAN
								 WHERE PHONGBAN.TRPHG = THANNHAN.MANV AND
									  THANNHAN.QUANHE = N'Vợ chồng'
								 )
--CÂU 28:Liệt kê họ tên nhân viên (HONV, TENLOT, TENNV) có mức lương trên mức lương trung bình của phòng "Nghien cuu"--
	SELECT (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' ' + NHANVIEN.TENNV) AS 'Họ tên nhân viên có lương trung bình trên mức lương trung bình của phòng "Nghiên cứu"'
	FROM NHANVIEN
	WHERE NHANVIEN.MLUONG > (SELECT AVG(NHANVIEN.MLUONG)
							FROM NHANVIEN, PHONGBAN
							WHERE NHANVIEN.PHONG = PHONGBAN.MAPHG AND
								  PHONGBAN.TENPHG = N'Nghiên cứu')
--CÂU 29: Liệt kê tên phòng ban và họ tên trưởng phòng của phòng ban có đông nhânviên nhất--
	SELECT PHONGBAN.TENPHG, (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' ' + NHANVIEN.TENNV) AS 'Họ tên trưởng phòng của phòng ban đông nhân viên nhất'
	FROM NHANVIEN, PHONGBAN
	WHERE NHANVIEN.MANV = PHONGBAN.TRPHG AND
		  PHONGBAN.MAPHG = (SELECT TOP 1 PHONGBAN.MAPHG
							FROM NHANVIEN, PHONGBAN
							WHERE NHANVIEN.PHONG = PHONGBAN.MAPHG
							GROUP BY PHONGBAN.MAPHG
							ORDER BY COUNT (NHANVIEN.PHONG) DESC
							)
--CÂU 30:Liệt kê họ tên (HONV, TENLOT, TENNV) và địa chỉ (DCHI) của những nhân viên làm việc cho một đề án ở ‘TP HCM’ nhưng phòng ban mà họ trực thuộc lại không tọa lạc ở thành phố ‘TP HCM’--
	SELECT DISTINCT (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' ' + NHANVIEN.TENNV) AS 'Họ tên nhân viên', NHANVIEN.DCHI
	FROM NHANVIEN, DEAN, DIADIEM_PHG
	WHERE NHANVIEN.PHONG = DEAN.MAPHG AND
		  NHANVIEN.PHONG = DIADIEM_PHG.MAPHG AND
		  DEAN.DDIEM_DA LIKE '%HCM' AND
		  DIADIEM_PHG.DIADIEM NOT LIKE '%HCM'
--Câu 31:(dạng tổng quát của câu 30) Liệt kê họ tên và địa chỉ của các nhân viên làm việc cho một đề án ở một thành phố nhưng phòng ban mà họ trực thuộc lại không toạ lạc ở thành phố đó
	SELECT DISTINCT (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' ' + NHANVIEN.TENNV) AS 'Họ tên nhân viên', NHANVIEN.DCHI
	FROM NHANVIEN, DEAN, DIADIEM_PHG
	WHERE NHANVIEN.PHONG = DEAN.MAPHG AND
		  NHANVIEN.PHONG = DIADIEM_PHG.MAPHG AND
		  DEAN.DDIEM_DA IN (SELECT DEAN.DDIEM_DA
							FROM DEAN
							) AND
		  DIADIEM_PHG.DIADIEM NOT LIKE DEAN.DDIEM_DA

