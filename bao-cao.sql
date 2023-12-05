create database QTCSDL2
use QTCSDL2
create table KHACHHANG
(
MaKH varchar(20) not null primary key,
TenKH nvarchar(100),
SDT varchar(10),
DiaChi nvarchar(100)
)
create unique index sdt on KHACHHANG(SDT)

create table NHACUNGCAP
(
TenNCC nvarchar(100) not null primary key,
SDT varchar(10),
DiaChi nvarchar(100)
)
create unique index ncc on NHACUNGCAP(SDT)

create table SANPHAM
(
MaSP varchar(20) not null primary key,
TenSP nvarchar(100),
DonGia numeric,
DVT nvarchar(20)
)
create unique index ten on SANPHAM(TenSP)
select * from sanpham
where MaSP='MS012'

create table THIETBI
(
MaTB varchar(20) not null primary key,
TenTB nvarchar(100),
DVT nvarchar(20),
DonGia money
)

create table CUNGCAP
(
MaDonCC varchar(20) not null primary key,
TenNCC nvarchar(100),
TongTien money,
NgayDat date,
constraint FK_CC_NCC foreign key(TenNCC) references NHACUNGCAP(TenNCC)
)

create table CUNGCAP_CHITIET
(
MaDonCC varchar(20) not null,
MaTB varchar(20),
Soluong int,
ThanhTien money,
primary key(MaDonCC, MaTB),
constraint FK_CCCT_NCC foreign key(MaTB) references THIETBI(MaTB),
constraint FK_CCCT_CC foreign key(MaDonCC) references CUNGCAP(MaDonCC)
)

create table MUA
(
MaDonMua varchar(20) not null primary key,
MaKH varchar(20),
NgayMua date,
TongTien money,
constraint FK_M_KH foreign key(MaKH) references KHACHHANG(MaKH)
)

create table MUA_CHITIET
(
MaDonMua varchar(20) not null,
MaSP varchar(20),
Soluong int,
ThanhTien money,
primary key(MaDonMua, MaSP),
constraint FK_MCT_KH foreign key(MaSP) references SANPHAM(MaSP),
constraint FK_MCT_M foreign key(MaDonMua) references MUA(MaDonMua)
)

create table TAILIEU
(
TenTL nvarchar(100) not null primary key,
DonGia money
)

create table DAT
(
MaDonTL varchar(20) not null primary key,
MaKH varchar(20),
NgayDat	date,
NgayLay	date,
TongTien money
constraint FK_D_KH foreign key(MaKH) references KHACHHANG(MaKH)
)

create table DAT_CHITIET
(
MaDonTL	varchar(20),
TenTL nvarchar(100),
SoLuong	int,
ThanhTien money,
primary key(MaDonTL, TenTL), 
constraint FK_DCT_D foreign key(MaDonTL) references DAT(MaDonTL), 
constraint FK_DCT_TL foreign key(TenTL) references TAILIEU(TenTL)
)


--KHÁCH HÀNG
INSERT INTO KHACHHANG VALUES ('KH001', N'Lê Thu Hương', '0369972135',N'18 Phan tứ, Ngũ Hành Sơn, Đà Nẵng'),
							 ('KH002', N'Trần Văn Nam', '0857462112',N'73 Hàm tử, Ngũ Hành Sơn, Đà Nẵng'),
							 ('KH003', N'Cao Duy Cường', '0917521869',N'53 Lê Thanh Nghị, Hòa Cường Bắc, Hải Châu, Đà Nẵng'),
							 ('KH004', N'Nguyễn Đình Đức', '0338766512',N'Thanh Lương 17,Hòa Xuân, Cẩm Lệ, Đà Nẵng'),
							 ('KH005', N'Cao Vân Anh', '0967346281',N'17 An Thượng 20, Bắc Mỹ An, Ngũ Hành Sơn, Đà Nẵng'),
							 ('KH006', N'Nguyễn Quang Hiếu', '0369972166', N'46 Châu Thị Vĩnh Tế, Bắc Mỹ An, Ngũ Hành Sơn, Đà Nẵng'),
							 ('KH007', N'Hoàng Mạnh Đức', '0857462222', N'Thanh Lương 15,Hòa Xuân, Cẩm Lệ, Đà Nẵng'),
							 ('KH008', N'Phan Văn Hoàng', '0917521888', N'13 Đỗ Bá, Ngũ Hành Sơn, Đà Nẵng'),
							 ('KH009', N'Lê Anh Thư', '0338766555', N'31 Lê Thanh Nghị, Hòa Cường Bắc, Hải Châu, Đà Nẵng'),
							 ('KH0010', N'Nguyễn Thị Thùy Trang', '0967348881', N'72 Ngũ Hành Sơn, Đà Nẵng'),
							 ('KH011', N'Nguyễn Thùy Trang', '0352705723', N'10 Nguyễn Tri Phương, Hải Châu, Đà Nẵng'),
							 ('KH012', N'Nguyễn Thùy Trâm', '0352052323', N'10 Quang Trung, Hải Châu, Đà Nẵng')
							 

