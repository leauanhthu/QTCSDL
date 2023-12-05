﻿--TÌM NHỮNG NHÂN VIÊN NỮ SỐNG TẠI TPHCM
SELECT HONV,TENLOT,TENNV,PHAI,DCHI
FROM NHANVIEN
WHERE DCHI LIKE N'%TpHCM' AND PHAI=N'Nữ'
--TÌM NHỮNG NHÂN VIÊN CÓ MỨC LƯƠNG >2.000.000 VÀ <3.000.000
SELECT MANV,TENNV,MLUONG
FROM NHANVIEN
WHERE (MLUONG BETWEEN 2000000 AND 3000000) 
--TÌM NHỮNG NHÂN VIÊN CÓ THÁNG SINH TỪ THÁNG 7 ĐẾN THÁNG 12
SELECT MANV,TENNV,month(NGSINH) tháng
FROM NHANVIEN
WHERE MONTH(NGSINH) BETWEEN 7 AND 12
order by tháng desc
--sắp xếp
--tìm những nhân viên có tuổi từ 20-40 sắp xếp tuổi giảm dần
SELECT MANV,TENNV,YEAR(GETDATE())-YEAR(NGSINH) TUỔI
FROM NHANVIEN
where YEAR(GETDATE())-YEAR(NGSINH) BETWEEN 40 AND 60
ORDER BY TUỔI DESC

--PHÉP KẾT--
--NHÂN VIÊN TRONG PHÒNG NGHIÊN CỨU LÀ LẤY FROM 2 CÁI
--AMBIOUS LÀ NHẬP NHẰNG DỮ LIỆU NÊN MÌNH PHẢI GHI K.MAKHOA=SV.MAKHOA
--KẾT BẰNG BẰNG KHÓA NGOẠI
--TÌM NHÂN VIÊN CỦA PHÒNG NGHIÊN CỨU
SELECT MANV,HONV +' ' + TENLOT +' ' + TENNV +' ' 'TÊN NHÂN VIÊN',TENPHG
FROM NHANVIEN,PHONGBAN
WHERE TENPHG='Nghiên Cứu' AND PHONG=MAPHG

--TÌM NHÂN VIÊN LÀM VIỆC TẠI TP HCM
SELECT NV.MANV,TENNV,PB.MAPHG,DIADIEM
FROM NHANVIEN NV,DIADIEM_PHG DA,PHONGBAN PB
WHERE PB.MAPHG=NV.PHONG AND DIADIEM LIKE N'%TPHCM' AND PB.MAPHG=DA.MAPHG

--nhập địa điểm dùng like--
--cách 2:
SELECT NV.MANV,TENNV,PB.MAPHG,DIADIEM
FROM NHANVIEN NV JOIN PHONGBAN PB ON PB.MAPHG=NV.PHONG JOIN DIADIEM_PHG DA ON PB.MAPHG=DA.MAPHG
WHERE DIADIEM LIKE N'%TPHCM'
select*from nhanvien
select*from phongban
--CÂU 2:TÌM NHÂN VIÊN THAM GIA ĐỀ ÁN 'DAO TAO 1' HOAC 'DAO TAO 2'
SELECT NV.MANV,TENNV,TENDA,PC.MADA
FROM NHANVIEN NV,DEAN DA,PHANCONG PC
WHERE (TENDA=N'Đào tạo 1' OR TENDA=N'Đào tạo 2') AND DA.MADA=PC.MADA and PC.MANV=NV.MANV

--UNION LÀ CỘNG--
--INTERSECT LÀ LẤY PHẦN GIAO--
SELECT NV.MANV,TENNV,TENDA,PC.MADA
FROM NHANVIEN NV,DEAN DA,PHANCONG PC
WHERE DA.MADA=PC.MADA and PC.MANV=NV.MANV AND
      (TENDA LIKE '%Đào tạo 1%')
UNION
SELECT NV.MANV,TENNV,TENDA,PC.MADA
FROM NHANVIEN NV,DEAN DA,PHANCONG PC
WHERE DA.MADA=PC.MADA and PC.MANV=NV.MANV AND
      (TENDA LIKE '%Đào tạo 2%')

--TÌM NHÂN VIÊN KHÔNG THAM GIA ĐỀ ÁN 'DAO TAO 2'
SELECT NV.MANV,TENNV,TENDA,PC.MADA
FROM NHANVIEN NV,DEAN DA,PHANCONG PC
WHERE DA.MADA=PC.MADA and PC.MANV=NV.MANV
EXCEPT
SELECT NV.MANV,TENNV,TENDA,PC.MADA
FROM NHANVIEN NV,DEAN DA,PHANCONG PC
WHERE DA.MADA=PC.MADA and PC.MANV=NV.MANV AND 
     (TENDA LIKE N'%Đào tạo 2%')
--CÁCH 2:
SELECT NV.MANV,TENNV
FROM NHANVIEN NV
EXCEPT
SELECT NV.MANV,TENNV
FROM NHANVIEN NV,DEAN DA,PHANCONG PC
WHERE DA.MADA=PC.MADA and PC.MANV=NV.MANV AND 
     (TENDA LIKE N'%Đào tạo 2%')
--CÁCH 3: TRUY VẤN LỒNG
SELECT NV.MANV
FROM NHANVIEN NV,DEAN DA,PHANCONG PC
WHERE NV.MANV NOT IN
					(SELECT NV.MANV
					FROM NHANVIEN NV,DEAN DA,PHANCONG PC
					WHERE DA.MADA=PC.MADA and PC.MANV=NV.MANV AND TENDA LIKE N'%Đào tạo 2%')
SELECT NV1.MANV,TENNV
FROM NHANVIEN NV1
WHERE NOT EXISTS
					(SELECT*
					FROM NHANVIEN NV,DEAN DA,PHANCONG PC
					WHERE DA.MADA=PC.MADA and PC.MANV=NV.MANV AND NV1.MANV=NV.MANV AND TENDA LIKE N'%Đào tạo 1%')

--TÌM NHỮNG NHÂN CÓ MLUONG LỚN HƠN BÁT KÌ NHÂN VIÊN PHÒNG NGHIÊN CỨU--
SELECT MANV,TENNV,MLUONG
FROM NHANVIEN NV
WHERE MLUONG> ANY
				(SELECT MLUONG
				FROM NHANVIEN,PHONGBAN PB
				WHERE PHONG=MAPHG AND TENPHG=N'Nghiên Cứu')


SELECT MANV,TENNV,MLUONG
FROM NHANVIEN NV
WHERE MLUONG>= ALL
				(SELECT MLUONG
				FROM NHANVIEN,PHONGBAN PB
				WHERE PHONG=MAPHG AND TENPHG=N'Nghiên Cứu')

SELECT MANV,TENNV,MLUONG
FROM NHANVIEN NV,PHONGBAN PB
WHERE PHONG=MAPHG AND TENPHG=N'Nghiên Cứu'
and MLUONG>=all
				(SELECT MLUONG
				FROM NHANVIEN,PHONGBAN PB
				WHERE PHONG=MAPHG AND TENPHG=N'Nghiên Cứu')
