/*****************************************************************
Created by:		NhamCT
Creation date:	2009/11/11
Overview:		Creating database structure & insert sample data
				into corresponding tables
*****************************************************************/
create database QUANLYNHANVIEN
GO
use QUANLYNHANVIEN

GO
create table PHONGBAN
(
MaPB		char(3) not null,
TenPB		nvarchar(50) not null,
NguoiQuanLy	char(5) not null,
primary key(MaPB)
)

GO

create table NHANVIEN
(
MaNV		char(5) not null,
TenNV		nvarchar(50) not null,
NgaySinh	date,
DiaChi		nvarchar(250),
Luong		money,
GioiTinh	bit,
MaPB		char(3) not null,
SoDT		varchar(12),
Email		varchar(100),
primary key(MaNV),
foreign key (MaPB) references PHONGBAN
)


GO
create table DUAN
(
MaDA		char(5)		not null,
TenDA		nvarchar(50) not null,
NgayBD		datetime	not null,
NgayKT		datetime	not null,
DiaDiem		nvarchar(50),
primary key(MaDA)
)

GO

create table THAMGIA
(
MaDA			char(5) not null,
MaNV			char(5) not null,
SoLuongNgayCong	numeric not null,
primary key(MaDA,MaNV),
foreign key(MaDA) references DUAN,
foreign key(MaNV) references NHANVIEN
)

GO
-- Insert data into database
insert into PhongBan values ('D01','DEV 1','N0077')
insert into PhongBan values ('D02','DEV 2','N0097')
insert into PhongBan values ('D03','DEV 3','N0152')
insert into PhongBan values ('D04','DEV 4','N0210')
insert into PhongBan values ('T01','TEST 1','N0232')
insert into PhongBan values ('T02','TEST 2','N0002')
insert into PhongBan values ('Q01','QA','N0013')
insert into PhongBan values ('S01','Sales','N0018')
insert into PhongBan values ('H01','Human resource','N0026')
insert into PhongBan values ('A01','Admin','N0021')

insert into DuAn values('DA001','Eximbank CRM','01/21/2013','08/15/2014','FPT Complex')
insert into DuAn values('DA002','Wings Reconstruct','01/05/2014','04/01/2015','FPT Complex')
insert into DuAn values('DA003','Migrate Sony DB','01/26/2013','11/16/2014','Osaka')
insert into DuAn values('DA004','Petronas HRM','01/25/2014','06/24/2015','Malaysia')
insert into DuAn values('DA005','Hiruka Medicine','01/09/2013','02/02/2014','Kyoto')
insert into DuAn values('DA006','Mobile contact','01/16/2016','05/15/2017','Kyoto')
insert into DuAn values('DA007','Tuxedo service','01/10/2016','04/30/2017','Kyoto')
insert into DuAn values('DA008','Nissen Chatbox','01/25/2016','03/22/2018','Osaka')
insert into DuAn values('DA009','Nissen sale system','01/16/2015','11/15/2017','Kyoto')
insert into DuAn values('DA010','Softbank CRM','01/27/2014','11/21/2016','Tokyto')
insert into DuAn values('DA011','Cloud Finance','01/09/2016','01/03/2017','FPT Complex')
insert into DuAn values('DA012','Security Test 01','01/12/2015','10/05/2015','FPT Complex')
insert into DuAn values('DA013','Security Test 02','01/13/2016','01/11/2018','FPT Complex')
insert into DuAn values('DA014','Security Test 03','01/29/2016','10/27/2018','FPT Complex')