--Nhà cung cấp:
insert into NHACUNGCAP VALUES (N'Công ty Thanh Giang','0905440057',N'171 Nguyễn Hoàng, Hải Châu, Đà Nẵng'),
							  (N'Công ty Xuân Chất','0357426798',N'25 Mẹ Thứ, Cẩm Lệ, Đà Nẵng')

--Thiết bị:
insert into THIETBI VALUES ( 'GIAY',N'Giấy A4', N'Ram' ,24000),
						   ( 'DGL',N'Đinh ghim lớn', N'Hộp' ,25000),
						   ( 'DGV',N'Đinh ghim vừa', N'Hộp' ,19000),
						   ( 'DGN',N'Đinh ghim nhỏ', N'Hộp' ,11000),
						   ( 'MUC',N'Mực', N'Kg' ,300000)
--CUNG CẤP
INSERT INTO CUNGCAP VALUES ('000002',N'Công ty Thanh Giang',1500000, '2023/10/14'),
						   ('000003',N'Công ty Xuân Chất',2565000, '2023/10/14')
--cung cấp chi tiết
insert into CUNGCAP_CHITIET VALUES ('000003', 'GIAY',100,2400000),
								   ('000003', 'DGL',3,75000),
								   ('000003', 'DGN',3,33000),
								   ('000003', 'DGV',3,57000),
								   ('000002', 'MUC',5,1500000)

--SẢN PHẨM
INSERT INTO SANPHAM VALUES ('MS001', N'Nhập môn kinh doanh', 40000, N'Quyển'),
						   ('MS002', N'Lịch sử đảng', 25000, N'Quyển'),
						   ('MS003', N'Triết học Mác-Lênin', 30000, N'Quyển'),
						   ('MS004', N'Kinh tế vi mô', 35000, N'Quyển'),
INSERT INTO SANPHAM VALUES  ('MS005', N'Nhập môn kế toán', 25000, N'Quyển'),
						   ('MS006', N'Giao tiếp trong kinh doanh', 40000, N'Quyển'),
						   ('MS007', N'Pháp luật đại cương', 35000, N'Quyển'),
						   ('MS008', N'Marketing căn bản', 50000, N'Quyển'),
						   ('MS009', N'Luật kinh doanh', 30000, N'Quyển'),
						   ('MS010', N'Chủ nghĩa xã hội', 20000, N'Quyển'),
						   ('MS011', N'Mạng và truyền thông', 30000, N'Quyển'),
						   ('MS012', N'Kinh doanh quốc tế', 30000, N'Quyển'),
						   ('MS013', N'An toàn bảo mật', 10000, N'Quyển'),
INSERT INTO SANPHAM VALUES   ('MS014', N'Quản trị nhân sự', 20000, N'Quyển'),
						   ('MS015', N'Thiết kế web', 12000, N'Quyển'),
						   ('MS016', N'Thống kê kinh doanh', 40000, N'Quyển'),
						   ('MS017', N'Erp', 25000, N'Quyển'),
						   ('MS018', N'Tư tưởng HCM', 20000, N'Quyển'),
						   ('MS019', N'Tin học ứng dụng', 15000, N'Quyển'),
