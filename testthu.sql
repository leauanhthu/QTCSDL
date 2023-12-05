create database BanHang
go
use Banhang
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
create table CongNo --công nợ
(
	MaCN int,
	SoDT varchar(15),
	SoTien numeric(12,0),
	TrangThai char(1), --0: chưa trả, 1: đã trả
	primary key(MaCN),
	foreign key (SoDT) references Khach
)
go
insert into LoaiHang values(1,N'Thực phẩm khô')
insert into LoaiHang values(2,N'Đồ uống')
insert into LoaiHang values(3,N'Đồ dùng gia đình')
insert into LoaiHang values(4,N'Đồ dùng học tập')
go
insert into Hang values(1, N'Mì Hảo Hảo chua cay', 3500,4000,'gói',100,0,1)
insert into Hang values(2, N'Miến Phú Hương vị sườn heo', 8500,10000,'gói',150,0,1)
insert into Hang values(3, N'Gia vị lẩu thái', 15000,17000,'hộp',89,0.05,1)
insert into Hang values(4, N'Bánh tráng Quảng Nam', 6000,8000,'gói',50,0,1)

insert into Hang values(5, N'Sữa Vinamilk ít đường 180ml', 6500,7000,'hộp',300,0,2)
insert into Hang values(6, N'Stink', 6100,9000,'chai',300,0,2)
insert into Hang values(7, N'Nước tinh khiết 350ml', 1500,4000,'chai',100,0,2)

insert into Hang values(8, N'Bút bi Thiên Long ngòi nhỏ', 4500,5000,'chiếc',300,0,4)
insert into Hang values(9, N'Bảng nhóm', 12000,15000,'chiếc',50,0,4)
go
insert into Khach values ('0981234561',N'chị Hòa', 0)
insert into Khach values ('0971987122',N'chị Ninh', 1)
insert into Khach values ('0905112324',N'anh Tín', 0)
insert into Khach values ('0961198042',N'chị Lan', 1)
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

go
--Câu 1: Hãy viết module tính mã đơn bán mới, biết rằng mã đơn bán mới = MAX(mã đơn bán)+1
CREATE OR ALTER FUNCTION fTinhMa()
RETURNS int
BEGIN
    DECLARE @madon int
    SELECT @madon= MAX(MADONBAN) + 1 FROM DonBan
    RETURN @madon
END

select dbo.fTinhMa()
select* from DonBan
---Câu 2: 
--input: số điện thoại--
--Kiểm tra sự tồn tại của số điện thoại. Nếu SDT không tồn tại trong bảng Khach thì thông báo lỗi và kết thúc--

create or alter proc pKtra
	@sdt varchar(10),
	@ret bit out
as
begin	
	--Kiểm tra sự tồn tại của sdt--
IF NOT EXISTS (SELECT 1 FROM Khach WHERE SoDT = @sdt)
	BEGIN 
		PRINT N'Không tồn tại số điện thoại'
		RETURN
	END
	-- Tính mã đơn bán mới --
	DECLARE @madonmoidayne varchar(2)
	SET @madonmoidayne = dbo.fTinhMa()

	-- Tính ngày bán = ngày hiện tại --
	DECLARE @ngayban date
	SET @ngayban = CAST(GETDATE() AS DATE)

	-- Tính giờ bán = giờ hiện tại + phút hiện tại --
	DECLARE @gioban time
	SET @gioban = CONVERT(TIME, GETDATE())

	-- Thêm mới bản ghi --
	DECLARE @tongtien int
	SET @tongtien = 0
	INSERT INTO DonBan (MaDonBan, SoDT, Ngay, ThoiGian, TongTien)
	VALUES (@madonmoidayne, @sdt, @ngayban, @gioban, @tongtien)
		if @@ROWCOUNT <= 0
	begin 
		set @ret = 0
		return
	end

	set @ret = 1
end


--test--

DECLARE @sdt1 varchar(10) = '0981234561'
DECLARE @ret bit

EXEC pKtra @sdt1, @ret OUT

-- Kiểm tra sdt
SELECT @ret AS 'Kiểm tra số điện thoại'

-- Kiểm tra mã đơn bán mới
SELECT dbo.fTinhMa() AS 'Mã đơn bán mới'

-- Tính ngày bán
SELECT CAST(GETDATE() AS DATE) AS 'Ngày bán'

-- Tính giờ bán
SELECT CONVERT(TIME, GETDATE()) AS 'Giờ bán'

-- Kiểm tra thông báo kết quả thêm mới
SELECT @ret AS 'Thông báo kết quá'
IF @ret = 1
PRINT 'Thêm mới bản ghi thành công'
ELSE
PRINT 'Không thể thêm mới bản ghi'

select *from DonBan

--3.Khi thêm mới dữ liệu cho bảng CongNo, hãy đảm bảo rằng số điện thoại đã tồn tại trong bảng Khach--
use BanHang
CREATE OR ALTER TRIGGER tThemDL
ON CongNo
after INSERT
AS
BEGIN
	DECLARE @sdt varchar(13)
	SELECT @sdt = SoDT FROM inserted

	IF (SELECT COUNT(*) FROM Khach WHERE SoDT = @sdt) > 1
	BEGIN
		PRINT N'Đã tồn tại khách hàng'
		ROLLBACK
	END
END

alter table donban drop constraint FK__DonBan__SoDT__2A4B4B5E
alter table Khach drop CONSTRAINT PK__Khach__BC3D04C8D86292BA
SELECT * FROM CongNo
INSERT INTO CongNo VALUES ('6','0905112324', '9000000', '0')

delete Khach where SoDT='0905112324'





