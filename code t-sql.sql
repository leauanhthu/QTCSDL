use Bank
--1.Viết đoạn code thực hiện việc chuyển đổi đầu số điện thoại di động 
--theo quy định của bộ Thông tin và truyền thông cho một khách hàng bất kì,
--ví dụ với: Dương Ngọc Long
declare @sdt varchar(20), @sdtmoi varchar(20)
select @sdt=cust_phone from customer 
where cust_name=N'Dương Ngọc Long'
set @sdtmoi = case when @sdt like '0120%' then '070' +right(@sdt, 7)
				   when @sdt like '0121%' then '079' +right(@sdt, 7)
				   when @sdt like '0122%' then '077' +right(@sdt, 7)
				   when @sdt like '0123%' then '083' +right(@sdt, 7)
				   when @sdt like '0124%' then '084' +right(@sdt, 7)
				   when @sdt like '0125%' then '085' +right(@sdt, 7)
				   when @sdt like '0126%' then '076' +right(@sdt, 7)
				   when @sdt like '0127%' then '081' +right(@sdt, 7)
				   when @sdt like '0128%' then '078' +right(@sdt, 7)
				   when @sdt like '0129%' then '082' +right(@sdt, 7)
				   when @sdt like '0162%' then '032' +right(@sdt, 7)
				   when @sdt like '0163%' then '033' +right(@sdt, 7)
				   when @sdt like '0164%' then '034' +right(@sdt, 7)
				   when @sdt like '0165%' then '035' +right(@sdt, 7)
				   when @sdt like '0166%' then '036' +right(@sdt, 7)
				   when @sdt like '0167%' then '037' +right(@sdt, 7)
				   when @sdt like '0168%' then '038' +right(@sdt, 7)
				   when @sdt like '0169%' then '039' +right(@sdt, 7)
				   when @sdt like '0186%' then '056' +right(@sdt, 7)
				   when @sdt like '0188%' then '058' +right(@sdt, 7)
				   when @sdt like '0199%' then '059' +right(@sdt, 7)
				   else @sdt
			end
--2. Trong vòng 10 năm trở lại đây Nguyễn Lê Minh Quân 
--có thực hiện giao dịch nào không? Nếu có, hãy trừ 
--50.000 phí duy trì tài khoản. 
DECLARE @gd INT, @ac_balance INT
SELECT @gd = COUNT(DISTINCT t.t_id)
FROM transactions t
JOIN account a ON t.ac_no = a.Ac_no
JOIN customer c ON a.cust_id = c.Cust_id
WHERE c.Cust_name LIKE N'Nguyễn Lê Minh Quân' AND t.t_date >= DATEADD(YEAR, -10, GETDATE())

IF @gd > 0
BEGIN
	UPDATE account
	SET ac_balance = a.ac_balance - 50000
	FROM account a
	JOIN transactions t ON t.ac_no = a.Ac_no
	JOIN customer c ON a.cust_id = c.Cust_id
	WHERE c.Cust_name LIKE N'Nguyễn Lê Minh Quân' AND t.t_date < DATEADD(YEAR, -10, GETDATE())

	PRINT N'Đã trừ phí duy trì tài khoản'
	PRINT CAST(@ac_balance AS NVARCHAR)
END
ELSE
BEGIN
	PRINT N'Không thực hiện giao dịch trong vòng 10 năm gần đây'
END

