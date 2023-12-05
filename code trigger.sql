--Khi xóa dữ liệu trong bảng Transactions hãy cập nhật t_type=9 thay vì xóa
--input: NO
--output: NO
--auto? YES 
--trigger
--bang: transactions
--loai: instead of
--kich hoat: delete

create trigger tDelTran47K211
on transactions 
instead of delete
as
begin
	update transactions
	set t_type=9
	where t_id in (select t_id from deleted)

end

--test--
delete transactions where t_id='0000000201'
select * from transactions

--1.	Khi thêm mới dữ liệu trong bảng transactions hãy thực hiện
--các công việc sau:
--a.Kiểm tra trạng thái tài khoản của giao dịch hiện hành.
--Nếu trạng thái tài khoản ac_type = 9 thì đưa ra thông báo
--‘tài khoản đã bị xóa’ và hủy thao tác đã thực hiện. Ngược lại:  
--i.	Nếu là giao dịch gửi: số dư = số dư + tiền gửi. 
--ii.	Nếu là giao dịch rút: số dư = số dư – tiền rút. 
--Nếu số dư sau khi thực hiện giao dịch < 50.000 thì đưa ra 
--thông báo ‘không đủ tiền’ và hủy thao tác đã thực hiện.

--câu a--
--input: NO
--output: NO
--auto? YES 
--trigger
--bang: account
--loai: instead of
--kich hoat: delete
create or alter trigger tUpdateTran
on transactions
after insert --sự kiện insert thì dùng bảng inserted---
as
begin
	
	declare @ac_type varchar(1), @t_amount numeric(15,0), @t_type varchar(1), @ac_balance numeric(15,0)
	select @ac_type=ac_type, @t_type=t_type, @ac_balance=ac_balance 
	from inserted join account on inserted.ac_no=account.Ac_no

	select @t_amount=t_amount from inserted
	 if @ac_type=9
	 begin
		print N'Tài khoản đã bị xóa'
		rollback
	end

	else if @t_type=1
	begin
		update account set ac_balance=ac_balance + (select t_amount from inserted)
		where Ac_no=(select ac_no from inserted)
	end
	else if @t_type=0
	begin
		if (@ac_balance-@t_amount)<50000
		begin
			print N'Không đủ tiền'
			rollback
		end
		else
		begin
			update account set ac_balance=ac_balance-(select t_amount from inserted)
			where ac_no=(select ac_no from inserted)
		end
	end
end

--test--
insert into transactions values('1000000055',1,8999999,'2019-12-26','09:36','1000000028')
select*from transactions

--2.	Sau khi xóa dữ liệu trong transactions hãy tính lại số dư:
--a.	Nếu là giao dịch rút
--Số dư = số dư cũ + t_amount
--b.	Nếu là giao dịch gửi
--Số dư = số dư cũ – t_amount


create trigger tdelTran 
on transactions
after delete
as
begin
	declare @ac_type varchar(1), @t_amount numeric(15,0), @t_type varchar(1), @ac_balance numeric(15,0)
	 SELECT @t_amount = t_amount, @t_type = t_type, @ac_balance = ac_balance 
    FROM deleted JOIN account a ON deleted.ac_no = a.Ac_no

	if @t_type=1
	begin
		 UPDATE account
        SET ac_balance = ac_balance + @t_amount
		 WHERE Ac_no = (SELECT ac_no FROM deleted)
	end
	else if @t_type=0
	begin 
		UPDATE account
        SET ac_balance = ac_balance + @t_amount
        WHERE Ac_no = (SELECT ac_no FROM deleted)
	end
end



--3.Khi cập nhật hoặc sửa dữ liệu tên khách hàng, hãy đảm bảo tên khách không nhỏ hơn 5 kí tự. --
create or alter tCapSua
on customer
for update




go


--10.Khi thêm mới dữ liệu vào bảng customer, kiểm tra nếu họ tên và số điện thoại đã tồn tại trong bảng 
--thì đưa ra thông báo ‘đã tồn tại khách hàng’ và hủy toàn bộ thao tác
create or alter trigger tThemMoi
on customer
after insert
as
begin
	declare @name nvarchar(100), @sdt varchar(15)
	select @name=cust_name, @sdt=cust_phone from inserted
	if (select count(*) from customer where Cust_name=@name and Cust_phone=@sdt)>1
	begin
		print N'Đã tồn tại khách hàng'
		rollback
	end
END

insert into customer values('000041',N'Hà Công Lực', '0783388103', '78 Hà Huy Tập, Đà Nẵng', 'VT007')
select*from customer


--có bài thi thử on customer trùng nhau ở bảng khác thì lớn hơn 0--
--đang đi học mục tiêu k phải kiếm tiền nên lấy bằng trước nên xin làm intership lấy KN thui :(--

--bôi đen không chạy được thì 0d phần đó--
--thủ tục 5,6 ý bên trong dịch được( có begin end) và chạy được)
--test case (phải chạy test mới có 50% điểm)--
--module có 1 test case: 100% điểm--
--module phủ logic của code: trong trigger bài 1 có 4 nhánh(cứ mỗi if else có 1 nhánh), cần 4 test case chạy vào 4 nhánh, mỗi test case sẽ tính 0.2 điểm
--chấm câu 1 giống câu này của bạn khác sẽ bị 0 điểm, không được kiện, 0 điểm kbg có cơ hội gỡ điểm--