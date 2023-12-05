--4. Đưa ra nhận xét về nhà mạng của khách hàng đang sử dụng nếu biết mã khách? (Viettel, Mobi phone, Vinaphone, Vietnamobile, khác)
--input: mã khách
--output: nhà mạng
create proc (@makh nvarchar(100), @nx varchar(15) out)
as 
begin
			declare @mang nvarchar(100)
			select @mang=cust_phone
			from customer c
			if @mang like '016[2,3,4,5,6,7,8,9]%' or @mang like '03[2,3,4,5,6,7,8,9]%'
				or @mang like '09[8,7,6]%' or @mang like '08[6]%'
			print N'Huy dùng mạng Viettel'
			else if @mang like '012[0,1,2,6,8]%' or @mang like '07[0,6,7,8,9]%' 
					or @mang like '09[0,3]%' or @mang like '08[9]%' 
			print N'Huy dùng mạng Mobi phone'
			else if @mang like '01[3,4,5,7,9]%' or @mang like '08[1,2,3,4,5,8]%' 
				or @mang like '09[1,4]%'
				print N'Huy dùng mạng Vinaphone'
			else
	print N'Huy dùng mạng khác'

--9. Hãy nhận định khách hàng ở vùng nông thôn hay thành thị nếu biết mã khách hàng của họ. 
--Gợi ý: nông thôn thì địa chỉ thường có chứa chữ “thôn” hoặc “xóm” hoặc “đội” hoặc “xã” hoặc “huyện”
--input: mã khách
--output: vùng  
alter proc kiemtravung (@cust_id varchar(15), @vung nvarchar(50) output)
as
begin
	set @vung= ( select Cust_ad
				from customer
				where Cust_id=@cust_id)
	if @vung like N'%thôn%'or @vung like N'%xóm%' or @vung like N'%xã%'  or @vung like N'%đội%' or @vung like N'%huyện%' 
	begin
		print N'nông thôn'
	end
	else
	begin
		print N'thành thị'
	end
end
--goi thu tuc
declare @a varchar(15), @b nvarchar(50)
exec kiemtravung '000013',@b output
print @b

PHAN THỊ HỒNG PHƯỢNG, THÔN 1B, XÃ ĐỒNG TRẠCH, BỐ TRẠCH, QUẢNG BÌNH
select*from customer





--19. Kiểm tra khách hàng đã mở tài khoản tại ngân hàng hay chưa nếu biết họ tên và số điện thoại của họ.
--input: họ tên và sdt khách hàng
--output: không có

create or alter proc ktrakh @tenkhach nvarchar(100), @sodienthoai varchar(13)
as
begin
	declare @khmoi bit;
	if exists (select 1 from customer where cust_name =@tenkhach and cust_phone =@sodienthoai)
	begin
		set @khmoi=0
	end
	else 
	begin	
		set @khmoi=1
	end
	if @khmoi=1
		print N'Khách hàng đã tồn tại'
	else
		print N'Khách hàng chưa tồn tại'
end

declare @tenkhach nvarchar(100)=N'Lê Âu Anh Thư'
declare @sodienthoai varchar(13)='0766721299'
exec ktrakh @tenkhach, @sodienthoai
select*from customer



create or alter proc ktraKH @TenKH NVARCHAR(255), @sdt NVARCHAR(20), @ret BIT out
AS
BEGIN
	 declare @count int
	 set @count=(select count(*) from customer where cust_name=@TenKH and cust_phone=@sdt)
	 if @count>0
	 begin
		set @ret=1
	end
	else
	begin
		set @ret=0
	end
END
go


--test:
select * from customer
declare @TenKH nvarchar(255)= N'Hà Công Lực'
declare @sdt nvarchar(20) ='0783388103'
DECLARE @c bit
exec ktraKH @TenKH, @sdt, @c out
print @c

--20. Điều tra số tiền trong tài khoản của khách có hợp lệ hay không
--nếu biết mã khách? (Hợp lệ: tổng tiền gửi – tổng tiền rút = số tiền hiện có trong tài khoản).
--Nếu hợp lệ, đưa ra thông báo “Hợp lệ”, ngược lại hãy cập nhật lại tài khoản sao cho số tiền 
--trong tài khoản khớp với tổng số tiền đã giao dịch (ac_balance = sum(tổng tiền gửi) – sum(tổng tiền rút)
create proc spDieuTraTK @makhach varchar(10)
as
begin
-- Khoi tao bang
		declare @accountBalance table(
		ac_no varchar(10),
		tienGui int,
		tienRut int,
		thongbao nvarchar(50)
		)
-- Tính tiền cho từng tài khoản
		insert into @accountBalance (ac_no, tienGui, tienRut)
		select account.ac_no,
				SUM(CASE WHEN t_type=1 THEN t_amount ELSE 0 END), 
				SUM(CASE WHEN t_type=0 THEN t_amount ELSE 0 END)
		from transactions join account on transactions.ac_no =account.ac_no
		where cust_id = @makhach
		group by account.ac_no
--Update ac_balance
		update account
		set ac_balance = CASE WHEN ac_balance =tienGui - tienRut THEN ac_balance
							ELSE tienGui - tienRut
							END
		from @accountBalance ab
		join account ac on ab.ac_no= ac.ac_no
		where ac.cust_id = @makhach 
-- Thông báo
		update @accountBalance
		set thongbao = CASE
		WHEN tienGui - tienRut >= 0 THEN N'Hợp lệ'
		ELSE N'Không hợp lệ, cập nhật lại'
		END
--In thông báo
		select* from @accountBalance
end


--TEST:
declare @makhach varchar(10) = '000001'
exec spDieuTraTK @makhach

select*from account