update account SET ac_balance='88118000' WHERE ac_no='1000000001'
update account SET ac_balance='188372000' WHERE ac_no='1000000002'
update account SET ac_balance='44770000' WHERE ac_no='1000000003'
update account SET ac_balance='157231000' WHERE ac_no='1000000004'
update account SET ac_balance='178232000' WHERE ac_no='1000000005'
update account SET ac_balance='-15678000' WHERE ac_no='1000000006'
update account SET ac_balance='332183000' WHERE ac_no='1000000007'
update account SET ac_balance='393221000' WHERE ac_no='1000000008'
update account SET ac_balance='172923000' WHERE ac_no='1000000009'
update account SET ac_balance='-6107000' WHERE ac_no='1000000010'
update account SET ac_balance='227449000' WHERE ac_no='1000000011'
update account SET ac_balance='184002000' WHERE ac_no='1000000012'
update account SET ac_balance='229384000' WHERE ac_no='1000000013'
update account SET ac_balance='94311000' WHERE ac_no='1000000014'
update account SET ac_balance='104826000' WHERE ac_no='1000000015'
update account SET ac_balance='236633000' WHERE ac_no='1000000016'
update account SET ac_balance='121389000' WHERE ac_no='1000000017'
update account SET ac_balance='226017000' WHERE ac_no='1000000018'
update account SET ac_balance='133429000' WHERE ac_no='1000000019'
update account SET ac_balance='272623000' WHERE ac_no='1000000020'
update account SET ac_balance='358446000' WHERE ac_no='1000000021'
update account SET ac_balance='69486000' WHERE ac_no='1000000022'
update account SET ac_balance='232929000' WHERE ac_no='1000000023'
update account SET ac_balance='301503000' WHERE ac_no='1000000024'
update account SET ac_balance='221284000' WHERE ac_no='1000000025'
update account SET ac_balance='184739000' WHERE ac_no='1000000026'
update account SET ac_balance='3672000' WHERE ac_no='1000000027'
update account SET ac_balance='143249000' WHERE ac_no='1000000028'
update account SET ac_balance='85747000' WHERE ac_no='1000000029'
update account SET ac_balance='238311000' WHERE ac_no='1000000030'
update account SET ac_balance='243154000' WHERE ac_no='1000000031'
update account SET ac_balance='350917000' WHERE ac_no='1000000032'
update account SET ac_balance='265088000' WHERE ac_no='1000000033'
update account SET ac_balance='86609000' WHERE ac_no='1000000034'
update account SET ac_balance='248363000' WHERE ac_no='1000000035'
update account SET ac_balance='381588000' WHERE ac_no='1000000036'
update account SET ac_balance='59175000' WHERE ac_no='1000000037'
update account SET ac_balance='123720000' WHERE ac_no='1000000038'
update account SET ac_balance='83933000' WHERE ac_no='1000000039'
update account SET ac_balance='333106000' WHERE ac_no='1000000040'
update account SET ac_balance='227374000' WHERE ac_no='1000000041'
update account SET ac_balance='179736000' WHERE ac_no='1000000042'
update account SET ac_balance='222900000' WHERE ac_no='1000000043'
update account SET ac_balance='214214000' WHERE ac_no='1000000044'
update account SET ac_balance='56524000' WHERE ac_no='1000000045'
update account SET ac_balance='349664000' WHERE ac_no='1000000046'
update account SET ac_balance='77659000' WHERE ac_no='1000000047'
update account SET ac_balance='99830000' WHERE ac_no='1000000048'
update account SET ac_balance='91027000' WHERE ac_no='1000000049'
update account SET ac_balance='95035000' WHERE ac_no='1000000050'
update account SET ac_balance='100367000' WHERE ac_no='1000000051'
update account SET ac_balance='77555000' WHERE ac_no='1000000052'
update account SET ac_balance='295473000' WHERE ac_no='1000000053'
update account SET ac_balance='197525000' WHERE ac_no='1000000054'












--cách 2--
declare @check table (id char(10), trans int)
insert into @check
select transactions.Ac_no, COUNT(*)
from account join customer on account.cust_id = customer.Cust_id
join transactions on account.Ac_no = transactions.ac_no
where Cust_name like N'Nguyễn Lê Minh Quân' and t_date between dateadd(yy,-10,getdate()) and getdate()
group by transactions.ac_no
if ((select trans from @check)>0)
begin
update account
set ac_balance = ac_balance - 50000
from @check customer
where account.Ac_no = customer.id
print N'Đã trừ phí duy trì tài khoản'
end
else
begin
print N'Tài khoản không hoạt động trong 1 năm trở lại đây'
end