insert into NhanVien values('N0001',N'Hà Công Lực','02/17/1984',N'NGUYỄN TIẾN DUẨN - THÔN 3 - XÃ DHÊYANG - EAHLEO - ĐĂKLĂK',2309,1,'T01','0931270720','')
insert into NhanVien values('N0002',N'Trần Đức Quý','05/12/1984',N'215/90 VÕ VĂN KIỆT, PHƯỜNG THANH XUÂN, TP BUÔN MA THUỘT, ĐĂK LĂK',1208,1,'T02','0902348763','')
insert into NhanVien values('N0003',N'Lê Quang Phong','12/07/1987',N'TRUNG THIỆN, DƯƠNG THỦY, LỆ THỦY, QUẢNG BÌNH.',2459,1,'T02','0982786713','')
insert into NhanVien values('N0004',N'Trần Văn Thiện Thanh','09/24/1981',N'19 ĐƯỜNG SỐ 1, ĐIỆN QUANG, ĐIỆN BÀN, QUẢNG NAM',2412,1,'T02','0905193776','')
insert into NhanVien values('N0006',N'Nguyễn Quang Công Minh','07/14/1990',N'HÒA SƠN, HÒA VANG, ĐÀ NẴNG',1851,0,'T02','01644041703','')
insert into NhanVien values('N0007',N'Trần Trương Thiện Nguyên','03/22/1981',N'TỔ DÂN PHỐ 4,P NAM LÝ, TP ĐỒNG HỚI, QUẢNG BÌNH',2283,1,'T02','0985505552','')
insert into NhanVien values('N0008',N'Nguyễn Lê Minh Quân','01/08/1987',N'K79/4 THANH THỦY, HẢI CHÂU, ĐÀ NẴNG',1722,0,'T02','01269760389','')
insert into NhanVien values('N0009',N'Nguyễn Văn Linh','12/04/1988',N'',1484,0,'T02','0965288897','')
insert into NhanVien values('N0010',N'Đặng Nhật Phong','03/28/1981',N'K907 NGUYỄN LƯƠNG BẰNG- QUẬN LIÊU CHIỂU- ĐÀ NẴNG',303,1,'T02','0901960350','')
insert into NhanVien values('N0011',N'Lê Tấn Anh Quốc','09/02/1992',N'THÔN THANH QUÝT 1, ĐIỆN THẮNG TRUNG, ĐIỆN BÀN, QUẢNG NAM',1313,0,'T02','01283388103','')
insert into NhanVien values('N0012',N'Hứa Văn Đại','07/24/1980',N'TỔ 27A, NẠI HIÊN ĐÔNG, SƠN TRÀ, TP. ĐÀ NẴNG',535,0,'T01','01638843209','')
insert into NhanVien values('N0013',N'Hồ Quỳnh Hữu Phát','07/22/1990',N'PHAN THỊ HỒNG PHƯỢNG, THÔN 1B, XÃ ĐỒNG TRẠCH, BỐ TRẠCH, QUẢNG BÌNH',2329,0,'Q01','01219688656','')
insert into NhanVien values('N0014',N'Phan Nguyên Anh','06/15/1991',N'KHỐI HẬU XÁ, TỔ 37, PHƯỜNG THANH HÀ, TP. HỘI AN, TỈNH QUẢNG NAM.',1670,1,'Q01','0905556510','')
insert into NhanVien values('N0015',N'Trương Quang Hòa','06/27/1980',N'294 HUỲNH THÚC KHÁNG, AN XUÂN, TAM KỲ, QUẢNG NAM',731,1,'Q01','0935270776','')
insert into NhanVien values('N0016',N'Lê Anh Huy','07/17/1979',N'',2236,0,'Q01','01282157875','')
insert into NhanVien values('N0017',N'Hồ Trần Nhật Khánh','07/26/1987',N'193/12 NÚI THÀNH, PHƯỜNG HÒA CƯỜNG BẮC, HẢI CHÂU, ĐÀ NẴNG',2467,1,'Q01','01265323711','')
insert into NhanVien values('N0018',N'Lê Minh Trí','04/16/1985',N'',1659,0,'S01','0962883220','')
insert into NhanVien values('N0019',N'Phan Công Diễn','10/26/1981',N'TỔ 19 - PHƯỜNG PHƯỚC MỸ - SƠN TRÀ - ĐÀ NẴNG ',2462,0,'S01','01689084633','')
insert into NhanVien values('N0020',N'Nguyễn Xuân Anh','05/01/1987',N'',1810,0,'S01','01652512225','')
insert into NhanVien values('N0021',N'Nguyễn Tiến Trung','07/12/1988',N'1/45 QUANG TRUNG, KHU PHỐ 2, PHƯỜNG 2, THỊ XÃ QUẢNG TRỊ, TỈNH QUẢNG TRỊ.',2240,1,'A01','0975208772','')
insert into NhanVien values('N0022',N'Lê Hoàng Duy','10/25/1988',N'15A VÕ VĂN TẦN, QUY NHƠN, BÌNH ĐỊNH',880,1,'A01','01269162146','')
insert into NhanVien values('N0023',N'Trần Ngọc Quốc','06/11/1983',N'',1948,1,'A01','0978354865','')
insert into NhanVien values('N0024',N'Huỳnh Tấn Dũng','05/01/1990',N'KHU VỰC VẠN THUẬN, PHƯỜNG NHƠN THÀNH, TX AN NHƠN, BÌNH ĐỊNH',1365,0,'A01','0964318076','')
insert into NhanVien values('N0025',N'Trần Quang Khải','05/21/1993',N'KIỆT 38 TÔN THẤT SƠN, THỦY PHƯƠNG, HƯƠNG THỦY, TT HUẾ',2362,0,'A01','0976308098','')
insert into NhanVien values('N0026',N'Nguyễn Trí Hùng','02/28/1987',N'HUỲNH HÙNG, THÔN 4, XÃ HÒA PHONG, KRÔNG BÔNG, ĐĂK LĂK',858,1,'H01','0966654330','')
insert into NhanVien values('N0027',N'Dương Ngọc Long','09/14/1981',N'01 THOẠI NGỌC HẦU, TAM KỲ, QUẢNG NAM',1683,0,'H01','01648438000','')
insert into NhanVien values('N0028',N'Trương Nhật Minh','03/08/1984',N'TỔ 37B KHU VỰC 4, SỐ NHÀ 20/6A CHI LĂNG, QUY NHƠN, BÌNH ĐỊNH',1596,1,'H01','0935700123','')
insert into NhanVien values('N0029',N'Lê Nguyễn Hoàng Văn','10/18/1984',N'SỐ 31 ĐƯỜNG HÒA MINH 4, LIÊN CHIỂU, ĐÀ NẴNG',1382,0,'H01','0935604934','')
insert into NhanVien values('N0030',N'Nguyễn Văn Hoàng Long','04/13/1991',N'',1872,0,'H01','0905939426','')
insert into NhanVien values('N0031',N'Trần Phước Đạt','05/07/1991',N'11 THÚC TỀ, THANH KHÊ, TP. ĐÀ NẴNG',622,1,'H01','01224064353','')
insert into NhanVien values('N0032',N'Phạm Duy Khánh','01/23/1993',N'08/38 TRẦN BÌNH TRỌNG - P. ĐÔNG SƠN - TP THANH HÓA',1635,0,'H01','0932517402','')
insert into NhanVien values('N0033',N'Lương Minh Hiếu','08/12/1991',N'ĐỘI 7, THÔN 8, TAM LỘC, PHÚ NINH, QUẢNG NAM',2362,0,'A01','01202023287','')
insert into NhanVien values('N0034',N'Nguyễn Ngọc Thắng','02/13/1995',N'16 LÝ THÁNH TÔNG, ĐỒNG HỚI, QUẢNG BÌNH',1823,0,'A01','0982805825','')
insert into NhanVien values('N0035',N'Trương Duy Tường','12/10/1981',N'ĐỘI 1 - PHAN XÁ - XUÂN THỦY - LỆ THỦY - QuẢNG BÌNH',1206,1,'A01','0935777298','')
insert into NhanVien values('N0036',N'Nguyễn Thái Quí','03/23/1982',N'TỔ 45 ĐA PHƯỚC II, HÒA KHÁNH BẮC, LIÊN CHIỂU, ĐÀ NẴNG',1653,1,'A01','0905886802','')
insert into NhanVien values('N0037',N'Võ Văn Thái Sơn','12/25/1985',N'487 TRẦN CAO VÂN, TP. ĐÀ NẴNG',1373,0,'A01','01208776312','')
insert into NhanVien values('N0038',N'Cao Thiên Sơn','10/01/1990',N'KHỐI PHỐ TỨ HÀ, ĐIỆN NGỌC, ĐIỆN BÀN, QUẢNG NAM',2301,1,'D01','01654217772','')
insert into NhanVien values('N0039',N'Cái Xuân Hậu','05/20/1993',N'43 ĐỖ NHUẬN, ĐÀ NẴNG',578,0,'D04','0969590517','')
insert into NhanVien values('N0040',N'Đinh Quang Khánh','09/01/1979',N'05 QUANG TRUNG - KHỐI I - TT ĐĂK MIL - H. ĐĂK MIL - ĐĂK NÔNG',481,1,'D02','0914660398','')
insert into NhanVien values('N0041',N'Văn Ngọc Ninh','07/24/1995',N'TỔ 38, HÒA HIỆP NAM, LIÊN CHIỂU, ĐÀ NẴNG',2021,0,'D04','0914163750','')
insert into NhanVien values('N0042',N'Ngô Văn Viên','11/11/1988',N'K89/47 LÊ VĂN HƯU, PHƯỜNG MỸ AN, NGŨ HÀNH SƠN, ĐÀ NẴNG',1754,0,'D01','','')
insert into NhanVien values('N0043',N'Lê Huy Nhật Tài','07/27/1991',N'',1716,1,'D01','0936185901','')
insert into NhanVien values('N0044',N'Văn Qúy Sang','10/16/1992',N'370 HÙNG VƯƠNG, HỘI AN, QUẢNG NAM',2430,0,'D02','01656730217','')
insert into NhanVien values('N0045',N'Nguyễn Hoàng Hưng','01/10/1993',N'',1108,0,'D03','','')
insert into NhanVien values('N0046',N'Hoàng Nhân Đức','02/27/1987',N'',1334,0,'D02','01645500071','')
insert into NhanVien values('N0047',N'Nguyễn Đức Thanh','10/01/1984',N'K111/17 ĐƯỜNG 2-9, HẢI CHÂU, ĐÀ NẴNG',1002,1,'D04','01646636030','')
insert into NhanVien values('N0048',N'Phan Quang Vũ','05/16/1983',N'41 ĐINH TIÊN HOÀNG, KHÓM VĨNH BẮC, HỒ XÁ, VĨNH LINH, QUẢNG TRỊ',1518,0,'D04','0934315950','')
insert into NhanVien values('N0049',N'Võ Đình Hiếu','09/18/1988',N'724B TRẦN CAO VÂN, THANH KHÊ, ĐÀ NẴNG',1208,1,'D03','0903986291','')
insert into NhanVien values('N0050',N'Nguyễn Đình Lưu','01/01/1989',N'BƯU ĐIỆN BÌNH TRỊ, THĂNG BÌNH, QUẢNG NAM',339,0,'D01','0935883503','')
insert into NhanVien values('N0051',N'Mai Văn Thạnh','02/05/1979',N'SỐ 18 AN TÚ CÔNG CHÚA, PHƯỜNG MỸ AN, NGŨ HÀNH SƠN, TP. ĐÀ NẴNG',252,1,'D04','01683009855','')
insert into NhanVien values('N0052',N'Lê Minh Hoàng','03/17/1983',N'06 NGUYỄN THỊ ĐỊNH, SƠN TRÀ, ĐÀ NẴNG',1960,0,'D04','0194574237','')
insert into NhanVien values('N0053',N'Nguyễn Trung Dũng','02/11/1985',N'NGUYỄN THỊ MINH TRÂM, DN BITIS ĐÀ NẴNG, ĐƯỜNG SỐ 2, KCN HÒA KHÁNH, ĐÀ NẴNG',2164,0,'D04','01673274977','')
insert into NhanVien values('N0054',N'Nguyễn Thanh Hải','01/27/1989',N'THÔN ĐÔNG GIA, ĐẠI MINH, ĐẠI LỘC, QUẢNG NAM',1635,1,'D04','01673275389','')
insert into NhanVien values('N0055',N'Tchang Quân Phát','12/19/1993',N'8/2c Phạm Hồng Thái, P.Vĩnh Ninh, TP Huế, Thừa Thiên Huế',396,1,'D02','0937078302','')
insert into NhanVien values('N0056',N'Hứa Minh Tuấn','12/01/1981',N'467 LẠC LONG QUÂN - TT. LĂNG CÔ - PHÚ LỘC - HUẾ',515,0,'D02','','')
insert into NhanVien values('N0057',N'Nguyễn Tiến Minh','01/10/1980',N'THÔN 3, QUẾ CƯỜNG, QUẾ SƠN, QUẢNG NAM',1234,0,'D02','01236547399','')
insert into NhanVien values('N0058',N'Phan Phạm Tuấn','06/20/1985',N'Số nhà 243- tổ 129- Thái Thị Bôi-Chính Gián-Thanh Khê-Đà Nẵng',1500,0,'D02','0984904773','')
insert into NhanVien values('N0059',N'Hà Thúc Đạt','11/05/1983',N'K6/04 PHẠM QUANG ÁNH - SƠN TRÀ - ĐÀ NẴNG',2430,1,'D02','0901984677','')
insert into NhanVien values('N0060',N'Nguyễn Tấn Hiếu','09/30/1980',N'TỔ 6B AN KHÊ - THANH KHÊ - ĐÀ NẴNG',1613,1,'S01','01224473993','')
insert into NhanVien values('N0061',N'Nguyễn  Hưng','11/17/1982',N'TỔ 11 PHƯỜNG HÒA THỌ ĐÔNG, CẨM LỆ, ĐÀ NẴNG',1645,1,'S01','01692470680','')
insert into NhanVien values('N0062',N'Nguyễn Ngọc Vinh','03/06/1982',N'39/14 HuỲNH THÚC KHÁNG - ĐÔNG HÀ - QuẢNG TRỊ',428,0,'S01','0935683097','')
insert into NhanVien values('N0063',N'Nguyễn Duyên Hòa','06/17/1990',N'VIÊM TÂY 2 - ĐiỆN THẮNG BẮC - ĐiỆN BÀN - QuẢNG NAM',2478,1,'D01','0935555224','')
insert into NhanVien values('N0064',N'Nguyễn Xuân Hóa','06/10/1980',N'43 HỒ NGUYÊN TRỪNG, PHƯỜNG HÒA CƯỜNG NAM, QUẬN HẢI CHÂU, ĐÀ NẴNG.',2281,1,'D04','0935678607','')
insert into NhanVien values('N0065',N'Dương Xuân Nhân','01/18/1978',N'K375/2 Nguyễn Phước Nguyên - Đà Nẵng',758,1,'D04','0914578854','')
insert into NhanVien values('N0066',N'Lê Thanh Bình','05/29/1992',N'H20/35 BÙI CHÁT - HÒA KHÁNH BẮC - ĐÀ NẴNG',1594,1,'D02','01283322807','')
insert into NhanVien values('N0067',N'Trần Duy Khương','05/20/1979',N'178 lí thường kiệt',2086,0,'D04','01263930059','')
insert into NhanVien values('N0068',N'Hồ Thanh Hậu','09/10/1981',N'',1680,0,'D01','0969981787','')
insert into NhanVien values('N0069',N'Nguyễn Ngọc Hổ','10/15/1995',N'',1019,0,'D04','0938828842','')
insert into NhanVien values('N0070',N'Trần Ngọc Đạt','08/16/1995',N'Quá Giáng 1, Hòa Phước, Hòa Vang, Đà Nẵng',1678,1,'D03','01204452618','')
insert into NhanVien values('N0071',N'Huỳnh Như Hân','08/25/1985',N'Tiên Lập, Tiên Phước, Quảng Nam',630,1,'D01','01636438640','')
insert into NhanVien values('N0072',N'Phạm Thanh Trường','05/25/1988',N'',1927,0,'D01','0913830083','')
insert into NhanVien values('N0073',N'Nguyễn Đắc Khôi Nguyên','01/08/1990',N'K218 Nguyễn Duy Hạnh',518,1,'D03','01223244480','')
insert into NhanVien values('N0074',N'Huỳnh Anh Tuấn','05/05/1985',N'Giáo Tây, Đại Hòa, Đại Lộc, Quảng Nam',1649,1,'D01','01268473999','')
insert into NhanVien values('N0075',N'Phạm Tấn Thành','02/04/1992',N'58 HÙNG VƯƠNG, TX BA ĐỒN, QUẢNG BÌNH',1293,1,'D04','0935023182','')
insert into NhanVien values('N0076',N'Phạm Hồng Nam','02/13/1991',N'THÔN PHÚ HƯNG, XÃ TAM XUÂN 1, NÚI THÀNH, QUẢNG NAM',1954,1,'D04','0977520269','')
insert into NhanVien values('N0077',N'Nguyễn Chí Tâm','12/18/1980',N'79 BÀ TRIỆU, PHƯỜNG I, TP ĐÔNG HÀ, QUẢNG TRỊ',2393,1,'D01','01692306223','')
insert into NhanVien values('N0078',N'Nguyễn Quốc Hòa','01/26/1992',N'412 CÁCH MẠNG THÁNG 8, QUẬN CẨM LỆ, ĐÀ NẴNG',794,1,'D01','01653706190','')
insert into NhanVien values('N0079',N'Đoàn Lê Quốc Dương','03/21/1993',N'CỔ BƯU, HƯƠNG AN, HƯƠNG TRÀ, TT HUẾ',1041,0,'D04','0905148740','')
insert into NhanVien values('N0080',N'Phan Lê Minh Trí','07/16/1982',N'196/9 NGUYỄN CÔNG TRỨ, SƠN TRÀ, ĐÀ NẴNG',2449,0,'D01','01266707768','')
insert into NhanVien values('N0081',N'Nguyễn Lâm Duy','08/20/1988',N'1146 TRƯỜNG CHINH, ĐÀ NẴNG',823,0,'D04','0905054983','')
insert into NhanVien values('N0082',N'Nguyễn Huy Hoàng','08/27/1982',N'THÁI THANH HIỀN, THÔN LONG QUANG, XÃ TRIỆU TRẠCH, TRIỆU PHONG, QUẢNG TRỊ',1716,0,'D01','0968851885','')
insert into NhanVien values('N0083',N'Ông Huỳnh Bảo Phước','11/11/1992',N'K353/50 CÁCH MẠNG THÁNG TÁM, CẨM LỆ, ĐÀ NẴNG',485,0,'D03','0126818821','')
insert into NhanVien values('N0084',N'Nguyễn Lâm Thiên Phú','08/11/1992',N'TDP3-P TỨ HẠ, HƯƠNG TRÀ, TT HUẾ',2091,1,'D04','01263237991','')

