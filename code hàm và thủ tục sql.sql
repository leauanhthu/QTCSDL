use Bank
CREATE PROC spGetName(@cust_id varchar(6), @cust_name nvarchar(100) output)
as
begin
	select @cust_name=cust_name from customer where cust_id=@cust_id
end
  CREATE PROC spGetAc(@cust_id varchar(6), @ret nvarchar(50) output)
  as
  begin
		declare @temp int=0
		select @temp=count(*) from account where cust_id=@cust_id
		if @temp=0
			set @ret = N'Không có tài khoản'
		else if @temp = 1
			set @ret = N' Có 1 tài khoản'
		else
			set @ret=N'Có nhiều hơn 1 tài khoản'
	end

--1.Trả về tên chi nhánh ngân hàng nếu biết mã của nó--
--input:  mã chi nhánh ngân hàng
--output: tên chi nhánh ngân hàng--> thứ cần trả về cho ngta
--process: --lấy ra tên chi nhánh với điều kiện br_id=mã chi nhánh input
--> gán biến 
-- có thể viết dưới dạng thủ tục, dưới dạng hàm trả về 1 giá trị (1 mã trả về 1 tên cn)--
--Cách 1 thủ tục(1 tham số đầu vào)--chạy xong thì thủ tục dịch thành công--
create proc spGetBRName @br_id varchar(10),@br_name nvarchar(100) output
as
begin --cái khung đựng thứ mình cần đựng mã--
	set @br_name=(select br_name from branch where br_id = @br_id)
end
--chạy thủ tục thì có tham số và không có tham số, trong trường hợp này có
--tham số đầu ra, có bấy nhiêu tham số đầu ra thì khai báo bấy nhiêu biến
--để hứng giá trị trả về--
--gọi thủ tục--
declare @test nvarchar(100)
exec spGetBRName 'VB001', @test output
print @test

--test--
declare @a varchar(10), @b nvarchar(100)
set @a = 'VN012'
exec spGetBRName @a, @b output
print @b

select * from branch
--Cách 2 hàm--
create function fGetBr_Name(br_id varchar(10)) --tên hàm hay để chữ f là 
--function, khai báo 1 tham số đầu vào là mã chi nhánh thì khai báo 1 đầu
--vào là mã chi nhánh, bắt buộc có dấu mở và đóng ngoặc bất kể hàm đó có
--tham số hay không--
returns nvarchar(100) --tên cn có kiểu dữ liệu nvarchar(100)--
as
begin
	declare @br_name nvarchar(100)--khai báo biến để hướng giá trị trả về--
	select @br_name=br_name from branch where br_id=@br_id
	return
end

--1. Chuyển đổi đầu số điện thoại di động theo quy định của bộ Thông tin và
--truyền thông nếu biết mã khách của họ.
--input: Mã khách hàng
--output: không có
CREATE proc spChuyendoidauso @makhach varchar(6)
as 
begin
	declare @sdt varchar(11), @dau_sdt varchar(4), @duoi_sdt varchar(7)
	set @sdt=(select cust_phone from customer where cust_id=@makhach)
	set @duoi_sdt=right(@sdt, 7)
	set @dau_sdt=(case when len(@sdt)=11 then left(@sdt,4)
					   when len(@sdt)=10 then left(@sdt,3)end)
	update customer
	set cust_phone=(case when @dau_sdt='0162' then concat('032', @duoi_sdt)
						when @dau_sdt='0163' then concat('033', @duoi_sdt)
						when @dau_sdt='0164' then concat('034', @duoi_sdt)
						when @dau_sdt='0165' then concat('035', @duoi_sdt)
						when @dau_sdt='0166' then concat('036', @duoi_sdt)
						when @dau_sdt='0120' then concat('070', @duoi_sdt)
						when @dau_sdt='0121' then concat('079', @duoi_sdt)
						when @dau_sdt='0122' then concat('077', @duoi_sdt)
						when @dau_sdt='0126' then concat('076', @duoi_sdt)
						when @dau_sdt='0128' then concat('078', @duoi_sdt)
						when @dau_sdt='0123' then concat('083', @duoi_sdt)
						when @dau_sdt='0124' then concat('084', @duoi_sdt)
						when @dau_sdt='0127' then concat('081', @duoi_sdt)
						when @dau_sdt='0129' then concat('082', @duoi_sdt)
						when @dau_sdt='0186' then concat('056', @duoi_sdt)
						when @dau_sdt='0188' then concat('058', @duoi_sdt)
						else concat(@dau_sdt, @duoi_sdt)end)
	where cust_id=@makhach