--3.Trần Quang Khải thực hiện giao dịch gần đây nhất vào
--thứ mấy? (thứ hai, thứ ba, thứ tư,…, chủ nhật) và vào 
--mùa nào (mùa xuân, mùa hạ, mùa thu, mùa đông)?
DECLARE @thu nvarchar(100), @mua nvarchar(100)
SELECT @thu = (SELECT datename(weekday,
					(SELECT TOP 1 t_date
					FROM transactions t 
					JOIN account a ON a.Ac_no = t.ac_no
					JOIN customer c ON c.Cust_id = a.cust_id
					WHERE c.cust_name LIKE N'Trần Quang Khải'
					ORDER BY t_date DESC)))
SET @mua = CASE
    WHEN MONTH(GETDATE()) IN (1, 2, 3) THEN N'Mùa xuân'
    WHEN MONTH(GETDATE()) IN (4, 5, 6) THEN N'Mùa hè'
    WHEN MONTH(GETDATE()) IN (7, 8, 9) THEN N'Mùa thu'
    WHEN MONTH(GETDATE()) IN (10, 11, 12) THEN N'Mùa đông'
END
PRINT N'Thứ ' + CAST(@thu AS nvarchar)
PRINT @mua

--cách 2:
declare @thu varchar(10), @mua varchar(10)
set @thu = (select top 1 t_date
			from customer c join account ac on c.Cust_id=ac.cust_id
							join transactions t on ac.Ac_no=t.ac_no
			where cust_name like N'Trần Quang Khải'
			order by t_date desc)
set @mua = (select datepart(qq, max(t_date))
			from customer c join account ac on c.Cust_id=ac.cust_id
							join transactions t on ac.Ac_no=t.ac_no
			where cust_name like N'Trần Quang Khải')

set @thu = case when datename(weekday, @thu) = 'Monday' then N'thứ hai'
				when datename(weekday, @thu) = 'Tuesday' then N'thứ ba'
				when datename(weekday, @thu) = 'Wednesday' then N'thứ tư'
				when datename(weekday, @thu) = 'Thursday' then N'thứ năm'
				when datename(weekday, @thu) = 'Friday' then N'thứ sáu'
				when datename(weekday, @thu) = 'Saturday' then N'thứ bảy'
				when datename(weekday, @thu) = 'Sunday' then N'chủ nhật'
			end
set @mua = case @mua when 1 then 'xuân'
					 when 2 then 'hè'
					 when 3 then 'thu'
					 when 4 then 'đông'
		   end
PRINT cast(@thu as varchar)
PRINT N'Mùa '+ cast(@mua as varchar)


--4.Đưa ra nhận xét về nhà mạng mà Lê Anh Huy đang
--sử dụng? (Viettel, Mobi phone, Vinaphone, Vietnamobile,
--khác)
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
--5. Số điện thoại của Trần Quang Khải là số
--tiến, số lùi hay số lộn xộn. Định nghĩa: trừ 3 
--số đầu tiên, các số còn lại tăng dần gọi là số
--tiến, ví dụ: 098356789 là số tiến
declare @sdt int
select @sdt=cust_phone from customer c where cust_name= N'Trần Quang Khải'
set @sdt=right(@sdt, len((@sdt)-3))
print @sdt

--6.Hà Công Lực thực hiện giao dịch gần đây nhất 
--vào buổi nào(sáng, trưa, chiều, tối, đêm)?
declare @gio int
set @gio=(select(datepart(HOUR, (select top 1 t_time
				from customer c join account a on a.cust_id=c.Cust_id
								join transactions t on a.Ac_no=t.ac_no
				where cust_name= N'Hà Công Lực'
				order by t_time desc))))
if (@gio>=0 and @gio <=6)
	print 'Giao dich ban dem'
else if (@gio >6 and @gio <11)
	print('Giao dich buoi sang')
else if (@gio<13)
	print('Giao dich buoi trua')
else if (@gio<17)
	print('Giao dich buoi chieu')
else
	print('Giao dich buoi toi')