insert into NhanVien values('N0086',N'Đỗ Văn Tú','08/11/1980',N'67 Trần Văn Dư, Mỹ An, Ngũ Hành Sơn Đà Nẵng',2278,0,'D01','01202380897','')
insert into NhanVien values('N0087',N'Nguyễn Đức Quang','03/03/1984',N'tổ 4,Bình Lãnh,Thăng Bình',858,1,'D04','01266665648','')
insert into NhanVien values('N0088',N'Nguyễn Phước Hải','10/06/1992',N'thôn Thanh Tân - Phong Sơn - Phong Điền - TT. Huế',1967,0,'D04','0949216121','')
insert into NhanVien values('N0089',N'Đỗ Chấn Huy','10/01/1983',N'',1579,0,'D03','0935233110','')
insert into NhanVien values('N0090',N'Nguyễn Văn Phước','03/10/1993',N'',2355,1,'D04','01662562092','')
insert into NhanVien values('N0091',N'Nguyễn Văn Duy Thiện','08/08/1981',N'Gò Chu, Sơn Thành, Sơn Hà, Quãng Ngãi',983,0,'D01','01674529929','')
insert into NhanVien values('N0092',N'Nguyễn Văn Thành','03/15/1992',N'',1300,1,'D01','01282114165','')
insert into NhanVien values('N0093',N'Hồ Thanh Sơn','03/21/1994',N'',1225,1,'D02','','')
insert into NhanVien values('N0094',N'Hồ Viết Tín','11/06/1981',N'Tổ 6, Hà Lam, Thăng Bình, QUảng Nam',1038,0,'D01','01212912984','')
insert into NhanVien values('N0095',N'Võ Quang Duy','08/11/1983',N'',536,0,'D02','01282128217','')
insert into NhanVien values('N0096',N'Phạm Minh Hưng','05/04/1986',N'K387/36 LÊ DUẨN, ĐÀ NẴNG',514,0,'D04','01202484368','')
insert into NhanVien values('N0097',N'Nguyễn Quang Nhật','11/06/1993',N'LỚP 12A3 - THPT TRẦN PHÚ - H. TUY AN - PHÚ YÊN',1210,0,'D02','0905963008','')

