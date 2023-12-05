select*
from SINHVIEN1 sv join kqua kq on sv.masv=kq.masv

select sv.masv,tensv,avg(diem) 'điểm trung bình', sum(diem) 'tổng'
from SINHVIEN1 sv join kqua kq on sv.masv=kq.MASV
group by sv.masv, TENSV

--select có bao nhiêu thì group có bấy nhiêu thuộc tính--

--TÌM SV CÓ ĐIỂM TRUNG BÌNH >=9
select sv.masv,tensv,avg(diem) 'điểm trung bình'
from SINHVIEN1 sv join kqua kq on sv.masv=kq.MASV
GROUP BY SV.MASV,TENSV
HAVING AVG(DIEM)>=9

--HÀM LỒNG HÀM MAX(AVG(DIEM))
 SELECT SV.MASV,TENSV,AVG(DIEM) N'DIEM TRUNG BINH'
 FROM SINHVIEN1 SV JOIN KQUA KQ ON SV.MASV=KQ.MASV
 GROUP BY SV.MASV,TENSV
 HAVING AVG(DIEM)>=ALL
				(SELECT AVG(DIEM)
				FROM KQUA
				GROUP BY MASV)

--CHO BIẾT ĐIỂM TRUNG BÌNH CỦA MỖI SINH VIÊN--
select sv.masv,tensv,avg(diem) 'điểm trung bình'
from SINHVIEN1 sv join kqua kq on sv.masv=kq.MASV
group by sv.masv, TENSV

--CHO BIẾT ĐIỂM TRUNG BÌNH CỦA MỖI SINH VIÊN KHOA THỐNG KÊ TIN HỌC--
select sv.masv,tensv,avg(diem) 'điểm trung bình'
from SINHVIEN1 sv join kqua kq on sv.masv=kq.MASV JOIN KHOA1 K ON SV.MAKHOA=K.MAKHOA AND TENKHOA=N'Thống kê tin học'
group by sv.masv, TENSV

--CHO BIẾT SỐ LƯỢNG SINH VIÊN CỦA MỖI KHOA--
select SV.MAKHOA,TENKHOA,COUNT(MASV) 'Số lượng'
from SINHVIEN1 sv join  KHOA1 K ON SV.MAKHOA=K.MAKHOA 
group by SV.MAKHOA,TENKHOA

--TÌM NHỮNG SINH VIÊN CÓ ĐIỂM TRUNG BÌNH >=7
select sv.masv,tensv,avg(diem) 'điểm trung bình'
from SINHVIEN1 sv join kqua kq on sv.masv=kq.MASV
GROUP BY SV.MASV,TENSV
HAVING AVG(DIEM)>=7

--CHO BIẾT SINH VIÊN CÓ ĐIỂM TRUNG BÌNH CAO NHẤT--
 SELECT SV.MASV,TENSV,AVG(DIEM) N'DIEM TRUNG BINH'
 FROM SINHVIEN1 SV JOIN KQUA KQ ON SV.MASV=KQ.MASV
 GROUP BY SV.MASV,TENSV
 HAVING AVG(DIEM)>=ALL
				(SELECT AVG(DIEM)
				FROM KQUA
				GROUP BY MASV)

--TUẦN 16 THI LẠI
--TUẦN SAU THI LẠI--

SELECT TOP 1 SV.MASV,TENSV,AVG(DIEM) N'DIEM TRUNG BINH'
FROM SINHVIEN1 SV JOIN KQUA KQ ON SV.MASV=KQ.MASV
 GROUP BY SV.MASV,TENSV
 ORDER BY AVG(DIEM) DESC

 --TÌM KHOA CÓ SỐ LƯỢNG SINH VIÊN NHIỀU NHẤT--
select SV.MAKHOA,TENKHOA,COUNT(MASV) 'Số lượng'
from SINHVIEN1 sv join  KHOA1 K ON SV.MAKHOA=K.MAKHOA 
group by SV.MAKHOA,TENKHOA
HAVING COUNT(MASV)>=ALL
				(SELECT COUNT(MASV)
				FROM SINHVIEN1
				GROUP BY MAKHOA)
--TÌM SINH VIÊN ĐÃ HỌC TẤT CẢ CÁC MÔN DO KHOA THỐNG KÊ TIN HỌC QUẢN LÝ--
select SV.MASV,TENSV,COUNT(MH.MAMH) 'Số lượng'
FROM SINHVIEN1 SV,KQUA KQ, KHOA1 K,MONHOC MH, HOCPHAN HP
where SV.MASV=kq.masv and kq.mahp=hp.MAHP and hp.mamh=mh.mamh and mh.makhoa=k.makhoa AND TENKHOA=N'Thống kê tin học'
group by SV.MASV,TENSV
HAVING COUNT(MH.MAMH)=
				(SELECT COUNT(MH.MAMH)
				FROM MONHOC MH JOIN KHOA1 K ON MH.MAKHOA=K.MAKHOA
				WHERE TENKHOA=N'Thống kê tin học')

--TÌM NHÂN VIÊN ĐÃ THAM GIA TẤT CẢ ĐỀ ÁN CỦA PHÒNG NGHIÊN CỨU--
SELECT NV.MANV, TENNV, COUNT(DA.MADA) 'SỐ LƯỢNG ĐỀ ÁN'
FROM NHANVIEN NV, DEAN DA, PHONGBAN PB
WHERE NV.PHONG=PB.MAPHG AND DA.MAPHG=PB.MAPHG AND TENPHG=N'Nghiên Cứu'
GROUP BY NV.MANV, TENNV
HAVING COUNT(DA.MADA)=
					(SELECT COUNT(DEAN.MADA)
					FROM DEAN, PHONGBAN
					WHERE DEAN.MAPHG=PHONGBAN.MAPHG AND TENPHG=N'Nghiên Cứu')


--PHỤ THUỘC HÀM--
--B phụ thuộc vào A--
--Có 6 dạng nhưng thi 5 dạng đầu tiên
--Hợp được thì rã ra được--