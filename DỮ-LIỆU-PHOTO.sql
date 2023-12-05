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

--KHÁCH HÀNG 1
INSERT INTO KHACHHANG_1 VALUES ('KH0001', N'Lê Thu Hương', '0369972135',N'18 Phan tứ, Ngũ Hành Sơn, Đà Nẵng'),
							   ('KH0002', N'Trần Văn Nam', '0857462112',N'73 Hàm tử, Ngũ Hành Sơn, Đà Nẵng'),
							   ('KH0003', N'Cao Duy Cường', '0917521869',N'53 Lê Thanh Nghị, Hòa Cường Bắc, Hải Châu, Đà Nẵng'),
							   ('KH0004', N'Nguyễn Đình Đức', '0338766512',N'Thanh Lương 17,Hòa Xuân, Cẩm Lệ, Đà Nẵng'),
							   ('KH0005', N'Cao Vân Anh', '0967346281',N'17 An Thượng 20, Bắc Mỹ An, Ngũ Hành Sơn, Đà Nẵng')


--KHÁCH HÀNG 2
INSERT INTO KHACHHANG_2 VALUES ('KH00010', N'Nguyễn Quang Hiếu', '0369972166'),
							   ('KH00011', N'Hoàng Mạnh Đức', '0857462222'),
							   ('KH00012', N'Phan Văn Hoàng', '0917521888'),
							   ('KH00013', N'Lê Anh Thư', '0338766555'),
							   ('KH00014', N'Nguyễn Thị Thùy Trang', '0967348881')

--SẢN PHẨM
INSERT INTO SANPHAM VALUES ('MS001', N'Nhập môn kinh doanh', 40000, N'Quyển'),
						   ('MS002', N'Lịch sử đảng', 25000, N'Quyển'),
						   ('MS003', N'Triết học Mác-Lênin', 30000, N'Quyển'),
						   ('MS004', N'Kinh tế vi mô', 35000, N'Quyển'),
						   ('MS005', N'Nhập môn kế toán', 25000, N'Quyển')

--MUA 
INSERT INTO MUA VALUES ('MSP001', 'KH0001','2023/10/16',80000),
					   ('MSP002', 'KH0002','2023/10/16',25000),
					   ('MSP003', 'KH0003','2023/10/16',60000),
					   ('MSP004', 'KH0004','2023/10/16',35000),
					   ('MSP005', 'KH0005','2023/10/16',75000)
select * from MUA_CHITIET
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
INSERT INTO DAT VALUES ('MaDonTL01', 'KH00010','2023/11/8','2023/11/9', 35000),
					   ('MaDonTL02', 'KH00011','2023/11/9','2023/11/10', 25000),
					   ('MaDonTL03', 'KH00012','2023/11/10','2023/11/11', 10000),
					   ('MaDonTL04', 'KH00013','2023/11/11','2023/11/13', 30000)

--ĐẶT HÀNG CHI TIẾT
INSERT INTO DAT_CHITIET VALUES ('MaDonTL02', N'Đề kiểm tra tiếng anh',1, 25000),
							   ('MaDonTL03', N'Đề cương ôn tập PLĐC',2, 10000),
							   ('MaDonTL04', N'Đề kiểm tra B1',1, 30000),
							   ('MaDonTL01', N'Đề ôn tập môn lịch sử đảng',1, 15000)