insert into NhanVien values('N0099',N'Nguyễn Công Thành','03/24/1979',N'số nhà 40, tổ Quyết Tiến,  phường Dileya, Krong Năng, tỉnh Đăk lăk',2273,1,'T02','0935811269','')
insert into NhanVien values('N0100',N'Trần Minh Thiện','04/18/1994',N'',1910,1,'T02','01684117306','')
insert into NhanVien values('N0101',N'Hồ Tấn Đạt','12/11/1981',N'Vĩnh Trà Bình Thạnh Bình Sơn Quảng Ngãi',512,0,'T02','01883750379','')
insert into NhanVien values('N0102',N'Nguyễn Thế Long','08/27/1989',N'',1125,1,'T02','01627578990','')
insert into NhanVien values('N0103',N'Nguyễn Thị Thùy Anh','11/23/1979',N'Thôn 10 Bình Nguyên, Thăng Bình, Quảng Nam',2384,0,'T01','0972868171','')
insert into NhanVien values('N0104',N'Lê Hà Mạnh Linh','03/11/1985',N'THÔN PHÚ BÌNH 2, XÃ CAM TÂN, HUYỆN CAM LÂM , TỈNH KHÁNH HÒA',2132,1,'T02','979017555','')
insert into NhanVien values('N0105',N'Lê Tuấn Anh','03/22/1980',N'37 HUỲNH THÚC KHÁNG, LAO BẢO, HƯỚNG HÓA, QUẢNG TRỊ',1321,0,'T02','0935055094','')
insert into NhanVien values('N0106',N'Nguyễn Phúc Bảo Chương','10/16/1987',N'LÔ 26 - PHAN THÀNH TÀI - HẢI CHÂU - ĐÀ NẴNG',1941,1,'T02','0968794323','')
insert into NhanVien values('N0107',N'Nguyễn Quốc Cường','03/23/1982',N'76 HỒ HUÂN NGHIỆP, ĐÀ NẴNG',433,0,'T01','01676268347','')
insert into NhanVien values('N0108',N'Nguyễn Mạnh Cường','05/31/1980',N'THÔN ĐÔNG HÒA - ĐiỆN THỌ - ĐiỆN BÀN - QuẢNG NAM',607,0,'T02','0902806301','')
insert into NhanVien values('N0109',N'Nguyễn Văn Đông','06/17/1978',N'15 NGUYỄN BỈNH KHIÊM, ĐÀ NẴNG',1281,1,'T01','0968954143','')
insert into NhanVien values('N0110',N'Ngô Hoàng Đức','09/19/1991',N'TỔ DÂN PHỐ 10, CHƯ SÊ, GIA LAI',770,0,'T01','01268475911','')
insert into NhanVien values('N0111',N'Trần Phan Hoàng Đức','09/09/1986',N'TỔ 5, THÔN HƯƠNG QUẾ ĐÔNG, QUẾ PHÚ, QUẾ SƠN, QUẢNG NAM',2445,1,'T01','01266787967','')
insert into NhanVien values('N0112',N'Ngô Trùng Dương','01/06/1984',N'',732,0,'T01','0963698073','')
insert into NhanVien values('N0113',N'Phạm  Duy','03/01/1980',N'',2012,0,'T01','0903530875','')
insert into NhanVien values('N0114',N'Tô Hữu Giang','02/22/1994',N'57/8 Trần Quốc Toản Đà Nẵng',555,1,'T01','01693334228','')
insert into NhanVien values('N0115',N'Nguyễn Thanh Hà','01/21/1985',N'232 Nguyễn Như Hạnh',2347,0,'T01','0905887469','')
insert into NhanVien values('N0116',N'Nguyễn Đỗ Trung Hiếu','03/12/1994',N'52 THÔN GIANG THỊNH - XÃ TAM GIANG - KRÔNG NĂNG - ĐĂK LĂK',1292,1,'T02','0905171067','')
insert into NhanVien values('N0117',N'Trần Minh Hiếu','11/03/1992',N'TỔ 12, THÔN HÒA VANG, XÃ LỘC BỔN, HUYỆN PHÚ LỘC, TỈNH TT. HUẾ.',1165,0,'T01','0963847224','')
insert into NhanVien values('N0118',N'Nguyễn Bá Hoàng','10/05/1980',N'34 ANH HÙNG NÚP, TỔ 7,  KÔNG CHRO, GIA LAI',2261,1,'T02','0905619139','')
insert into NhanVien values('N0119',N'Nguyễn Hữu Khánh Hoàng','01/27/1991',N'K82 đường Nguyễn Lương Bằng, phường Hòa Khánh Bắc, Liên Chiểu, Đà nẵng',1118,0,'T02','01205475250','')