--7.Chi nhánh ngân hàng mà Trương Duy Tường 
--đang sử dụng thuộc miền nào? Gợi ý: nếu mã chi 
--nhánh là VN  miền nam, VT  miền trung, 
--VB  miền bắc, còn lại: bị sai mã.
declare @mien nvarchar(100)
set @mien=(select left(b.br_id,2)
			from Branch b join customer c on c.Br_id=b.BR_id
			where cust_name like N'Trương Duy Tường')
if @mien like N'VN%'
PRINT N'Miền Nam'
else if @mien like N'VT%'
print N'Miền Trung'
else if @mien like N'VB%'
print N'Miền Bắc'
else
print N'sai mã'
--8. Căn cứ vào số điện thoại của Trần Phước 
--Đạt, hãy nhận định anh này dùng dịch vụ di động
--của hãng nào: Viettel, Mobi phone, Vina phone, 
--hãng khác.
declare @sdt varchar(11)
set @sdt= (select cust_phone 
			from customer
			where cust_name like N'Trần Phước Đạt')
if @sdt like '016[2,3,4,5,6,7,8,9]%' or @sdt like '03[2,3,4,5,6,7,8,9]%'
	or @sdt like '09[8,7,6]%' or @sdt like '08[6]%'
print N'Viettel'
else if @sdt like '012[0,1,2,6,8]%' or @sdt like '07[0,6,7,8,9]%' 
		or @sdt like '09[0,3]%' or @sdt like '08[9]%' 
print N'Mobi phone'
else if @sdt like '01[3,4,5,7,9]%' or @sdt like '08[1,2,3,4,5,8]%' 
	or @sdt like '09[1,4]%'
	print N' Vinaphone'
else
	print N'mạng khác'
--9.	Hãy nhận định Lê Anh Huy ở vùng nông thôn
--hay thành thị. Gợi ý: nông thôn thì địa chỉ 
--thường có chứa chữ “thôn” hoặc “xóm” hoặc “đội” hoặc “xã” hoặc “huyện”
declare @vung nvarchar(100)
set @vung=(select cust_ad
			from customer
			where cust_name like N'Lê Anh Huy')
if ((@vung like N'%thôn%' or @vung like N'%xóm%' or @vung like N'%đội%' or @vung like N'%xã%' or @vung like N'%huyện%') and @vung not like N'%thị xã%')
print N'nông thôn'
else
print N'thành thị'
--10. Hãy kiểm tra tài khoản của Trần Văn Thiện 
--Thanh, nếu tiền trong tài khoản của anh ta nhỏ
--hơn không hoặc bằng không nhưng 6 tháng gần đây 
--không có giao dịch thì hãy đóng tài khoản bằng 
--cách cập nhật ac_type = ‘K’
declare @tientk nvarchar(100),@kt nvarchar(100)
set @tientk= (select ac_balance
			from account a 
			join customer c on c.cust_id=a.cust_id
			where cust_name like N'Trần Văn Thiện Thanh')
set @kt=(select count(t_id)
		from transactions t
		join account a on a.Ac_no=t.ac_no
		join customer c on c.Cust_id=a.cust_id
		where cust_name like N'Trần Văn Thiện Thanh' and t_date < dateadd(year, -6, GETDATE()))
if (@tientk>0 and @kt>0)
begin 
	print 'So du tai khoan' + @tientk
	print 'Tai khoan con hoat dong'
end 
else if (@tientk<0 or @tientk=0 and @kt=0)
begin
	print 'So du tai khoan' + @tientk
	print 'Tai khoan chua giao dich 6 thang gan day'
	update account 
	set ac_type='K'
	from account a join customer c on a.cust_id=c.Cust_id
	where cust_name like N'Trần Văn Thiện Thanh'
	print 'Khóa tài khoản'
END
else 
	print 'Tai khoan con hoat dong binh thuong'
--11.Mã số giao dịch gần đây nhất của Huỳnh Tấn
--Dũng là số chẵn hay số lẻ? 
declare @maso int
set @maso= (select top 1 t_id
			from transactions t 
			join account a on a.Ac_no=t.ac_no
			join customer c on c.Cust_id=a.cust_id
			where cust_name like N'Huỳnh Tấn Dũng')
