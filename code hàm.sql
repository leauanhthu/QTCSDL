--1.Kiểm tra thông tin khách hàng đã tồn tại trong hệ thống hay
--chưa nếu biết họ tên và số điện thoại. Tồn tại trả về 1, 
--không tồn tại trả về 0

CREATE or alter FUNCTION fCheckCust47K211(@ten nvarchar(100), @sdt varchar(12))
returns bit
as
begin
	declare @count int
	set @count=(select count(*) from customer 
				where cust_name=@ten and cust_phone=@sdt)
	return case when @count >0 then 1 --lệnh return nằm ngoài 1 cách tường minh k nằm bên trong khối lệnh--
				else 0 end
end
--concat nối 2 chuỗi lại với nhau(k cần chuyển dữ liệu)
select dbo.fCheckCust47K211(N'Trần Đức Quý','01638843209')
print concat(N'Giá trị trả về là: ', dbo.fCheckCust47K211(N'Trần Đức Quý','01638843209'))
select*from customer
GO


--3. In ra danh sách khách hàng của một chi nhánh cụ thể nếu biết mã chi nhánh đó.
CREATE OR ALTER FUNCTION fCheckMaCN (@macn nvarchar(50))
returns table
as
RETURN
	SELECT c.Cust_id, c.Cust_name, c.Cust_phone, c.Cust_ad
    FROM customer c JOIN Branch b ON c.Br_id = b.BR_id
    WHERE b.BR_id = @macn


SELECT *
FROM dbo.fCheckMaCN('VT009');
PRINT N'Danh sách khách hàng: ';SELECT *FROM dbo.fCheckMaCN('VT009');
select*from customer,branch
go

--4.Kiểm tra một khách hàng nào đó đã tồn tại trong hệ thống CSDL
--của ngân hàng chưa nếu biết: họ tên, số điện thoại của họ.
--Đã tồn tại trả về 1, ngược lại trả về 0

create or alter function fCheckKH (@tenkh nvarchar(100), @sdt varchar(12))
returns bit
as
begin
	declare @count int
	set @count=(select count(*)
				from customer c join account a on a.cust_id=c.Cust_id
				where cust_name=@tenkh and cust_phone=@sdt)
	return case when @count >0 then 1 
				else 0 end
end

select dbo.fCheckKH (N'Trần Đức Quý','01638843209');
print concat(N'Giá trị trả về là: ', dbo.fCheckKH(N'Trần Đức Quý','01638843209'))
select*from customer

--7.Trả về số tiền có trong tài khoản nếu biết mã tài khoản.
create or alter function fCheckTien (@matk nvarchar(50))
returns numeric(15,0)
as
BEGIN
    DECLARE @balance numeric(15,0)
	select @balance=ac_balance
	from account a
	where ac_no=@matk

	return @balance
end

select dbo.fCheckTien('1000000003')
print concat(N'Số tiền có trong tài khoản là: ', dbo.fCheckTien('1000000003'))
select * from account

--9.Kiểm tra một giao dịch có bất thường hay không nếu biết mã giao dịch.
--Giao dịch bất thường: giao dịch gửi diễn ra ngoài giờ hành chính,
--giao dịch rút diễn ra vào thời điểm 0am-> 3am
create or alter function fCheckTien (@magd nvarchar(50))
returns bit
as
begin
	declare @count int
	set @count=(select count(*) from transactions t
				where t_time BETWEEN '00:00' AND '03:00')
	return case when  @count>0 then 1
				else 0 end
end

select dbo.fCheckTien('0000000203')
print concat(N'Giá trị trả về là: ', dbo.fCheckTien('0000000203'))
select*from transactions t

--10.Trả về mã giao dịch mới. Mã giao dịch tiếp theo được tính như sau:
--MAX(mã giao dịch đang có) + 1. Hãy đảm bảo số lượng kí tự luôn đúng
--với quy định về mã giao dịch
CREATE OR ALTER FUNCTION fCheckMagdmoi()
RETURNS char(10)
AS
BEGIN
    DECLARE @maxmagd char(10)
    DECLARE @newmagd char(10)
    
    -- Lấy mã giao dịch lớn nhất hiện có 
    SELECT @maxmagd = MAX(t_id)
    FROM transactions
    
    -- Tính mã giao dịch mới bằng cách tăng giá trị của mã giao dịch lớn nhất hiện có lên 1
    DECLARE @nextID int
    SET @nextID = CAST(RIGHT(@maxmagd, 9) AS int) + 1
    SET @newmagd = RIGHT('000000000' + CAST(@nextID AS varchar(10)), 10)
    RETURN @newmagd