insert into NhanVien values('N0121',N'Nguyễn Đình Khanh','11/06/1991',N'368 Q Trung',2383,1,'T02','0905459748','')
insert into NhanVien values('N0122',N'Nguyễn Duy Khánh','02/12/1991',N'159/18 Trần Thái Tông, Đà nẵng',1034,0,'T01','01672428550','')
insert into NhanVien values('N0123',N'Nguyễn Thanh Liêm','01/01/1988',N'thôn Nhị Dinh I, XÃ ĐIỆN PHƯỚC, ĐIỆN BÀN, QUẢNG NAM',1558,1,'T02','01634438905','')
insert into NhanVien values('N0124',N'Hoàng Văn Lực','07/26/1990',N'KP HƯƠNG TRUNG, P. HÒA HƯƠNG, TP TAM KỲ, QUẢNG NAM',1045,1,'T02','0935664110','')
insert into NhanVien values('N0125',N'Nguyễn Sư Nhật Nam','11/02/1980',N'54 TRƯƠNG CHÍ CƯƠNG, HÒA CƯỜNG NAM, TP. ĐÀ NẴNG',697,0,'T02','0905066355','')
insert into NhanVien values('N0126',N'Nguyễn Phú Thạch','10/14/1993',N'119 Trần Xuân Lê, Thanh Khê, Đà Nẵng',461,0,'T01','01684315518','')
insert into NhanVien values('N0127',N'Nguyễn Văn Thiện Duy','07/20/1979',N'',412,1,'T02','01627774178','')
insert into NhanVien values('N0128',N'Nguyễn Phương Nam','03/07/1994',N'',576,0,'T01','01228200123','')
insert into NhanVien values('N0129',N'Nguyễn Diệu Ngân','01/27/1995',N'Tổ 5 - thôn An Dưỡng - Bình An - Thăng Bình - Quảng Nam',1306,1,'T01','0985909546','')
insert into NhanVien values('N0130',N'Nguyễn Võ Ngọc','01/18/1995',N'',850,0,'T01','0964013009','')
insert into NhanVien values('N0131',N'Nguyễn Quý Cao Nguyên','06/05/1980',N'',1556,0,'T01','0968770608','')
insert into NhanVien values('N0132',N'Nguyễn Viết Niệm','05/17/1991',N'18 Nguyễn Duy Hiệu, Đà Nẵng',1592,1,'T02','0986710052','')
insert into NhanVien values('N0133',N'Nguyễn Duy Phương','10/24/1985',N'',694,0,'T02','0935640152','')
insert into NhanVien values('N0134',N'Dương Công Minh Sơn','12/25/1988',N'TDP 2, THỊ TRẤN PHÚ THUẬN, HUYỆN PHÚ THUẬN, TỈNH GIA LAI',528,1,'T01','','')
insert into NhanVien values('N0135',N'Hoàng Văn Tài','08/05/1981',N'18/121 NGÔ ĐỨC KẾ - THUẬN LỘC - TP HUẾ',1799,0,'T02','01284072754','')
insert into NhanVien values('N0136',N'Phan Công Tài','04/26/1986',N'41 ĐỖ QUANG, LÃNH THƯỢNG 2, ĐÔNG PHÚ, QUẾ SƠN, QUẢNG NAM',263,0,'T02','01663078878','')
insert into NhanVien values('N0137',N'Nguyễn Tấn Tâm','05/04/1991',N'320 NGŨ HÀNH SƠN, TP. ĐÀ NẴNG',282,0,'T01','01662392653','')
insert into NhanVien values('N0138',N'Nguyễn Bá Thắng','02/26/1994',N'718/14 TRẦN CAO VÂN, THANH KHÊ, ĐÀ NẴNG',1597,0,'T02','0975982325','')
insert into NhanVien values('N0139',N'Nguyễn Tấn Thành','09/04/1987',N'',980,0,'T02','0906453811','')
insert into NhanVien values('N0140',N'Trần Quốc Thịnh','01/02/1995',N'K10 H23/4 PHẠM VĂN NGHỊ, ĐÀ NẴNG',538,1,'D04','01282139838','')
insert into NhanVien values('N0141',N'Lê Thành Trí','09/15/1989',N'313 HÙNG VƯƠNG, TAM KỲ, QUẢNG NAM',2051,0,'D04','01269880253','')
insert into NhanVien values('N0142',N'Phan  Trung','08/28/1983',N'K202H19/17 Hoàng Văn Thái, Hòa Khánh Nam, Liên Chiểu, Đà Nẵng',1342,1,'D04','01658370947','')
insert into NhanVien values('N0143',N'Đỗ Quang Anh Kiệt','11/12/1982',N'',763,0,'D01','0935385717','')
insert into NhanVien values('N0144',N'Đặng Văn Nhật Trường','11/13/1989',N'',1521,0,'D02','01658000788','')
insert into NhanVien values('N0145',N'Phạm Quốc Đức','05/14/1993',N'',2484,1,'D02','01202456566','')
insert into NhanVien values('N0146',N'Đặng Văn Phước','08/26/1991',N'SỐ 8, đường số 1 thôn Thạnh mỹ, xã Điện Quang, Điện Bàn, Quảng Nam',2387,1,'D03','0905025836','')
insert into NhanVien values('N0147',N'Nguyễn Khắc Đạt','02/01/1992',N'K74/18 TRẦN CAO VÂN, QUẬN THANH KHÊ, THÀNH PHỐ ĐÀ NẴNG',2037,1,'D01','01692321212','')
insert into NhanVien values('N0148',N'Trần Anh Quyết','09/20/1987',N'25 ĐỖ NHUẬN, LIÊN CHIỂU, ĐÀ NẴNG',585,1,'D01','0934773751','')
insert into NhanVien values('N0149',N'Trần Quốc Trung','06/03/1989',N'157 HOÀNG VĂN THÁI, TỔ 134 HÒA KHÁNH NAM, LIÊN CHIỂU, ĐÀ NẴNG',2005,0,'D03','01652005656','')
insert into NhanVien values('N0150',N'Trần Thanh Vĩnh','05/17/1983',N'',2188,0,'D01','0932693129','')
insert into NhanVien values('N0151',N'Lê  Tuấn','06/06/1990',N'100 DUY TÂN TỔ 3, P. DIÊN HỒNG, TP. PLEIKU, GIA LAI',2197,0,'D03','0903103462','')
insert into NhanVien values('N0152',N'Cao Võ Hoàng Lâm','03/23/1992',N'K218/04 HOÀNG VĂN THÁI, LIÊN CHIỂU, TP. ĐÀ NẴNG',968,1,'D03','0905071175','')
insert into NhanVien values('N0153',N'Huỳnh Trần Cường','03/09/1981',N'',1084,0,'D01','01674907415','')
insert into NhanVien values('N0154',N'Võ Thị Diệu Hiền','02/20/1995',N'49 TRIỆU NỮ VƯƠNG - ĐÀ NẴNG',2204,0,'D01','0969868396','')
insert into NhanVien values('N0155',N'Cao Vũ Kỳ','02/21/1979',N'',541,1,'D04','01658856519','')
insert into NhanVien values('N0156',N'Lưu Quang Minh','03/10/1980',N'K338/60 HOÀNG DiỆU, HẢI CHÂU, ĐÀ NẴNG',1223,0,'D01','0935197140','')
insert into NhanVien values('N0157',N'Trần Văn Nghĩa','05/17/1989',N'91 NGÔ TẤT TỐ, TP ĐÀ NẴNG',1864,1,'D02','0935164857','')
insert into NhanVien values('N0158',N'Đinh Trọng Nguyên','10/29/1987',N'KỲ LONG, KỲ ANH, HÀ TĨNH',1725,1,'D02','01226253498','')
insert into NhanVien values('N0159',N'Hoàng Thanh Thiên','08/20/1990',N'TDP LONG THÀNH - KỲ LONG - KỲ ANH - HÀ TĨNH',2225,0,'D04','01669833802','')
insert into NhanVien values('N0160',N'Lê Văn Thức','03/27/1994',N'122 TRẦN CAO VÂN, HỘI AN, QUẢNG NAM',786,0,'D03','01215715917','')
insert into NhanVien values('N0161',N'Hoàng Quốc Khánh','11/20/1978',N'71 LÊ VĂN HIẾN, PHƯỜNG KHUÊ MỸ, NGŨ HÀNH SƠN, ĐÀ NẴNG',2089,0,'D01','0945591198','')
insert into NhanVien values('N0162',N'Lê Nguyễn Song Toàn','03/28/1986',N'Tây Giang, Bình Sa, Thăng Bình, Quảng Nam',2335,0,'D01','01639070195','')
insert into NhanVien values('N0163',N'Trịnh Văn Tuấn','06/23/1993',N'',510,0,'D01','01672071477','')
insert into NhanVien values('N0164',N'Mai Nguyễn Quốc Việt','05/15/1982',N'14 Nguyễn Tri Phương, TT Lao Bảo, Hướng Hóa, Quảng Trị',1228,1,'D01','01257943766','')
insert into NhanVien values('N0165',N'Nguyễn Duy Anh','08/07/1979',N'66 Bàu Làng, Q. Thanh Khê, TP Đà Nẵng',2112,0,'D01','0932635802','')
insert into NhanVien values('N0166',N'Nguyễn Minh Phước','04/29/1982',N'',2245,1,'D03','0905478354','')
insert into NhanVien values('N0167',N'Lê Quốc Huy','06/05/1995',N'',2358,1,'D04','01627771998','')
insert into NhanVien values('N0168',N'Nguyễn Tấn Philíp','06/10/1989',N'',795,0,'D01','01212026686','')
insert into NhanVien values('N0169',N'Nguyễn Văn Hữu Phước','06/24/1982',N'',1487,1,'D04','0943829420','')
insert into NhanVien values('N0170',N'Phạm Hồ Minh Quân','12/03/1981',N'Hương An, Quế Sơn, Quảng Nam',2432,1,'D03','01677039331','')
insert into NhanVien values('N0171',N'Hoàng Kim Quý','01/09/1994',N'',520,1,'D02','0963585637','')
insert into NhanVien values('N0172',N'Nguyễn Đắc Quý','07/20/1978',N'29 Trần hưng đạo, đaknong',2303,0,'D02','01216782141','')
insert into NhanVien values('N0173',N'Hà Ngọc Quang Trí','02/06/1979',N'Lăng Cô, Phú Lộc, Thừa Thiên Huế',1054,0,'D03','01214218717','')
insert into NhanVien values('N0174',N'Lê  Hòa','03/23/1992',N'',1969,0,'D01','0971880953','')
insert into NhanVien values('N0175',N'Nguyễn Văn Tuấn','11/11/1988',N'Tổ 4',437,1,'D01','0935175980','')
insert into NhanVien values('N0176',N'Lê Trung Huy','02/02/1979',N'',1465,1,'D02','0935301104','')
insert into NhanVien values('N0177',N'Nguyễn Tấn Phước','12/21/1987',N'',2207,1,'D04','01633529950','')
insert into NhanVien values('N0178',N'Nguyễn Đồng Hoàng Dương','09/05/1987',N'',1795,1,'D02','0905345657','')
insert into NhanVien values('N0179',N'Trần Thái Pháp','09/01/1989',N'Hòa Bình, Thạch Đồng, Hà Tĩnh.',1633,0,'D02','01682900870','')
insert into NhanVien values('N0180',N'Nguyễn Đăng Khanh','12/15/1978',N'113 - KHU CHUNG CƯ NAM CẦU TIÊN SƠN - NGŨ HÀNH SƠN - ĐÀ NẴNG ',1432,1,'D04','0932546386','')
insert into NhanVien values('N0181',N'Trần Đình Sĩ','09/07/1987',N'THÔN DÙI CHƯƠNG 1, XÃ PHƯỚC NINH, HUYỆN NÔNG SƠN, QUẢNG NAM',1072,0,'D02','0932696672','')
insert into NhanVien values('N0182',N'Đào Văn Mẫn','10/20/1991',N'177 CẦN GIUỘC, PHƯỜNG AN KHÊ, THANH KHÊ, ĐÀ NẴNG',1855,0,'D03','01657704173','')
insert into NhanVien values('N0183',N'Nguyễn Đức Minh Khang','10/29/1982',N'604 ÔNG ÍCH KHIÊM, HẢI CHÂU, ĐÀ NẴNG',769,1,'D04','01672748981','')
insert into NhanVien values('N0184',N'Nguyễn Duy Huy','06/23/1988',N'K134/3 NGUYỄN NHƯ HẠNH, LIÊN CHIỂU, ĐÀ NẴNG',2275,1,'D01','01653192595','')
insert into NhanVien values('N0185',N'Trần Văn Minh Huy','10/06/1980',N'27/8 LÊ THÀNH PHƯƠNG, PHƯỜNG 8, TP TUY HÒA, PHÚ YÊN',2301,1,'D01','0906466858','')
insert into NhanVien values('N0186',N'Lê Long Hải','09/26/1986',N'',1117,1,'D01','01257966002','')
insert into NhanVien values('N0187',N'Vương Chí Hiếu','01/20/1986',N'',1312,0,'D02','0932 593 734','')
insert into NhanVien values('N0188',N'Ngô Thanh Tùng','11/14/1988',N'',1743,1,'D01','01224263274','')
insert into NhanVien values('N0189',N'Lê Hoàng Anh','01/12/1991',N'THÔN 8, TIÊN MỸ, TIÊN PHƯỚC, QUẢNG NAM',473,1,'D03','0905617610','')
insert into NhanVien values('N0190',N'Nguyễn Thành Danh','01/01/1993',N'THÔN 4, XÃ NGHĨA NINH, THÀNH PHỐ ĐỒNG HỚI, TỈNH QUẢNG BÌNH',2413,0,'D02','01282071811','')
insert into NhanVien values('N0191',N'Lê Trung Hiếu','11/23/1982',N'15 LÊ LAI, MỸ THẠCH I, THỊ TRẤN CHƯ SÊ, HUYỆN CHƯ SÊ, TỈNH GIA LAI',308,1,'D02','01688873933','')
insert into NhanVien values('N0192',N'Vũ Đức Nguyên','11/03/1988',N'352 TRẦN HƯNG ĐẠO, THỊ XÃ QUẢNG TRỊ, QUẢNG TRỊ',747,0,'D01','01263024528','')
insert into NhanVien values('N0193',N'Nguyễn Thị Thanh Nhi','03/13/1983',N'118 TIỂU LA, HẢI CHÂU, ĐÀ NẴNG',1928,0,'D02','0905602939','')