if (@maso %2 =0)
	print N'Giao dịch là số chẵn'
else
	print N'Giao dịch là số lẻ'
--12. Có bao nhiêu giao dịch diễn ra trong tháng 
--9/2016 với tổng tiền mỗi loại là bao nhiêu 
--(bao nhiêu tiền rút, bao nhiêu tiền gửi)
declare @gd int, @tongtiengui int, @tongtienrut int
set @gd = (select count(t_id)
		  from transactions t
		  where (year(t_date)='2016' and month(t_date)='9'))
set @tongtiengui= (select(sum(t_amount))
				  from transactions t
				  where (t_type=1 and year(t_date)='2016' and month(t_date)='9'))
set @tongtienrut= (select(sum(t_amount))
				  from transactions t
				  where (t_type=0 and year(t_date)='2016' and month(t_date)='9'))
if (@gd is null)
	set @gd=0
if (@tongtiengui is null)
	set @tongtiengui=0
if (@tongtienrut is null)
	set @tongtienrut=0
print N'Số giao dịch:' +cast(@gd as nvarchar)
print N'Tổng tiền gửi:' +cast(@tongtiengui as nvarchar)
print N'Tổng tiền rút:' +cast(@tongtienrut as nvarchar)
--13.Ở Hà Nội ngân hàng Vietcombank có bao nhiêu chi nhánh
--và có bao nhiêu khách hàng? Trả lời theo mẫu: “Ở Hà Nội,
--Vietcombank có … chi nhánh và có …khách hàng”
declare @cn int, @kh int
set @cn=(select count(br_name)
		from branch b
		where br_name like N'%Hà Nội')
set @kh= (select count(cust_id)
		from branch b
		join customer c on b.BR_id=c.Br_id
		where br_name like N'%Hà Nội')
print N'Ở Hà Nội, Vietcombank có ' + cast(@cn as nvarchar)
+ N' chi nhánh và có ' + cast (@kh as nvarchar)+ N' khách hàng'
--14.Tài khoản có nhiều tiền nhất là của ai,
--số tiền hiện có trong tài khoản đó là bao nhiêu? 
--Tài khoản này thuộc chi nhánh nào?
declare @sotien int, @ai nvarchar(100), @tencn nvarchar(100)
select top 1 @sotien= ac_balance, @ai= cust_name, @tencn= br_name
FROM CUSTOMER C
JOIN BRANCH B ON B.BR_id=C.Br_id
JOIN ACCOUNT A ON A.cust_id=c.cust_id
JOIN TRANSACTIONS T ON T.ac_no=A.Ac_no
order by ac_balance desc
print N'Tài khoản có nhiều tiền nhất là của '+ @ai + N'. Số tiền hiện có trong tài khoản là: '+
cast(@sotien as nvarchar) + N' .Tài khoản này thuộc chi nhánh ' + @tencn
			
--15.Có bao nhiêu khách hàng ở Đà Nẵng?
declare @kh int
set @kh= (select count(cust_id)
		from customer c 
		where cust_ad like N'%Đà Nẵng')
print N'Có ' + cast(@kh as nvarchar)+ N' khách hàng ở Đà Nẵng'
--16. Có bao nhiêu khách hàng ở Quảng Nam nhưng mở tài 
--khoản Sài Gòn
declare @khach int
set @khach=(select count(c.cust_id)
			from CUSTOMER C
			JOIN BRANCH B ON B.BR_id=C.Br_id
			JOIN ACCOUNT A ON A.cust_id=c.cust_id
			where Cust_ad like N'%Quảng Nam' AND BR_name like N'%Sài Gòn')