END

select dbo.fCheckMagdmoi()
PRINT CONCAT(N'Giá trị trả về là: ', dbo.fCheckMagdmoi())
select*from transactions
go

--sửa câu 10 giống của cô--
create or alter proc SNewTranID(@magd char(10) output)
as
begin
	declare @count varchar(10)
	set @count = (select (max(cast(t_id as numeric(10,0)))+1) from transactions)
	set @magd=concat(replicate('0',10-len(@count)),@count)
end

declare @a varchar(10)
exec SNewTranID @a output
print @a


create or alter function fNewTranID()
returns char(10)
begin
	declare @count varchar(10)
	set @count = (select (max(cast(t_id as numeric(10,0)))+1) from transactions)
	return concat(replicate('0',10-len(@count)),@count)
end
go

--11.Thêm một bản ghi vào bảng TRANSACTIONS nếu biết các thông tin ngày giao dịch, thời gian giao dịch, số tài khoản, loại giao dịch, số tiền giao dịch. Công việc cần làm bao gồm:
--Tất cả các điều kiện đó đặt trong body thủ tục
--a.	Kiểm tra ngày và thời gian giao dịch có hợp lệ không. Nếu không, ngừng xử lý
--b.	Kiểm tra số tài khoản có tồn tại trong bảng ACCOUNT không? Nếu không, ngừng xử lý
--c.	Kiểm tra loại giao dịch có phù hợp không? Nếu không, ngừng xử lý
--d.	Kiểm tra số tiền có hợp lệ không (lớn hơn 0)? Nếu không, ngừng xử lý
--e.	Tính mã giao dịch mới
--f.	Thêm mới bản ghi vào bảng TRANSACTIONS
--g.	Cập nhật bảng ACCOUNT bằng cách cộng hoặc trừ số tiền vừa thực hiện giao dịch tùy theo loại giao dịch

--input:ngày giao dịch, thời gian giao dịch, số tài khoản, loại giao dịch, số tiền giao dịch.
--output: ret (1: thành công, 0: thất bại) (không nói thì cũng phải trả về kết quả dù không có output, kiểu báo cáo kết quả)
--phải khai báo input và output trong bài--
CREATE OR ALTER PROCEDURE pInsertTran
    @ngaygd DATE,
    @thoigiangd TIME,
    @stk CHAR(10),
    @loaigd CHAR(1),
    @sotiengd money,
	@ret bit out
AS
BEGIN
    --a.Kiểm tra ngày và thời gian giao dịch có hợp lệ không.
    if @ngaygd is null or @thoigiangd is NULL or @ngaygd>getdate() --ngày trong tương lai phải là >getdate()
		return--ngừng tất cả--
	--cách 2:
	 if @ngaygd is null or @thoigiangd is NULL or @ngaygd>getdate() 
	 begin
			set @ret=0
			return
	end

	--b.Kiểm tra số tài khoản có tồn tại trong bảng ACCOUNT 
	--không? Nếu không, ngừng xử lý --1 là đếm, 
	declare @count int
	set @count=(select count(*) from transactions t where ac_no=@stk)
	if @count is null
		return
	--cách 2:
	if not exists (select 1 from account where ac_no=@stk) --để số 1 cho tốc độ nhanh nhất, còn ac_no thì chậm hơn--
	begin 
		set @ret=0
		return
	end
	--c.Kiểm tra loại giao dịch có phù hợp không? 
	--Nếu không, ngừng xử lý
	if @loaigd not in ('1','0')
		return
	--cách 2:
	if @loaigd not in ('1','0')--đã là dữ liệu char thì phải dấu ''
	begin 
		set @ret=0
		return
	end
	--d.Kiểm tra số tiền có hợp lệ không (lớn hơn 0)? 
	--Nếu không, ngừng xử lý
	if @sotiengd<=0
		return 
	--cách 2:
	if @sotiengd<=0
	begin 
		set @ret=0
		return
	end
	--e.Tính mã giao dịch mới
	declare @magdmoi varchar(13)
	SET @magdmoi=(select dbo.fCheckMagdmoi())
	if @magdmoi is null
		return
	--cách 2: 
	declare @mamoi varchar(10)=dbo.fCheckMagdmoi()
	--f.Thêm mới bản ghi vào bảng TRANSACTIONS
	insert into transactions values (@magdmoi, @loaigd, @sotiengd,@ngaygd, @thoigiangd, @stk) --đi theo đúng thứ tự mà bảng đó đang có--
	if @@ROWCOUNT>0 
	begin
		set @ret=0
		return
	end
	--g.Cập nhật bảng ACCOUNT bằng cách cộng hoặc trừ số tiền vừa thực hiện giao dịch tùy theo
	--loại giao dịch
	if @@ROWCOUNT>0 --nếu thêm mới 1 bản ghi vào bảng transactions thành công thì mới cập nhật tài khoản
	begin
		if @loaigd='1'
		begin
			update account set ac_balance=ac_balance+@sotiengd where Ac_no=@stk
		end
		else
		begin
			update account set ac_balance=ac_balance-@sotiengd where Ac_no=@stk
		end

		set @ret=@@ROWCOUNT --trả về số lượng bản ghi đã cập nhật trong bảng account
	end
	--cách 2:
	update account
	set ac_balance = case @loaigd when 1 then ac_balance + @sotiengd
									when 0 then ac_balance - @sotiengd end
	if @@ROWCOUNT>0
	begin
	set @ret=0
		return
	end

	set @ret=1