insert into NhanVien values('N0195',N'Lê Xuân Thịnh','07/04/1991',N'',515,1,'D04','01216986970','')
insert into NhanVien values('N0196',N'Phan Quang Huy','03/23/1990',N'Xuyên Đức, Đức Xuyên, Krong Nô, DakNong',335,0,'D02','01644498789','')
insert into NhanVien values('N0197',N'Ngô Trường Phu','02/12/1987',N'',595,0,'D02','01627596440','')
insert into NhanVien values('N0198',N'Trần Hoàng Nhật','10/22/1993',N'25 Võ Thị Sáu, Nhơn Bình, Quy Nhơn, Bình Định',1793,0,'D02','01219346204','')
insert into NhanVien values('N0199',N'Phạm Tuấn Quang','12/11/1980',N'TDP 2, THỊ TRẤN PHÚ THUẬN, HUYỆN PHÚ THUẬN, TỈNH GIA LAI',707,0,'D02','01227665321','')
insert into NhanVien values('N0200',N'Đào Anh Trí','09/02/1989',N'18/121 NGÔ ĐỨC KẾ - THUẬN LỘC - TP HUẾ',1120,1,'D02','01652435655','')
insert into NhanVien values('N0201',N'Văn Qúy Nhân','02/20/1990',N'41 ĐỖ QUANG, LÃNH THƯỢNG 2, ĐÔNG PHÚ, QUẾ SƠN, QUẢNG NAM',603,1,'D02','01632598205','')
insert into NhanVien values('N0202',N'Trần Hoàng Anh','07/01/1988',N'320 NGŨ HÀNH SƠN, TP. ĐÀ NẴNG',1042,0,'D02','01284869849','')
insert into NhanVien values('N0203',N'Đỗ Hoàng Giang','05/19/1994',N'718/14 TRẦN CAO VÂN, THANH KHÊ, ĐÀ NẴNG',1470,0,'D04','0979704720','')
insert into NhanVien values('N0204',N'Nguyễn Thị Hằng','04/18/1987',N'',1284,1,'D01','0919007205','')
insert into NhanVien values('N0205',N'Phan Ngọc Anh Hào','10/23/1981',N'K10 H23/4 PHẠM VĂN NGHỊ, ĐÀ NẴNG',1344,0,'D03','01626580816','')
insert into NhanVien values('N0206',N'Đặng Xuân Thành','04/16/1982',N'313 HÙNG VƯƠNG, TAM KỲ, QUẢNG NAM',464,1,'D03','0948514357','')
insert into NhanVien values('N0207',N'Nguyễn Nguyên Thịnh','03/09/1979',N'K202H19/17 Hoàng Văn Thái, Hòa Khánh Nam, Liên Chiểu, Đà Nẵng',695,0,'D02','01208019593','')
insert into NhanVien values('N0208',N'Nguyễn Tấn Thái','08/29/1992',N'',1257,1,'D02','01658187814','')
insert into NhanVien values('N0209',N'Thái Quang Huy','04/08/1987',N'TÂN MỸ, CẨM AN, HỌI AN, QUẢNG NAM',1385,0,'D01','0905180458','')
insert into NhanVien values('N0210',N'Nguyễn Đình Thôi','06/19/1994',N'',1854,1,'D04','0969733929','')
insert into NhanVien values('N0211',N'Trần Quang Thanh Long','04/22/1994',N'Thôn lạc Thành Nam, Điện Hồng, Điện Bàn, Quảng Nam',1358,0,'D03','0974892100','')
insert into NhanVien values('N0212',N'PHAN NHẬT MINH','11/24/1986',N'',969,0,'D04','01284443801','')
insert into NhanVien values('N0213',N'Nguyễn Hoàng Long','05/10/1981',N'244 Cù Chính Lan, Tổ 1',1624,0,'D02','01683853168','')
insert into NhanVien values('N0214',N'Nguyễn Anh Kha','01/01/1987',N'Vạn Tường, Bình Hải, Bình Sơn, Quảng Ngãi',1339,0,'D01','','')
insert into NhanVien values('N0215',N'Trần Thảo Trúc Quỳnh','04/17/1984',N'',975,0,'D01','0165298503','')
insert into NhanVien values('N0216',N'Phan Phú Nhuận','06/03/1981',N'30 Bàu Tró, Hải Thành, Đồng Hới, QUảng Bình',1640,1,'D04','0932556990','')
insert into NhanVien values('N0217',N'Phạm Trần Hoàng Duy','11/26/1985',N'Tổ 12 Hòa Minh Liên Chiểu Đà Nẵng',2379,1,'D02','0935302860','')
insert into NhanVien values('N0218',N'Kim Nhật Long','07/06/1989',N'207/9 QuỐC LỘ 9, ĐÔNG HÀ, QuẢNG TRỊ',2207,0,'D02','0905573607','')
insert into NhanVien values('N0219',N'Lê Văn Hoàng','03/06/1984',N'K37/4 HẢI HỒ, ĐÀ NẴNG',1303,1,'D03','01208129276','')
insert into NhanVien values('N0220',N'Nguyễn Thị Thanh Phương','02/11/1974',N'TRƯỜNG THPT GIO LINH, QUẢNG TRỊ',1463,0,'D01','01677006380','')
insert into NhanVien values('N0221',N'Bùi Xuân Trọng','03/23/1983',N'Nguyễn Văn Trung - tổ 10 - Phú bài',1576,0,'D03','0986762599','')
insert into NhanVien values('N0222',N'Nguyễn Thành Nhân','03/04/1995',N'THANH HÀ, HỘI AN, QUẢNG NAM',678,1,'D01','0935795204','')
insert into NhanVien values('N0223',N'Trà Hoàng Sơn','08/20/1979',N'MỸ CHÁNH, HẢI CHÁNH, HẢI LĂNG, QUẢNG TRỊ',1241,1,'D04','01683646202','')
insert into NhanVien values('N0224',N'Nguyễn Hồng Phê','12/25/1991',N'29 PHẠM QUANG ÁNH, SƠN TRÀ, ĐÀ NẴNG',2308,1,'D02','0905906217','')
insert into NhanVien values('N0225',N'VŨ THÀNH NHÂN','08/07/1978',N'K156 NGUYỄN PHAN VINH, SƠN TRÀ, TP. ĐÀ NẴNG',2468,0,'D01','01239073074','')
insert into NhanVien values('N0226',N'Đặng Trọng Tuấn','12/06/1981',N'THÔN ĐỒN, XÃ VẠN NINH, QUẢNG NINH, QUẢNG BÌNH',1997,0,'D01','0965801106','')
insert into NhanVien values('N0227',N'Phan Văn Sang','05/20/1989',N'',2332,1,'D04','','')
insert into NhanVien values('N0228',N'Nguyễn Thị Hồng Nhi','11/10/1982',N'48 Ông ích đường, Đà nẵng',2410,1,'D01','01234020208','')
insert into NhanVien values('N0229',N'Ngô Thị Tường Vy','05/25/1980',N'K86/56 PHẠM NHỮ TĂNG - ĐÀ NẴNG',337,1,'D04','0982147709','')
insert into NhanVien values('N0230',N'Trần Thị Mỹ Hạnh','10/23/1981',N'TRẦN ĐÌNH TRÍ, ĐỘI 2, THÔN PHAN XÁ, XUÂN THỦY, LỆ THỦY, QUẢNG BÌNH',1490,1,'D02','0971903658','')
insert into NhanVien values('N0231',N'Nguyễn Diệu Linh','01/21/1981',N'402/75 TRƯỜNG CHINH, CẨM LỆ, ĐÀ NẴNG',1435,1,'D02','0905324880','')
insert into NhanVien values('N0232',N'Lê Anh Duy','10/20/1993',N'244 TÔN ĐỨC THẮNG, LIÊN CHIỂU, ĐÀ NẴNG',419,1,'T01','01203740015','')
insert into NhanVien values('N0233',N'Nguyễn Lê Yến Đoan','03/27/1982',N'K1/113 Phạm như Sương Đà nẵng',1341,0,'T02','01232251113','')
insert into NhanVien values('N0234',N'Dương Thùy Linh','08/22/1978',N'XÓM 2, THU XÀ, NGHĨA HÒA, TƯ NGHĨA, QUẢNG NGÃI',613,0,'T01','01207535234','')
insert into NhanVien values('N0235',N'Trịnh Nguyễn Thành Nhân','09/04/1984',N'K925/19 NGÔ QUYỀN, ĐÀ NẴNG',2171,1,'T02','0988064298','')
insert into NhanVien values('N0236',N'Nguyễn Thị Yến Nhi','02/21/1989',N'K53 H18/23 HUỲNH NGỌC HUỆ, THANH KHÊ, ĐÀ NẴNG',1159,1,'T01','0964504718','')
insert into NhanVien values('N0237',N'Phạm Bảo Nguyên','03/07/1983',N'XÓM 5, THÔN ĐÔNG QUANG, XÃ PHỔ VĂN, ĐỨC PHỔ, QUẢNG NGÃI',956,0,'T01','0913218221','')
insert into NhanVien values('N0238',N'Võ Kỳ Phương Duyên','10/14/1991',N'Buôn Knia, Tân Tiến, KroongPak, Daklak',1612,1,'T01','01283311821','')
insert into NhanVien values('N0239',N'Nguyễn Thị Lan Trinh','04/02/1982',N'',1208,1,'T02','0916110267','')
insert into NhanVien values('N0240',N'Nguyễn Thị Ngọc Lệ','08/08/1995',N'',1189,1,'T02','01287874902','')
insert into NhanVien values('N0241',N'Phạm Phú Huy','07/22/1985',N'SỐ 34  ĐƯỜNG NGUYỄN ĐÌNH TỰU, TT TIÊN KÌ, HUYỆN TIÊN PHƯỚC, TỈNH QUẢNG NAM',1985,1,'T01','01247061788','')

