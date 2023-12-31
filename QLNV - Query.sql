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