end

DECLARE @ngaygd DATE = '2023-10-31'
DECLARE @thoigiangd TIME = '10:30:00'
DECLARE @stk CHAR(10) = '1000000019'
DECLARE @loaigd CHAR(1) = '1'
DECLARE @sotiengd money = 1
DECLARE @ret bit
EXECUTE pInsertTran @ngaygd, @thoigiangd, @stk, @loaigd, @sotiengd, @ret OUT
print @ret

select * from transactions --chạy bảng này xong mới chạy bảng account để check--
select*from account
--173429000


--sửa bài của cô--


create or alter PROC InsertData @ngay date,
					   @thoigian time,
					   @stk varchar(10), 
					   @loaiGD varchar(1),
					   @tien money, 
					   @ret bit out
as
begin 
	-- a.	Kiểm tra ngày và thời gian giao dịch có hợp lệ không. Nếu không, ngừng xử lý
	if @ngay = '' or	@ngay > cast(getdate() as date)
	   or  @thoigian = '' or @thoigian > cast(getdate() as time)
	begin
		set @ret = 0
		return
	end
	-- b.	Kiểm tra số tài khoản có tồn tại trong bảng ACCOUNT không? Nếu không,
	-- ngừng xử lý
	if not exists (select 1 from account where Ac_no = @stk)
	begin
		set @ret = 0
		return
	end

	-- c.	Kiểm tra loại giao dịch có phù hợp không? Nếu không, ngừng xử lý
	if @loaiGD not in ('0','1')
	begin
		set @ret = 0
		return
	end

	-- d.	Kiểm tra số tiền có hợp lệ không (lớn hơn 0)? Nếu không, ngừng xử lý
	if @tien <= 0
	begin
		set @ret =0
		return
	end

	-- e.	Tính mã giao dịch mới
	declare @maGD varchar(10) =  dbo.fCheckMagdmoi()

	-- f.	Thêm mới bản ghi vào bảng TRANSACTIONS
	begin transaction
	insert into transactions values (@maGD, @loaiGD, @tien, @ngay, @thoigian, @stk)
	if @@ROWCOUNT <= 0
	begin
		rollback transaction
		set @ret =0
		return
	end

	-- g.	Cập nhật bảng ACCOUNT bằng cách cộng hoặc trừ số tiền vừa thực hiện giao dịch tùy theo loại giao dịch
	update account 
	set ac_balance = case @loaiGD when 1 then ac_balance + @tien
								  when 0 then ac_balance - @tien end
	if @@ROWCOUNT <= 0
	begin 
		rollback transaction
		set @ret = 0
		return
	end
	commit transaction
	set @ret = 1
end

-- chạy
declare @t_date date = '2023-10-30',
		@t_time time = '12:00',
		@ac_no varchar(10) = '1000000001', 
		@t_type varchar(1) = '0',
		@t_amount money = 1, 
		@ret bit

exec InsertData @t_date, @t_time, @ac_no, @t_type, @t_amount, @ret out
print @comment
select * from transactions
-- xóa
drop PROC InsertData
go