insert into thamgia values('DA001', 'N0001',90)
insert into thamgia values('DA001', 'N0002',80)
insert into thamgia values('DA001', 'N0003',2)
insert into thamgia values('DA001', 'N0004',46)
insert into thamgia values('DA001', 'N0006',43)
insert into thamgia values('DA001', 'N0007',87)
insert into thamgia values('DA001', 'N0008',67)
insert into thamgia values('DA001', 'N0009',98)
insert into thamgia values('DA001', 'N0010',20)
insert into thamgia values('DA001', 'N0011',10)
insert into thamgia values('DA001', 'N0012',32)
insert into thamgia values('DA001', 'N0013',14)

insert into thamgia values('DA002','N0236',67)
insert into thamgia values('DA002','N0237',98)
insert into thamgia values('DA002','N0238',20)
insert into thamgia values('DA002','N0239',10)
insert into thamgia values('DA002','N0240',32)
insert into thamgia values('DA002','N0241',14)

insert into thamgia values('DA003','N0179'   ,rand()*100)
insert into thamgia values('DA004','N0180'	 ,rand()*100)
insert into thamgia values('DA005','N0181'	 ,rand()*100)
insert into thamgia values('DA006','N0182'	 ,rand()*100)
insert into thamgia values('DA007','N0183'	 ,rand()*100)
insert into thamgia values('DA008','N0184'	 ,rand()*100)
insert into thamgia values('DA009','N0185'	 ,rand()*100)
insert into thamgia values('DA010','N0186'	 ,rand()*100)
insert into thamgia values('DA011','N0187'	 ,rand()*100)
insert into thamgia values('DA003', 'N0188'	 ,rand()*100)
insert into thamgia values('DA004', 'N0189'	 ,rand()*100)
insert into thamgia values('DA005', 'N0190'	 ,rand()*100)
insert into thamgia values('DA006', 'N0191'	 ,rand()*100)
insert into thamgia values('DA007', 'N0192'	 ,rand()*100)
insert into thamgia values('DA008', 'N0193'	 ,rand()*100)
insert into thamgia values('DA009', 'N0099'	 ,rand()*100)
insert into thamgia values('DA010', 'N0100'	 ,rand()*100)
insert into thamgia values('DA011', 'N0101'	 ,rand()*100)
insert into thamgia values('DA003', 'N0102'	 ,rand()*100)
insert into thamgia values('DA004', 'N0103'	 ,rand()*100)
insert into thamgia values('DA005', 'N0104'	 ,rand()*100)
insert into thamgia values('DA006', 'N0105'	 ,rand()*100)
insert into thamgia values('DA007', 'N0106'	 ,rand()*100)
insert into thamgia values('DA008', 'N0107'	 ,rand()*100)
insert into thamgia values('DA009', 'N0108'	 ,rand()*100)
insert into thamgia values('DA010', 'N0109'	 ,rand()*100)
insert into thamgia values('DA011', 'N0110'	 ,rand()*100)
insert into thamgia values('DA003', 'N0111'	 ,rand()*100)
insert into thamgia values('DA004', 'N0112'	 ,rand()*100)
insert into thamgia values('DA005', 'N0113'	 ,rand()*100)
insert into thamgia values('DA006', 'N0114'	 ,rand()*100)
insert into thamgia values('DA007', 'N0115'	 ,rand()*100)
insert into thamgia values('DA008', 'N0116'	 ,rand()*100)
insert into thamgia values('DA009','N0086'	 ,rand()*100)
insert into thamgia values('DA010','N0087'	 ,rand()*100)
insert into thamgia values('DA011','N0088'	 ,rand()*100)
insert into thamgia values('DA004','N0089'	 ,rand()*100)
insert into thamgia values('DA005','N0090'	 ,rand()*100)
insert into thamgia values('DA006','N0091'	 ,rand()*100)
insert into thamgia values('DA007','N0092'	 ,rand()*100)
insert into thamgia values('DA008','N0093'	 ,rand()*100)
insert into thamgia values('DA009','N0094'	 ,rand()*100)
insert into thamgia values('DA010','N0095'	 ,rand()*100)
insert into thamgia values('DA011','N0096'	 ,rand()*100)