print @khach
--17. Ai là người thực hiện giao dịch có mã số 0000000387,
--thuộc chi nhánh nào? Giao dịch này thuộc loại nào?
declare @ma int, @nguoi nvarchar(100), @cnh nvarchar(100), @loai nvarchar(100)
select @ma=t_id, @nguoi= cust_name, @cnh=br_name, @loai=ac_type
FROM CUSTOMER C
JOIN BRANCH B ON B.BR_id=C.Br_id
JOIN ACCOUNT A ON A.cust_id=c.cust_id
JOIN TRANSACTIONS T ON T.ac_no=A.Ac_no
where t_id='0000000387'
print @nguoi+ ' là người thực hiện gd có mã 0000000387 thuộc chi nhánh '+
@cnh+ N' Giao dịch này thuộc loại '+ @loai
--18.Hiển thị danh sách khách hàng gồm: họ và tên, số điện
--thoại, số lượng tài khoản đang có và nhận xét. Nếu < 1 
--tài khoản  “Bất thường”, còn lại “Bình thường”
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
--19. Viết đoạn code nhận xét tiền trong tài khoản của ông
--Hà Công Lực. <100.000: ít, < 5.000.000  trung bình, còn
--lại: nhiều
declare @tien int
set @tien = (select sum(ac_balance) 
			 from account ac join customer c on ac.cust_id=c.Cust_id
			 where cust_name like N'Hà Công Lực')
print @tien
if @tien < 100000
begin
	print N'Ít'
end
else if @tien >= 100000 and @tien < 50000000
begin
	print N'Trung bình'
end
else
begin
	print N'Nhiều'
end

--20.	Hiển thị danh sách các giao dịch của chi nhánh Huế với các thông tin: mã giao dịch, thời gian giao dịch, số tiền giao dịch, loại giao dịch (rút/gửi), số tài khoản. Ví dụ:
--Mã giao dịch	Thời gian GD	Số tiền GD	Loại GD	Số tài khoản
--00133455	2017-11-30 09:00	3000000	Rút	04847374948
declare @dsgd table (MaGD nvarchar(100) not null,
					ThoiGianGD DATETIME not null,
					SoTienGD int not null,
					loaiGD nvarchar(100) not null,
					STK nvarchar(20) not null)
insert into @dsgd(MaGD,ThoiGianGD,SoTienGD, loaiGD, STK)
select t_id as 'Mã giao dịch', 
	concat(t_date,' ',left(t_time,5)) as 'Thời gian GD', 
	t_amount as 'Số tiền GD', 
	case when t_type=1 then N'Gửi' 
	else N'Rút' end 'Loại GD' , 
	A.ac_no as'Số tài khoản'
FROM CUSTOMER C
JOIN BRANCH B ON B.BR_id=C.Br_id
JOIN ACCOUNT A ON A.cust_id=c.cust_id
JOIN TRANSACTIONS T ON T.ac_no=A.Ac_no
where BR_name like N'%Huế'
SELECT MaGD 'Mã giao dịch',FORMAT(ThoiGianGD, 'dd-MM-yyyy hh:mm') 'Thời gian GD', SoTienGD 'Số tiền GD', loaiGD 'Loại GD', STK 'Số tài khoản'
FROM @dsgd
--21. Kiểm tra xem khách hàng Nguyễn Đức Duy có ở Quảng Nam
--hay không?
declare @checkne nvarchar(100)
set @checkne= (select cust_ad
				from customer 
				where Cust_name like N'Nguyễn Đức Duy')
if @checkne like N'%Quảng Nam'
begin
	print N'Duy ở Quảng Nam'
end
else
begin
	print N'Duy không ở Quảng Nam'
