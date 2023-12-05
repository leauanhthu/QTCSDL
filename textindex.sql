create database BanHang1
go
use Banhang1
go
create table LoaiHang
(
	MaLoai int,
	TenLoai nvarchar(100),
	primary key(MaLoai)
)
go
create table Hang
(
	MaHang int,
	TenHang nvarchar(100),
	GiaNhap numeric (12,0),
	GiaBan numeric (12,0),
	DonViTinh nvarchar(50),
	SoLuongTon int,
	KhuyenMai float, --tính theo % giá bán
	MaLoai int,
	primary key(MaHang),
	foreign key (MaLoai) references LoaiHang
)
go
create table Khach
(
	SoDT varchar(15),
	HoTen nvarchar(100),
	LoaiKhach char(1),  --0: khach thuong, 1: khach quen
	primary key(SoDT)
)
go
create table DonBan
(
	MaDonBan int,
	SoDT varchar(15),
	Ngay date,
	ThoiGian time,
	TongTien numeric(12,0),
	primary key(MaDonBan),
	foreign key (SoDT) references Khach
)
go
create table DonBanChiTiet
(
	MaDonBan int,
	MaHang int,
	SoLuong int,
	ThanhTien numeric(12,0),
	foreign key (MaHang) references Hang,
	foreign key (MaDonBan) references DonBan
)
go
create table CongNo --công n?
(
	MaCN int,
	SoDT varchar(15),
	SoTien numeric(12,0),
	TrangThai char(1), --0: ch?a tr?, 1: ?ã tr?
	primary key(MaCN),
	foreign key (SoDT) references Khach
)
go
insert into LoaiHang values(1,N'Th?c ph?m khô')
insert into LoaiHang values(2,N'?? u?ng')
insert into LoaiHang values(3,N'?? dùng gia ?ình')
insert into LoaiHang values(4,N'?? dùng h?c t?p')
go
insert into Hang values(1, N'Mì H?o H?o chua cay', 3500,4000,'gói',100,0,1)
insert into Hang values(2, N'Mi?n Phú H??ng v? s??n heo', 8500,10000,'gói',150,0,1)
insert into Hang values(3, N'Gia v? l?u thái', 15000,17000,'h?p',89,0.05,1)
insert into Hang values(4, N'Bánh tráng Qu?ng Nam', 6000,8000,'gói',50,0,1)

insert into Hang values(5, N'S?a Vinamilk ít ???ng 180ml', 6500,7000,'h?p',300,0,2)
insert into Hang values(6, N'Stink', 6100,9000,'chai',300,0,2)
insert into Hang values(7, N'N??c tinh khi?t 350ml', 1500,4000,'chai',100,0,2)

insert into Hang values(8, N'Bút bi Thiên Long ngòi nh?', 4500,5000,'chi?c',300,0,4)
insert into Hang values(9, N'B?ng nhóm', 12000,15000,'chi?c',50,0,4)
go
insert into Khach values ('0981234561',N'ch? Hòa', 0)
insert into Khach values ('0971987122',N'ch? Ninh', 1)
insert into Khach values ('0905112324',N'anh Tín', 0)
insert into Khach values ('0961198042',N'ch? Lan', 1)
go
insert into DonBan values(1, '0971987122', '2022-09-10', '10:00', 40000)
insert into DonBan values(2, '0905112324', '2022-08-19', '13:00', 50000)
go
insert into DonBanChiTiet values(1, 1, 10, 40000)
insert into DonBanChiTiet values(2, 8, 5, 40000)
insert into DonBanChiTiet values(2, 5, 2, 10000)
go
insert into CongNo values (1, '0905112324', 100000, 0)
insert into CongNo values (2, '0981234561', 20000, 1)
insert into CongNo values (3, '0961198042', 900000, 1)
insert into CongNo values (4, '0961198042', 80000, 0)
insert into CongNo values (5, '0971987122', 120000, 0)




use adventureworks2012
go 
begin transaction fundstransfer
go

exec humanresources.DebitAccount '100', 'account1';
exec humanresources.CreditAccount '100', 'account2';

commit transactions;