INSERT INTO SANPHAM VALUES  ('MS020', N'Quản trị học', 40000, N'Quyển'),
		INSERT INTO SANPHAM VALUES 				   ('MS021', N'Lịch sử đảng', 40000, N'Quyển')
					INSERT INTO SANPHAM VALUES 	   ('MS022', N'Xác xuất thống kê', 40000, N'Quyển')
		INSERT INTO SANPHAM VALUES 				   ('MS023', N'Hệ thống thông tin quản lý', 40000, N'Quyển')
			INSERT INTO SANPHAM VALUES 			   ('MS024', N'Tội phạm học', 15000, N'Quyển')
				INSERT INTO SANPHAM VALUES 		   ('MS025', N'Toán tài chính', 13000, N'Quyển')
							INSERT INTO SANPHAM VALUES 		   ('MS026', N'Đầu tư quốc tế', 20000, N'Quyển')
							INSERT INTO SANPHAM VALUES 		   ('MS027', N'Nghiệp vụ khách sạn', 15000, N'Quyển')
							INSERT INTO SANPHAM VALUES 		   ('MS028', N'Đầu tư tài chính', 15000, N'Quyển')
							INSERT INTO SANPHAM VALUES 		   ('MS029', N'Thị trường định chế', 20000, N'Quyển')
						 	INSERT INTO SANPHAM VALUES 		  ('MS030', N'English Composition', 60000, N'Quyển')
						  	INSERT INTO SANPHAM VALUES 		 ('MS031', N'Lập trình web', 35000, N'Quyển')
						  	INSERT INTO SANPHAM VALUES 		 ('MS032', N'Khai phá dữ liệu', 40000, N'Quyển')
						  	INSERT INTO SANPHAM VALUES 		 ('MS033', N'Kiểm thử phần mềm', 45000, N'Quyển')
						   	INSERT INTO SANPHAM VALUES 		('MS034', N'Học máy', 30000, N'Quyển')
						  	INSERT INTO SANPHAM VALUES 		 ('MS035', N'Trí tuệ nhân tạo', 17000, N'Quyển')

--MUA 
INSERT INTO MUA VALUES ('MSP001', 'KH001','2023/10/16',80000),
					   ('MSP002', 'KH002','2023/10/16',25000),
					   ('MSP003', 'KH003','2023/10/16',60000),
					   ('MSP004', 'KH004','2023/10/16',35000),
					   ('MSP005', 'KH005','2023/10/16',75000)

--MUA CHI TIẾT:
INSERT INTO MUA_CHITIET VALUES ('MSP001', 'MS001', 2, 80000),
							   ('MSP002', 'MS002', 1, 25000),
							   ('MSP003', 'MS003', 2, 60000),
							   ('MSP004', 'MS004', 1, 35000),
							   ('MSP005', 'MS005', 3, 75000)
--TÀI LIỆU
INSERT INTO TAILIEU VALUES (N'Đề cương ôn tập PLĐC', 5000),
						   (N'Đề kiểm tra tiếng anh', 25000),
						   (N'Đề ôn tập tư tưởng', 10000), 
						   (N'Đề kiểm tra B1', 30000), 
						   (N'Đề ôn tập môn lịch sử đảng',15000)
--ĐẶT HÀNG
INSERT INTO DAT VALUES ('MaDonTL01', 'KH006','2023/11/8','2023/11/9', 35000),
					   ('MaDonTL02', 'KH007','2023/11/9','2023/11/10', 25000),
					   ('MaDonTL03', 'KH008','2023/11/10','2023/11/11', 10000),
					   ('MaDonTL04', 'KH009','2023/11/11','2023/11/13', 30000),
					   ('MaDonTL05', 'KH0010','2023/11/15','2023/11/17', 30000)

--ĐẶT HÀNG CHI TIẾT
INSERT INTO DAT_CHITIET VALUES ('MaDonTL02', N'Đề kiểm tra tiếng anh',1, 25000),
							   ('MaDonTL03', N'Đề cương ôn tập PLĐC',2, 10000),
							   ('MaDonTL04', N'Đề kiểm tra B1',1, 30000),
							   ('MaDonTL01', N'Đề ôn tập môn lịch sử đảng',1, 15000)


 create index indexBang on sanpham(tensp)