end
--22.Điều tra số tiền trong tài khoản ông Lê Quang Phong
--có hợp lệ hay không? (Hợp lệ: tổng tiền gửi – tổng tiền
--rút = số tiền hiện có trong tài khoản). Nếu hợp lệ, đưa 
--ra thông báo “Hợp lệ”, ngược lại hãy cập nhật lại tài
--khoản sao cho số tiền trong tài khoản khớp với tổng số 
--tiền đã giao dịch
--(ac_balance = sum(tổng tiền gửi) – sum(tổng tiền rút)

declare @sumtiengui int, @sumtienrut int, @tienhienco int
set @tienhienco=(select ac_balance
				from account a
				join customer c on a.cust_id=c.Cust_id
				where cust_name like N'Lê Quang Phong')
select @sumtiengui = sum(t_amount)
from account a join customer c on a.cust_id=c.Cust_id
				join transactions t on t.ac_no=a.Ac_no
where t_type=1 and cust_name like N'Lê Quang Phong'
select @sumtienrut = sum(t_amount)
from account a join customer c on a.cust_id=c.Cust_id
				join transactions t on t.ac_no=a.Ac_no
where t_type=0 and cust_name like N'Lê Quang Phong'

if @tienhienco is null
	set @tienhienco=0
if @sumtiengui is null
	set @sumtiengui=0
if @sumtienrut is null
	set @sumtienrut=0
if (@sumtiengui - @sumtienrut=@tienhienco)
	print N'Hợp lệ'
else 
begin
	print N'Không hợp lệ'
	update account set ac_balance=@sumtiengui-@sumtienrut
	from account a join customer c on a.cust_id=c.Cust_id
	where Cust_name like N'Lê Quang Phong'
	print N'Đã update thành hợp lệ'
end
print 'Số tiền hiện có trong tk: '+ cast(@tienhienco as nvarchar)
print 'Tong tien gui: '+ cast(@sumtiengui  as nvarchar)
print 'Tong tien rut: '+ cast(@sumtienrut  as nvarchar)

--23. Chi nhánh Đà Nẵng có giao dịch gửi tiền nào diễn ra 
--vào ngày chủ nhật hay không? Nếu có, hãy hiển thị số lần 
--giao dịch, nếu không, hãy đưa ra thông báo “không có”
declare @gui int

--hà công lực thực hiện giao dịch đầu tiên 
--vào ngày trong tuần hay cuối tuần, 
--gửi hay rút tiền và lượng tiền là bao nhiêu
declare @ngd nvarchar(15), @loaitien nvarchar(50), @slgd int
select top 1 @ngd = t_date,   @loaitien = CASE WHEN t_type = 1 THEN N'Gửi tiền' ELSE N'Rút tiền' END, @slgd = sum(t_amount)
			from customer c join account ac on c.Cust_id=ac.cust_id
						   join transactions t on ac.Ac_no=t.ac_no
			where cust_name= N'Hà Công Lực'
			group by t_date, t_type
			order by t_date 

SET @ngd = CASE
    WHEN datepart(weekday,@ngd) IN (3, 4, 5, 6, 7) THEN N'Trong tuần'
    WHEN datepart(weekday,@ngd)=2 THEN N'Đầu tuần'
    WHEN datepart(weekday,@ngd)=1 THEN N'Cuối tuần'
END
   
print @ngd
print @loaitien
print @slgd
	


--Ông Dương Ngọc Long thực hiện giao dịch đầu tiên tại VCB ngày trong hay cuối tuần. Ông rút hay gửi tiền, số lượng bao nhiêu?
Declare @nggd nvarchar(15), @ltien nvarchar(50), @sl int
Select top 1 @nggd = t_date, @ltien = CASE WHEN t_type = 1 THEN N'Gửi tiền' ELSE N'Rút tiền' END, @sl = sum(t_amount)
			from customer c join account ac on c.Cust_id=ac.cust_id
						   join transactions t on ac.Ac_no=t.ac_no
						   join branch b on b.BR_id=c.Br_id
			where cust_name= N'Dương Ngọc Long' and br_name like N'Vietcombank%'
			group by t_date, t_type
			order by t_date 
SET @nggd = CASE
    WHEN datepart(weekday,@nggd) IN (2, 3, 4, 5, 6, 7) THEN N'Trong tuần'
    WHEN datepart(weekday,@nggd)=1 THEN N'Cuối tuần'
END
   
print @nggd
print @ltien
print @sl

select *
from customer c join account ac on c.Cust_id=ac.cust_id
					   join branch b on b.BR_id=c.Br_id
					   join transactions t on ac.Ac_no=t.ac_no
where cust_name= N'Dương Ngọc Long' and br_name like N'Vietcombank%'
order by t_date