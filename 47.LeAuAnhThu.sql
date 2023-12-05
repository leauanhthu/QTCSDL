--1.Trả về mã môn học tiên quyết của một môn học nếu biết
--mã môn đó.
create or alter function fKiemtra(@mamon varchar(7))
returns char(7)
as
begin
    DECLARE @monhoctienquyet char(7)
    SELECT @monhoctienquyet = MonTienQuyet FROM MonHoc WHERE MaMon = @mamon
    
    RETURN @monhoctienquyet
end

--test--
select dbo.fKiemtra('MIS3040') 'MÃ MÔN HỌC TIÊN QUYẾT'
select*from MonHoc


--Câu 2:Câu 2. Viết thủ tục thực hiện việc đăng kí môn học bao gồm các thông tin mô tả như sau:
--Đầu vào: mã sinh viên, mã môn học, mã giảng viên, kì học
--Công việc cần thực hiện:
--a)	Kiểm tra sự hợp lệ của mã sinh viên. Mã sinh viên hợp lệ là chuỗi gồm 12 kí tự số. Nếu không hợp lệ thì ngừng xử lý.
--b)	Kiểm tra sự hợp lệ của mã môn học. Mã môn học hợp lệ nếu đã tồn tại trong bảng MonHoc. Nếu không hợp lệ thì ngừng xử lý.
--c)	Kiểm tra mã giảng viên có hợp lệ không. Mã giảng viên hợp lệ nếu đã tồn tại trong bảng GiangVien. Nếu không hợp lệ thì ngừng xử lý.
--d)	Kiểm tra sinh viên có đủ điều kiện học đăng kí môn học không. Đủ điều kiện: đã học các môn tiên quyết (nếu có). Nếu không hợp lệ thì ngừng xử lý
--e)	Thêm dữ liệu vào bảng Diem với các dữ liệu đã có. Điểm để giá trị NULL.


create or alter proc pDki @masv char(12),
							@mamh nvarchar(20),
							@magv nvarchar(15),
							@kihoc nvarchar(100),
							@ret bit OUT
as
begin
	--câu a:Kiểm tra sự hợp lệ của mã sinh viên.
	--Mã sinh viên hợp lệ là chuỗi gồm 12 kí tự số. 
	--Nếu không hợp lệ thì ngừng xử lý.
	  IF LEN(@masv) < 12 or LEN(@masv) > 12
	  BEGIN
		print N'Mã sinh viên không hợp lệ'
        SET @ret = 0
        RETURN
	  END
	  --câu b:Kiểm tra sự hợp lệ của mã môn học. Mã môn học hợp
	  --lệ nếu đã tồn tại trong bảng MonHoc. Nếu không hợp lệ 
	  --thì ngừng xử lý.
	   IF NOT EXISTS (SELECT 1 FROM MonHoc WHERE MaMon = @mamh)
	   BEGIN
		print N'Môn học không hợp lệ'
        SET @ret = 0
        RETURN
	   END

	--câu c: Kiểm tra mã giảng viên có hợp lệ không. 
	--Mã giảng viên hợp lệ nếu đã tồn tại trong bảng GiangVien.
	--Nếu không hợp lệ thì ngừng xử lý.
	  IF NOT EXISTS (SELECT 1 FROM GiangVien WHERE MaGV = @magv)
	BEGIN
		PRINT N'Giảng viên không tồn tại '
		set @ret=0
		RETURN
	END

	--câu d: Kiểm tra sinh viên có đủ điều kiện học đăng kí môn
	--học không. Đủ điều kiện: đã học các môn tiên quyết (nếu có).
	--Nếu không hợp lệ thì ngừng xử lý
	    IF NOT EXISTS (SELECT *FROM MonHoc m WHERE m.MaMon = @mamh
        AND NOT EXISTS (SELECT * FROM Diem d WHERE D.MaSV = @MaSV
                AND d.MaMon = m.MonTienQuyet))
       BEGIN
			PRINT 'Sinh viên không đủ điều kiện học đăng ký môn học.'
			set @ret=0
			RETURN
	   END

	--câu e:Thêm dữ liệu vào bảng Diem với các dữ liệu đã có.
	--Điểm để giá trị NULL.
	    INSERT INTO Diem (MaSV, MaMon, HocKy, MaGV, Diem)
		VALUES (@masv, @mamh, @kihoc, @magv, NULL)
		if @@ROWCOUNT <= 0
		begin 
			print N'Lỗi không thêm dữ liệu'
			set @ret = 0
			return
	    end

	    set @ret = 1
end
--test--
DECLARE @masv char(12) = '161121514129'
DECLARE @mamh nvarchar(20) = 'MIS3003'
DECLARE @kihoc nvarchar(100) = N'Kỳ 1 năm 2021-2022'
DECLARE @magv nvarchar(15) = 'GV08'
DECLARE @ret bit
EXEC pDki @masv, @mamh, @magv, @kihoc, @ret OUT
print @ret

select*from DIEM
--Câu 3: Khi thêm mới dữ liệu vào bảng Sinhvien, hãy đảm bảo
--rằng ngày sinh của sinh viên hợp lệ. Ngày sinh hợp lệ nếu
--tuổi của sinh viên >= 18.
create or alter trigger tThemDL
on SinhVien
for insert
as
begin
	declare @tuoi int
	select @tuoi=datediff(yy,ngaysinh,getdate()) 
	from inserted
	if @tuoi <18
	begin
		print'Ngày sinh không hợp lệ'
		rollback
	end
end

--test--
insert into SinhVien values('161121521167',N'Lê Âu Anh Thư','2009-06-15','0766721299')
select*from SinhVien