declare @makhach varchar(6)
set @makhach='000008'
exec spChuyendoidauso @makhach
select * from customer where cust_id=@makhach
--2.Kiểm tra trong vòng 10 năm trở lại đây khách hàng có thực hiện- 
--giao dịch nào không, nếu biết mã khách của họ? Nếu có, hãy trừ 50.000 phí duy trì tài khoản
--input: mã khách hàng
--output: không có
CREATE PROCEDURE CheckAndDeductAccountFee
    @CustomerName NVARCHAR(50)
AS
BEGIN
    DECLARE @gd INT, @ac_balance INT

    SELECT @gd = COUNT(DISTINCT t.t_id)
    FROM transactions t
    JOIN account a ON t.ac_no = a.Ac_no
    JOIN customer c ON a.cust_id = c.Cust_id
    WHERE c.Cust_name = @CustomerName AND t.t_date >= DATEADD(YEAR, -10, GETDATE())

    IF @gd > 0
    BEGIN
        UPDATE account
        SET ac_balance = a.ac_balance - 50000
        FROM account a
        JOIN transactions t ON t.ac_no = a.Ac_no
        JOIN customer c ON a.cust_id = c.Cust_id
        WHERE c.Cust_name = @CustomerName AND t.t_date < DATEADD(YEAR, -10, GETDATE())

        SELECT @ac_balance = ac_balance
        FROM account a
        JOIN customer c ON a.cust_id = c.Cust_id
        WHERE c.Cust_name = @CustomerName

        PRINT N'Đã trừ phí duy trì tài khoản'
        PRINT CAST(@ac_balance AS NVARCHAR)
    END
    ELSE
    BEGIN
        PRINT N'Không thực hiện giao dịch trong vòng 10 năm gần đây'
    END
END
declare @ma VARCHAR(60)
set @ma = '000001'
exec CheckAndDeductAccountFee  @ma
print @ma


select * FROM account JOIN transactions  on account.Ac_no=transactions.ac_no
	JOIN customer on account.cust_id=customer.Cust_id


CREATE PROC spTruPhiDuyTriTaiKhoan @makhach VARCHAR(6)
AS
BEGIN
    DECLARE @ablance INT
    SET @ablance = (
        SELECT COUNT(*) 
        FROM transactions t join Account a on t.ac_no=a.Ac_no join Customer c on c.Cust_id=a.cust_id
        WHERE c.Cust_id = @makhach 
            AND t_date >= DATEADD(YEAR, -10, GETDATE())
    )

    IF @ablance > 0
    BEGIN
        UPDATE account
        SET ac_balance = ac_balance - 50000
        WHERE cust_id = @makhach
    END
END
DECLARE @a VARCHAR(6)
SET @a = '000001'
Exec spTruPhiDuyTriTaiKhoan @a
PRINT @a


select * FROM account JOIN transactions  on account.Ac_no=transactions.ac_no
	JOIN customer on account.cust_id=customer.Cust_id
--3.Kiểm tra khách thực hiện giao dịch gần đây nhất vào thứ mấy? (thứ hai, thứ ba, thứ tư,…, chủ nhật) 
--và vào mùa nào (mùa xuân, mùa hạ, mùa thu, mùa đông) nếu biết mã khách.
--input: mã khách
--output:

--17.Hiển thị danh sách khách hàng gồm: họ và tên,
--số điện thoại, số lượng tài khoản đang có và nhận xét.
--Nếu < 1 tài khoản  “Bất thường”, còn lại “Bình thường”
--input:họ và tên khách hàng
--output:
create proc dskhachhang 
		declare @ds table (TenKh nvarchar(100) not null,
					SDT nvarchar(13) not null,
					SoLuongTK int not null,
					NhanXet nvarchar(100) not null)
insert into @ds(TenKh,SDT,SoLuongTK,NhanXet)
select cust_name, cust_phone, count(ac_no),
	case
		when count(ac_no)<1 then N'Bất thường'
		else N'Bình thường'
	end
from customer c left outer join account a on a.cust_id=c.Cust_id
group by cust_name, cust_phone
select*from @ds




--In ra dãy số lẻ từ 1 tới n với n là giá trị người dùng cung cấp--
--input: giá trị n
--output: dãy số lẻ từ 1 đến n

create proc spGetSoLe1 @n int, @i int out
as
begin
	while @i <= @n
	begin
		print @i
		set @i= @i+2
	end
end

declare @op int, @po int =1
set @op=100
exec spGetSoLe1 @op, @po out
print @po