insert into thamgia values('DA001','N0121'  ,rand()*100)
insert into thamgia values('DA004','N0122'	 ,rand()*100)
insert into thamgia values('DA005','N0123'	 ,rand()*100)
insert into thamgia values('DA006','N0124'	 ,rand()*100)
insert into thamgia values('DA002','N0125'	 ,rand()*100)
insert into thamgia values('DA008','N0126'	 ,rand()*100)
insert into thamgia values('DA009','N0127'	 ,rand()*100)
insert into thamgia values('DA010','N0128'	 ,rand()*100)
insert into thamgia values('DA001','N0129'	 ,rand()*100)
insert into thamgia values('DA003','N0130'	 ,rand()*100)
insert into thamgia values('DA004','N0131'	 ,rand()*100)
insert into thamgia values('DA005','N0132'	 ,rand()*100)
insert into thamgia values('DA006','N0133'	 ,rand()*100)
insert into thamgia values('DA007','N0134'	 ,rand()*100)
insert into thamgia values('DA008','N0135'	 ,rand()*100)
insert into thamgia values('DA009','N0136'	 ,rand()*100)
insert into thamgia values('DA010','N0137'	 ,rand()*100)
insert into thamgia values('DA011','N0138' 	 ,rand()*100)
insert into thamgia values('DA003','N0139' 	 ,rand()*100)
insert into thamgia values('DA004','N0140' 	 ,rand()*100)
insert into thamgia values('DA005','N0141' 	 ,rand()*100)
insert into thamgia values('DA006','N0142' 	 ,rand()*100)
insert into thamgia values('DA007','N0143' 	 ,rand()*100)
insert into thamgia values('DA008','N0144' 	 ,rand()*100)
insert into thamgia values('DA009','N0145' 	 ,rand()*100)
insert into thamgia values('DA010','N0146' 	 ,rand()*100)
insert into thamgia values('DA011','N0147' 	 ,rand()*100)
insert into thamgia values('DA003','N0148' 	 ,rand()*100)
insert into thamgia values('DA004','N0149' 	 ,rand()*100)
insert into thamgia values('DA002', 'N0113'	 ,rand()*100)
insert into thamgia values('DA007', 'N0015'	 ,rand()*100)
insert into thamgia values('DA008', 'N0016'	 ,rand()*100)
insert into thamgia values('DA009','N0036'	 ,rand()*100)
insert into thamgia values('DA010','N0017'	 ,rand()*100)
insert into thamgia values('DA011','N0018'	 ,rand()*100)
insert into thamgia values('DA010','N0155'	 ,rand()*100)
insert into thamgia values('DA011','N0206'	 ,rand()*100)


						
select * from phongban
select * from nhanvien
select * from thamgia
select * from duan

--1.a) Trả về tên phòng ban làm việc của nhân viên nếu biết mã nhân viên
--input: MaNV (bảng NhanVien)
--output:TenPB (bảng PhongBan) 
create or alter function fPhongBan(@manv nvarchar(50))
returns nvarchar(100)
as
begin
	declare @tenpb nvarchar(100)
	select @tenpb=TenPB
	from PHONGBAN p join NHANVIEN n on p.MaPB=n.MaPB
	where MaNV=@manv

	return @tenpb
end

--test--
select dbo.fPhongBan ('N0001')

--1.b)Trả về số lượng nhân viên trong phòng ban nếu biết tên phòng ban
--input: TenPB (bảng PhongBan) 
--output: Số lượng nhân viên (bảng NhanVien)
create or alter function fSLNV(@tenpb nvarchar(50))
returns int
as
begin
	declare @count int
	select @count=count(*)
	from nhanvien join phongban on NHANVIEN.MaPB=PHONGBAN.MaPB
	where TenPB=@tenpb

	return @count
end

--test--
select dbo.fSLNV('DEV 1')

--1.c)Trả về TỔNG số ngày công của toàn bộ dự án nếu biết mã dự án
--input: MaDA 
--output: SUM(SoLuongNgayCong)

create or alter function fTNC (@mada nvarchar(50))
returns int
as
begin
	declare @sum int
	select @sum=sum(soluongngaycong)
	from THAMGIA
	where MaDA=@mada

	return @sum
end
--test--
select dbo.fTNC('DA001')

select * from thamgia

--2. Tạo các thủ sau (mỗi câu làm riêng biệt)
--a) Cập nhật thời gian thực hiện dự án, với các yêu cầu như sau:
--Input: mã dự án, thời gian bắt đầu, thời gian kết thúc
--Output: 1)nếu thành công, 0) nếu thất bại
--Process: --Bước 1: Kiểm tra nếu ngày bắt đầu >= ngày kết thúc 
--là thông báo lỗi và kết thúc thủ tục trả về giá trị 0
			--Bước 2: cập nhật dữ liệu cho dự án có mã tương ứng. Nếu
			--Nếu cập nhật thành công trả về 1, ngược lại trả về 0--
create or alter proc pUpdateTGDA @mada nvarchar(50), @tgbatdau date, @tgkt date, @ret int out
as
begin
	--bước 1--
	if @tgbatdau>=@tgkt
	begin
		print 'Lỗi'
		set @ret=0
		return
	end
	--bước 2--
	update DUAN set NgayBD=@tgbatdau, NgayKT=@tgkt
	where MaDA=@mada

	if @@rowcount>0
		set @ret=1 
	else
		set @ret=0
end

--test
declare @mada nvarchar(50)='DA001',
		@tgbatdau date='2013-01-21',
		@tgkt date='2014-08-15',
		@ret int
exec pUpdateTGDA @mada, @tgbatdau, @tgkt, @ret out
select * from DUAN
--2.b)Thêm mới dữ liệu vào bảng THAMGIA
--input: mã nhân viên, mã dự án, số lượng ngày công
--output: 1)nếu thành công, 0) nếu thất bại
--process:
	--bước 1:kiểm tra mã nhân viên đã tồn tại trong bảng NHANVIEN hay chưa? Nếu chưa, kết thúc thủ tục trả về 0
	--bước 2: kiểm tra mã dự án đã tồn tại trong bảng DUAN hay chưa? Nếu chưa, kết thúc thủ tục trả về 0--


create or alter proc pThemMoiDuLieu @manv nvarchar(50), @mada nvarchar(50), @slngaycong int, @ret bit out
as
begin
	--bước 1--
	if not exists(select 1 from NHANVIEN where manv=@manv)
	begin
		set @ret=0
		return
	end
	--bước 2--
	if not exists(select 1 from DUAN where MaDA=@mada)
	begin
		set @ret=0
		return
	end
	--bước 3--
	if @slngaycong>0
	begin
		set @ret=1
	end
	else
	begin
		set @ret=0
	end
	--bước 4--
	  IF EXISTS (SELECT 1 FROM THAMGIA WHERE MaDA = @mada AND manv = @manv)
    BEGIN
        SET @ret = 0
        RETURN
    END

	insert into THAMGIA values(@mada,@manv,@slngaycong)
	IF @@ROWCOUNT>0
	begin
		set @ret=0
		return
	end
END

--TEST--
declare @manv nvarchar(50)='N0001',
		@mada nvarchar(50)='DA001',
		@slngaycong int='90',
		@ret bit
EXEC pThemMoiDuLieu @manv, @mada, @slngaycong, @ret out
SELECT*FROM THAMGIA