CREATE DATABASE Bank  
go
use Bank
go
create table Bank
(
	b_id	char(10),
	b_name	nvarchar(50),
	b_ad	nvarchar(200),
	primary key(b_id)
)
go
create table Branch
(
	BR_id CHAR(5),
	BR_name	nvarchar(50),
	BR_ad	nvarchar(150),
	B_id	char(10),
	primary key(BR_id),
	foreign key (B_id) references Bank
)
go
create table customer
(
	Cust_id	char(6),
	Cust_name	nvarchar(50),
	Cust_phone	varchar(15),
	Cust_ad		nvarchar(150),
	Br_id		char(5),
	primary key(Cust_id),
	foreign key (Br_id) references Branch
)
go
create table account
(
	Ac_no	char(10),
	ac_balance	numeric(15,0),
	ac_type	char(1),
	cust_id	char(6),
	primary key(ac_no),
	foreign key(cust_id) references Customer
)
go
create table transactions
(
	t_id	char(10),
	t_type	char(1),
	t_amount numeric(15,0),
	t_date	date,
	t_time	time,
	ac_no	char(10),
	primary key(t_id),
	foreign key (ac_no) references account
)
go
insert into bank values('BFTVVNVX07',N'Ngân hàng Công thương Việt Nam',N'03 Lý Thái Tổ, Hà Nội, Việt Nam')

insert into branch values('VB001',N'Vietcombank Thái Bình',N'12 Lý Bôn - tp Thái Bình','BFTVVNVX07')
insert into branch values('VB002',N'Vietcombank Nam Định',N'04 Trần Hưng Đạo - tp Nam Định','BFTVVNVX07')
insert into branch values('VB003',N'Vietcombank Thái Nguyên',N'44 Trần Nhân Tông - tp Thái Nguyên','BFTVVNVX07')
insert into branch values('VB004',N'Vietcombank Hà Nội',N'32 Cầu Giấy','BFTVVNVX07')
insert into branch values('VB005',N'Vietcombank Bắc Ninh',N'98 Phan Huy Chú','BFTVVNVX07')
insert into branch values('VT006',N'Vietcombank Thanh Hóa',N'23 Nguyễn Du','BFTVVNVX07')
insert into branch values('VT007',N'Vietcombank Nghệ An',N'01 Phan Bội Châu','BFTVVNVX07')
insert into branch values('VT008',N'Vietcombank Hà Tĩnh',N'72 Hà Huy Tập','BFTVVNVX07')
insert into branch values('VT009',N'Vietcombank Quảng Bình',N'','BFTVVNVX07')
insert into branch values('VT010',N'Vietcombank Quảng Trị',N'','BFTVVNVX07')
insert into branch values('VT011',N'Vietcombank Huế',N'85 Lê Thánh Tông','BFTVVNVX07')
insert into branch values('VN012',N'Vietcombank Đà Nẵng',N'01 Bạch Đằng','BFTVVNVX07')
insert into branch values('VN013',N'Vietcombank Quảng Nam',N'33 Cửa Đại, Hội An','BFTVVNVX07')
insert into branch values('VN014',N'Vietcombank Sài Gòn',N'Quận 1, tp HCM','BFTVVNVX07')
insert into branch values('VN015',N'Vietcombank Đồng Tháp',N'87 Phan Châu Trinh','BFTVVNVX07')
insert into branch values('VN016',N'Vietcombank Cà Mau',N'34 Trường Chinh','BFTVVNVX07')
insert into branch values('VN017',N'Vietcombank Phan Thiết',N'99 Lý Thái Tổ','BFTVVNVX07')
insert into branch values('VN018',N'Vietcombank Vũng Tàu',N'78 Hai Bà Trưng','BFTVVNVX07')
insert into branch values('VN019',N'Vietcombank Kiên Giang',N'238 Hải PHòng','BFTVVNVX07')

insert into customer values('000001',N'Hà Công Lực','01283388103',N'NGUYỄN TIẾN DUẨN - THÔN 3 - XÃ DHÊYANG - EAHLEO - ĐĂKLĂK','VT009')
insert into customer values('000002',N'Trần Đức Quý','01638843209',N'215/90 VÕ VĂN KIỆT, PHƯỜNG THANH XUÂN, TP BUÔN MA THUỘT, ĐĂK LĂK','VT010')
insert into customer values('000003',N'Lê Quang Phong','01219688656',N'TRUNG THIỆN, DƯƠNG THỦY, LỆ THỦY, QUẢNG BÌNH.','VT011')
insert into customer values('000004',N'Trần Văn Thiện Thanh','0905556510',N'19 ĐƯỜNG SỐ 1, ĐIỆN QUANG, ĐIỆN BÀN, QUẢNG NAM','VB004')
insert into customer values('000005',N'Nguyễn Đức Duy','0935270776',N'Giáo Tây, Đại Hòa, Đại Lộc, Quảng Nam','VB005')
insert into customer values('000006',N'Nguyễn Quang Công Minh','01282157875',N'HÒA SƠN, HÒA VANG, ĐÀ NẴNG','VT006')
insert into customer values('000007',N'Trần Trương Thiện Nguyên','01265323711',N'TỔ DÂN PHỐ 4,P NAM LÝ, TP ĐỒNG HỚI, QUẢNG BÌNH','VB001')
insert into customer values('000008',N'Nguyễn Lê Minh Quân','0962883220',N'K79/4 THANH THỦY, HẢI CHÂU, ĐÀ NẴNG','VB002')
insert into customer values('000009',N'Nguyễn Văn Linh','01689084633',N'58 HÙNG VƯƠNG, TX BA ĐỒN, QUẢNG BÌNH','VB003')
insert into customer values('000010',N'Đặng Nhật Phong','01652512225',N'K907 NGUYỄN LƯƠNG BẰNG- QUẬN LIÊU CHIỂU- ĐÀ NẴNG','VB004')
insert into customer values('000011',N'Lê Tấn Anh Quốc','0975208772',N'THÔN THANH QUÝT 1, ĐIỆN THẮNG TRUNG, ĐIỆN BÀN, QUẢNG NAM','VB005')
insert into customer values('000012',N'Hứa Văn Đại','01269162146',N'TỔ 27A, NẠI HIÊN ĐÔNG, SƠN TRÀ, TP. ĐÀ NẴNG','VT006')
insert into customer values('000013',N'Hồ Quỳnh Hữu Phát','0978354865',N'PHAN THỊ HỒNG PHƯỢNG, THÔN 1B, XÃ ĐỒNG TRẠCH, BỐ TRẠCH, QUẢNG BÌNH','VT007')
insert into customer values('000014',N'Phan Nguyên Anh','0964318076',N'KHỐI HẬU XÁ, TỔ 37, PHƯỜNG THANH HÀ, TP. HỘI AN, TỈNH QUẢNG NAM.','VT008')
insert into customer values('000015',N'Trương Quang Hòa','0976308098',N'294 HUỲNH THÚC KHÁNG, AN XUÂN, TAM KỲ, QUẢNG NAM','VT009')
insert into customer values('000016',N'Lê Anh Huy','0966654330',N'412 CÁCH MẠNG THÁNG 8, QUẬN CẨM LỆ, ĐÀ NẴNG','VT010')
insert into customer values('000017',N'Hồ Trần Nhật Khánh','01648438000',N'193/12 NÚI THÀNH, PHƯỜNG HÒA CƯỜNG BẮC, HẢI CHÂU, ĐÀ NẴNG','VT011')
insert into customer values('000018',N'Lê Minh Trí','0935700123',N'TDP3-P TỨ HẠ, HƯƠNG TRÀ, TT HUẾ','VN012')
insert into customer values('000019',N'Phan Công Diễn','0935604934',N'TỔ 19 - PHƯỜNG PHƯỚC MỸ - SƠN TRÀ - ĐÀ NẴNG ','VN013')
insert into customer values('000020',N'Nguyễn Xuân Anh','0905939426',N'67 Trần Văn Dư, Mỹ An, Ngũ Hành Sơn Đà Nẵng','VN014')
insert into customer values('000021',N'Nguyễn Tiến Trung','01224064353',N'1/45 QUANG TRUNG, KHU PHỐ 2, PHƯỜNG 2, THỊ XÃ QUẢNG TRỊ, TỈNH QUẢNG TRỊ.','VN015')
insert into customer values('000022',N'Lê Hoàng Duy','0932517402',N'15A VÕ VĂN TẦN, QUY NHƠN, BÌNH ĐỊNH','VN016')
insert into customer values('000023',N'Trần Ngọc Quốc','01202023287',N'tổ 4,Bình Lãnh,Thăng Bình','VN017')
insert into customer values('000024',N'Huỳnh Tấn Dũng','0982805825',N'KHU VỰC VẠN THUẬN, PHƯỜNG NHƠN THÀNH, TX AN NHƠN, BÌNH ĐỊNH','VN018')
insert into customer values('000025',N'Trần Quang Khải','0935777298',N'KIỆT 38 TÔN THẤT SƠN, THỦY PHƯƠNG, HƯƠNG THỦY, TT HUẾ','VN019')
insert into customer values('000026',N'Nguyễn Trí Hùng','0905886802',N'HUỲNH HÙNG, THÔN 4, XÃ HÒA PHONG, KRÔNG BÔNG, ĐĂK LĂK','VT007')
insert into customer values('000027',N'Dương Ngọc Long','01208776312',N'01 THOẠI NGỌC HẦU, TAM KỲ, QUẢNG NAM','VT008')
insert into customer values('000028',N'Trương Nhật Minh','01654217772',N'TỔ 37B KHU VỰC 4, SỐ NHÀ 20/6A CHI LĂNG, QUY NHƠN, BÌNH ĐỊNH','VT009')
insert into customer values('000029',N'Lê Nguyễn Hoàng Văn','0969590517',N'SỐ 31 ĐƯỜNG HÒA MINH 4, LIÊN CHIỂU, ĐÀ NẴNG','VT010')
insert into customer values('000030',N'Nguyễn Văn Hoàng Long','0914660398',N'TỔ 45 ĐA PHƯỚC II, HÒA KHÁNH BẮC, LIÊN CHIỂU, ĐÀ NẴNG','VT009')
insert into customer values('000031',N'Trần Phước Đạt','0914163750',N'11 THÚC TỀ, THANH KHÊ, TP. ĐÀ NẴNG','VT010')
insert into customer values('000032',N'Phạm Duy Khánh','01646636030',N'08/38 TRẦN BÌNH TRỌNG - P. ĐÔNG SƠN - TP THANH HÓA','VT011')
insert into customer values('000033',N'Lương Minh Hiếu','0936185901',N'ĐỘI 7, THÔN 8, TAM LỘC, PHÚ NINH, QUẢNG NAM','VT009')
insert into customer values('000034',N'Nguyễn Ngọc Thắng','01656730217',N'16 LÝ THÁNH TÔNG, ĐỒNG HỚI, QUẢNG BÌNH','VT010')
insert into customer values('000035',N'Trương Duy Tường','01645500071',N'ĐỘI 1 - PHAN XÁ - XUÂN THỦY - LỆ THỦY - QuẢNG BÌNH','VT011')

insert into account values('1000000001',88118000,'1','000001')
insert into account values('1000000002',188372000,'0','000002')
insert into account values('1000000003',44770000,'0','000003')
insert into account values('1000000004',157231000,'1','000004')
insert into account values('1000000005',178232000,'0','000005')
insert into account values('1000000006',-15678000,'1','000006')
insert into account values('1000000007',332183000,'1','000007')
insert into account values('1000000008',393221000,'1','000008')
insert into account values('1000000009',172923000,'0','000009')
insert into account values('1000000010',-6107000,'1','000010')
insert into account values('1000000011',227449000,'1','000011')
insert into account values('1000000012',184002000,'0','000012')
insert into account values('1000000013',229384000,'1','000013')
insert into account values('1000000014',94311000,'1','000014')
insert into account values('1000000015',104826000,'0','000015')
insert into account values('1000000016',236633000,'0','000016')
insert into account values('1000000017',121389000,'1','000017')
insert into account values('1000000018',226017000,'1','000018')
insert into account values('1000000019',133429000,'1','000019')
insert into account values('1000000020',272623000,'1','000020')
insert into account values('1000000021',358446000,'0','000021')
insert into account values('1000000022',69486000,'0','000022')
insert into account values('1000000023',232929000,'0','000023')
insert into account values('1000000024',301503000,'1','000024')
insert into account values('1000000025',221284000,'0','000025')
insert into account values('1000000026',184739000,'1','000026')
insert into account values('1000000027',3672000,'0','000027')
insert into account values('1000000028',143249000,'0','000028')
insert into account values('1000000029',85747000,'0','000029')
insert into account values('1000000030',238311000,'1','000030')
insert into account values('1000000031',243154000,'1','000031')
insert into account values('1000000032',350917000,'1','000032')
insert into account values('1000000033',265088000,'0','000033')
insert into account values('1000000034',86609000,'0','000034')
insert into account values('1000000035',248363000,'0','000035')
insert into account values('1000000036',381588000,'1','000001')
insert into account values('1000000037',59175000,'0','000018')
insert into account values('1000000038',123720000,'0','000019')
insert into account values('1000000039',83933000,'0','000020')
insert into account values('1000000040',333106000,'1','000021')
insert into account values('1000000041',227374000,'0','000022')
insert into account values('1000000042',179736000,'1','000023')
insert into account values('1000000043',222900000,'1','000024')
insert into account values('1000000044',214214000,'1','000025')
insert into account values('1000000045',56524000,'1','000026')
insert into account values('1000000046',349664000,'1','000027')
insert into account values('1000000047',77659000,'0','000028')
insert into account values('1000000048',99830000,'1','000029')
insert into account values('1000000049',91027000,'1','000014')
insert into account values('1000000050',95035000,'0','000015')
insert into account values('1000000051',100367000,'0','000016')
insert into account values('1000000052',77555000,'1','000017')
insert into account values('1000000053',295473000,'0','000018')
insert into account values('1000000054',197525000,'1','000019')

insert into transactions values('0000000201','0',1752000,'2011/12/27','07:45','1000000041')
insert into transactions values('0000000202','0',3617000,'2016/01/31','03:12','1000000019')
insert into transactions values('0000000203','0',1344000,'2012/06/16','09:43','1000000009')
insert into transactions values('0000000204','1',64088000,'2010/06/13','12:18','1000000021')
insert into transactions values('0000000205','1',72397000,'2010/01/16','09:12','1000000040')
insert into transactions values('0000000206','1',47332000,'2015/04/06','12:34','1000000007')
insert into transactions values('0000000207','0',4052000,'2014/07/30','05:00','1000000011')
insert into transactions values('0000000208','1',87035000,'2012/01/23','13:15','1000000013')
insert into transactions values('0000000209','0',2804000,'2015/10/09','23:10','1000000044')
insert into transactions values('0000000210','0',4538000,'2017/11/19','07:48','1000000022')
insert into transactions values('0000000211','1',28350000,'2012/01/03','10:39','1000000004')
insert into transactions values('0000000212','0',3201000,'2014/05/01','07:01','1000000032')
insert into transactions values('0000000213','1',69085000,'2015/06/10','12:06','1000000031')
insert into transactions values('0000000214','1',66529000,'2011/01/16','16:21','1000000045')
insert into transactions values('0000000215','0',1803000,'2012/02/13','21:03','1000000034')
insert into transactions values('0000000216','0',2952000,'2014/11/20','17:32','1000000053')
insert into transactions values('0000000217','0',4790000,'2014/07/25','04:47','1000000034')
insert into transactions values('0000000218','1',57458000,'2013/08/01','11:03','1000000043')
insert into transactions values('0000000219','1',16136000,'2012/05/27','13:31','1000000027')
insert into transactions values('0000000220','0',1620000,'2014/07/05','14:41','1000000016')
insert into transactions values('0000000221','1',2424000,'2015/06/23','09:44','1000000044')
insert into transactions values('0000000222','1',61787000,'2010/06/04','12:38','1000000038')
insert into transactions values('0000000223','0',105000,'2014/12/16','22:31','1000000045')
insert into transactions values('0000000224','1',1534000,'2014/10/16','14:39','1000000041')
insert into transactions values('0000000225','0',2951000,'2010/02/08','09:17','1000000027')
insert into transactions values('0000000226','0',4807000,'2011/09/19','00:51','1000000048')
insert into transactions values('0000000227','1',13573000,'2011/09/06','11:41','1000000021')
insert into transactions values('0000000228','0',3341000,'2012/07/03','01:06','1000000005')
insert into transactions values('0000000229','1',4653000,'2011/10/23','13:27','1000000039')
insert into transactions values('0000000230','1',11090000,'2015/04/13','12:41','1000000001')
insert into transactions values('0000000231','0',105000,'2016/11/27','13:02','1000000044')
insert into transactions values('0000000232','1',97609000,'2010/05/17','12:06','1000000046')
insert into transactions values('0000000233','1',1113000,'2016/03/18','15:33','1000000019')
insert into transactions values('0000000234','0',4680000,'2010/11/07','21:59','1000000038')
insert into transactions values('0000000235','1',42182000,'2011/02/28','10:32','1000000018')
insert into transactions values('0000000236','1',67251000,'2013/11/13','12:28','1000000025')
insert into transactions values('0000000237','1',19841000,'2013/10/30','16:58','1000000009')
insert into transactions values('0000000238','0',2310000,'2011/04/21','22:56','1000000048')
insert into transactions values('0000000239','0',4902000,'2015/05/17','09:31','1000000037')
insert into transactions values('0000000240','1',68984000,'2017/04/17','09:56','1000000042')
insert into transactions values('0000000241','0',400000,'2010/06/16','03:20','1000000042')
insert into transactions values('0000000242','1',95102000,'2011/03/27','15:06','1000000041')
insert into transactions values('0000000243','1',51881000,'2016/06/26','14:42','1000000020')
insert into transactions values('0000000244','1',83905000,'2011/08/21','16:33','1000000001')
insert into transactions values('0000000245','1',67883000,'2011/01/22','09:11','1000000026')
insert into transactions values('0000000246','0',3975000,'2016/09/15','17:57','1000000032')
insert into transactions values('0000000247','0',4814000,'2010/05/13','04:48','1000000003')
insert into transactions values('0000000248','0',984000,'2012/09/30','07:34','1000000002')
insert into transactions values('0000000249','0',1183000,'2017/07/11','10:15','1000000013')
insert into transactions values('0000000250','0',4269000,'2013/01/14','03:36','1000000027')
insert into transactions values('0000000251','1',50812000,'2014/01/27','15:30','1000000030')
insert into transactions values('0000000252','1',76973000,'2017/06/02','08:21','1000000035')
insert into transactions values('0000000253','1',44310000,'2013/10/25','16:14','1000000046')
insert into transactions values('0000000254','0',230000,'2013/05/18','01:58','1000000049')
insert into transactions values('0000000255','0',2764000,'2013/03/03','05:40','1000000042')
insert into transactions values('0000000256','1',42744000,'2013/01/10','14:47','1000000002')
insert into transactions values('0000000257','1',42623000,'2011/02/19','11:09','1000000049')
insert into transactions values('0000000258','1',37565000,'2010/08/12','08:20','1000000048')
insert into transactions values('0000000259','1',29850000,'2017/02/01','11:24','1000000012')
insert into transactions values('0000000260','1',30877000,'2017/05/07','12:54','1000000022')
insert into transactions values('0000000261','0',963000,'2010/01/09','02:42','1000000048')
insert into transactions values('0000000262','0',2131000,'2017/07/27','23:54','1000000007')
insert into transactions values('0000000263','0',1844000,'2010/11/22','15:00','1000000038')
insert into transactions values('0000000264','1',70780000,'2016/03/29','12:52','1000000040')
insert into transactions values('0000000265','0',3675000,'2013/05/03','09:39','1000000031')
insert into transactions values('0000000266','0',4769000,'2017/08/27','13:57','1000000039')
insert into transactions values('0000000267','1',61672000,'2014/11/15','08:58','1000000011')
insert into transactions values('0000000268','0',4783000,'2014/02/25','12:20','1000000032')
insert into transactions values('0000000269','1',56511000,'2010/04/25','13:38','1000000026')
insert into transactions values('0000000270','0',633000,'2014/02/23','09:15','1000000040')
insert into transactions values('0000000271','1',50123000,'2015/03/26','15:54','1000000016')
insert into transactions values('0000000272','0',4643000,'2011/04/25','07:59','1000000053')
insert into transactions values('0000000273','0',1655000,'2014/05/02','19:55','1000000023')
insert into transactions values('0000000274','0',393000,'2010/02/28','08:11','1000000015')
insert into transactions values('0000000275','0',128000,'2015/12/19','16:26','1000000024')
insert into transactions values('0000000276','1',60500000,'2011/05/12','11:21','1000000026')
insert into transactions values('0000000277','1',64983000,'2013/09/27','09:29','1000000040')
insert into transactions values('0000000278','0',3246000,'2017/01/23','08:55','1000000035')
insert into transactions values('0000000279','0',73000,'2013/07/01','19:33','1000000024')
insert into transactions values('0000000280','1',94002000,'2016/11/24','10:17','1000000046')
insert into transactions values('0000000281','1',70658000,'2013/12/04','15:24','1000000024')
insert into transactions values('0000000282','0',472000,'2010/03/21','02:16','1000000024')
insert into transactions values('0000000283','0',802000,'2013/05/25','03:50','1000000048')
insert into transactions values('0000000284','1',6815000,'2014/06/30','10:43','1000000032')
insert into transactions values('0000000285','0',3384000,'2017/10/10','04:44','1000000018')
insert into transactions values('0000000286','1',39274000,'2010/02/08','09:18','1000000033')
insert into transactions values('0000000287','0',1733000,'2015/03/11','12:21','1000000054')
insert into transactions values('0000000288','1',60723000,'2017/02/08','08:52','1000000047')
insert into transactions values('0000000289','0',601000,'2011/10/15','10:01','1000000044')
insert into transactions values('0000000290','1',95797000,'2013/01/03','10:03','1000000007')
insert into transactions values('0000000291','1',17028000,'2010/08/02','13:10','1000000042')
insert into transactions values('0000000292','0',3990000,'2010/07/03','19:03','1000000045')
insert into transactions values('0000000293','0',4870000,'2017/07/31','01:40','1000000028')
insert into transactions values('0000000294','0',2942000,'2017/09/12','11:25','1000000046')
insert into transactions values('0000000295','1',69188000,'2016/05/20','14:45','1000000040')
insert into transactions values('0000000296','1',79183000,'2011/08/16','13:19','1000000011')
insert into transactions values('0000000297','1',69815000,'2013/09/06','16:23','1000000004')
insert into transactions values('0000000298','0',4825000,'2011/04/25','16:20','1000000034')
insert into transactions values('0000000299','1',51986000,'2015/11/11','11:30','1000000023')
insert into transactions values('0000000300','1',48143000,'2016/07/20','16:32','1000000041')
insert into transactions values('0000000301','1',51568000,'2013/06/02','11:45','1000000019')
insert into transactions values('0000000302','0',938000,'2013/04/22','19:36','1000000016')
insert into transactions values('0000000303','1',65913000,'2014/03/12','08:36','1000000037')
insert into transactions values('0000000304','0',4220000,'2013/08/23','12:53','1000000011')
insert into transactions values('0000000305','0',1925000,'2014/08/26','15:35','1000000013')
insert into transactions values('0000000306','0',101000,'2012/08/07','11:42','1000000049')
insert into transactions values('0000000307','0',1180000,'2017/04/29','01:24','1000000027')
insert into transactions values('0000000308','1',22385000,'2012/01/19','13:27','1000000039')
insert into transactions values('0000000309','0',439000,'2013/06/13','23:42','1000000018')
insert into transactions values('0000000310','1',30540000,'2016/12/14','15:30','1000000053')
insert into transactions values('0000000311','1',88810000,'2013/04/06','09:45','1000000019')
insert into transactions values('0000000312','0',4601000,'2016/04/02','06:28','1000000021')
insert into transactions values('0000000313','0',3236000,'2015/08/07','18:14','1000000012')
insert into transactions values('0000000314','1',66597000,'2014/07/09','13:12','1000000036')
insert into transactions values('0000000315','0',4245000,'2011/07/24','18:54','1000000030')
insert into transactions values('0000000316','1',93838000,'2014/11/25','13:09','1000000013')
insert into transactions values('0000000317','1',87961000,'2016/01/24','11:23','1000000032')
insert into transactions values('0000000318','1',48242000,'2016/01/23','12:29','1000000002')
insert into transactions values('0000000319','0',1374000,'2014/05/21','12:51','1000000041')
insert into transactions values('0000000320','0',4122000,'2010/09/08','15:36','1000000009')
insert into transactions values('0000000321','0',3650000,'2017/11/12','21:24','1000000053')
insert into transactions values('0000000322','0',1789000,'2013/07/24','00:54','1000000016')
insert into transactions values('0000000323','1',62031000,'2014/05/12','14:33','1000000008')
insert into transactions values('0000000324','1',12276000,'2015/09/16','11:56','1000000011')
insert into transactions values('0000000325','0',1123000,'2011/06/14','00:21','1000000038')
insert into transactions values('0000000326','1',17385000,'2014/06/25','12:24','1000000026')
insert into transactions values('0000000327','0',3185000,'2013/02/09','04:04','1000000033')
insert into transactions values('0000000328','0',678000,'2010/05/14','13:05','1000000009')
insert into transactions values('0000000329','1',61632000,'2016/12/05','11:34','1000000004')
insert into transactions values('0000000330','0',3913000,'2015/04/15','01:12','1000000013')
insert into transactions values('0000000331','0',1065000,'2012/07/14','13:28','1000000048')
insert into transactions values('0000000332','0',1503000,'2015/01/20','12:49','1000000037')
insert into transactions values('0000000333','1',80947000,'2017/05/07','16:48','1000000048')
insert into transactions values('0000000334','0',3728000,'2014/11/25','23:07','1000000013')
insert into transactions values('0000000335','0',3300000,'2013/10/09','04:06','1000000017')
insert into transactions values('0000000336','1',50367000,'2012/05/20','15:25','1000000012')
insert into transactions values('0000000337','1',85455000,'2010/09/18','15:46','1000000031')
insert into transactions values('0000000338','0',4225000,'2013/01/07','05:41','1000000007')
insert into transactions values('0000000339','1',9121000,'2017/06/19','11:58','1000000018')
insert into transactions values('0000000340','0',381000,'2014/08/05','18:42','1000000015')
insert into transactions values('0000000341','0',1100000,'2013/02/24','21:31','1000000038')
insert into transactions values('0000000342','1',30491000,'2014/07/29','08:57','1000000032')
insert into transactions values('0000000343','1',27835000,'2016/06/21','13:17','1000000012')
insert into transactions values('0000000344','0',1551000,'2014/08/08','02:15','1000000010')
insert into transactions values('0000000345','0',3505000,'2013/06/27','05:07','1000000048')
insert into transactions values('0000000346','0',4189000,'2014/07/10','01:34','1000000001')
insert into transactions values('0000000347','1',91697000,'2010/01/16','08:11','1000000044')
insert into transactions values('0000000348','1',99536000,'2013/03/11','16:49','1000000032')
insert into transactions values('0000000349','0',353000,'2012/03/16','02:45','1000000027')
insert into transactions values('0000000350','0',389000,'2015/10/08','23:47','1000000012')
insert into transactions values('0000000351','1',72423000,'2014/02/14','10:25','1000000041')
insert into transactions values('0000000352','1',13763000,'2013/09/27','11:16','1000000016')
insert into transactions values('0000000353','1',51814000,'2014/09/29','12:22','1000000043')
insert into transactions values('0000000354','1',91252000,'2013/06/02','14:34','1000000008')
insert into transactions values('0000000355','0',2514000,'2014/06/04','05:17','1000000054')
insert into transactions values('0000000356','0',4919000,'2013/06/18','12:22','1000000047')
insert into transactions values('0000000357','0',3143000,'2016/01/26','23:03','1000000032')
insert into transactions values('0000000358','0',1992000,'2010/04/12','23:45','1000000014')
insert into transactions values('0000000359','1',58270000,'2012/09/10','15:45','1000000046')
insert into transactions values('0000000360','1',74070000,'2012/02/19','16:56','1000000008')
insert into transactions values('0000000361','0',1680000,'2016/04/05','07:36','1000000032')
insert into transactions values('0000000362','1',55726000,'2014/01/25','10:59','1000000007')
insert into transactions values('0000000363','1',21146000,'2013/08/12','14:42','1000000047')
insert into transactions values('0000000364','1',78735000,'2017/12/01','16:46','1000000007')
insert into transactions values('0000000365','0',2671000,'2017/11/30','00:15','1000000031')
insert into transactions values('0000000366','1',95431000,'2012/10/22','16:41','1000000034')
insert into transactions values('0000000367','0',3909000,'2011/02/25','09:26','1000000026')
insert into transactions values('0000000368','1',21611000,'2012/12/19','16:55','1000000017')
insert into transactions values('0000000369','0',2331000,'2016/07/21','08:19','1000000039')
insert into transactions values('0000000370','1',97722000,'2017/10/09','15:37','1000000036')
insert into transactions values('0000000371','0',2549000,'2011/10/05','03:57','1000000007')
insert into transactions values('0000000372','1',85892000,'2012/10/29','11:51','1000000036')
insert into transactions values('0000000373','0',1567000,'2010/01/16','17:36','1000000022')
insert into transactions values('0000000374','1',16323000,'2013/09/01','09:40','1000000021')
insert into transactions values('0000000375','0',187000,'2010/05/15','16:42','1000000018')
insert into transactions values('0000000376','0',4229000,'2017/02/07','19:30','1000000031')
insert into transactions values('0000000377','1',59997000,'2014/12/11','09:30','1000000035')
insert into transactions values('0000000378','0',4296000,'2016/12/29','12:59','1000000026')
insert into transactions values('0000000379','0',4857000,'2014/03/30','01:16','1000000031')
insert into transactions values('0000000380','0',1799000,'2017/01/30','04:47','1000000002')
insert into transactions values('0000000381','1',44405000,'2015/09/06','08:57','1000000008')
insert into transactions values('0000000382','0',1668000,'2014/08/23','07:24','1000000054')
insert into transactions values('0000000383','1',40698000,'2011/07/16','15:15','1000000014')
insert into transactions values('0000000384','1',22497000,'2012/05/01','11:44','1000000043')
insert into transactions values('0000000385','1',49035000,'2017/06/08','09:48','1000000016')
insert into transactions values('0000000386','1',44783000,'2014/01/01','13:31','1000000044')
insert into transactions values('0000000387','1',56079000,'2015/08/28','15:41','1000000038')
insert into transactions values('0000000388','0',2951000,'2012/09/29','11:43','1000000015')
insert into transactions values('0000000389','1',28775000,'2015/06/24','09:26','1000000038')
insert into transactions values('0000000390','0',4035000,'2011/02/01','23:57','1000000008')
insert into transactions values('0000000391','1',92145000,'2013/01/07','15:16','1000000023')
insert into transactions values('0000000392','0',4447000,'2010/03/27','18:13','1000000023')
insert into transactions values('0000000393','1',38568000,'2013/08/28','11:28','1000000054')
insert into transactions values('0000000394','1',61242000,'2013/09/04','10:14','1000000040')
insert into transactions values('0000000395','0',1095000,'2016/10/29','23:55','1000000005')
insert into transactions values('0000000396','0',4208000,'2017/12/12','22:47','1000000044')
insert into transactions values('0000000397','0',1277000,'2012/01/15','20:09','1000000013')
insert into transactions values('0000000398','0',4794000,'2014/12/16','05:05','1000000043')
insert into transactions values('0000000399','1',69667000,'2015/09/14','10:12','1000000015')
insert into transactions values('0000000400','1',85228000,'2014/08/17','09:53','1000000016')
insert into transactions values('0000000401','1',2215000,'2014/09/03','13:18','1000000031')
insert into transactions values('0000000402','1',34163000,'2015/02/25','10:05','1000000012')
insert into transactions values('0000000403','0',4244000,'2017/11/30','00:54','1000000041')
insert into transactions values('0000000404','1',12142000,'2016/12/02','14:47','1000000029')
insert into transactions values('0000000405','1',45481000,'2013/03/23','11:22','1000000012')

--1.Liệt kê những giao dịch diễn ra trong quý IV năm 2016--
select t_id, t_date
from transactions
where YEAR(t_date)=2016 and DATEPART(qq,t_date)=4
--Where (month(t_date) between 10 and 12) and (year(t_date)=2016)--

--2.Liệt kê những giao dịch diễn ra trong mùa thu năm 2016
select t_id, t_date
from transactions
Where (month(t_date) between 7 and 9) and (year(t_date)=2016)

--3.Liệt kê những chi nhánh chưa có địa chỉ
select BR_name,BR_ad
from Branch
Where BR_ad like N''

--4.Hiển thị danh sách khách hàng có kí tự thứ 3 từ cuối lên là chữ a,u,i
select cust_id, cust_name
from customer

where right(cust_name,3) like 'a%' or right(cust_name,3) like 'u%' or right(cust_name,3) like 'i%'

--Cách 2:--
select cust_id, cust_name
from customer
where cust_name like '%[a, á, ả, à, ã, ạ, u, ú, ù, ụ, ủ, ũ, i, í, ì, ỉ, ĩ, ị]__'

--5.Liệt kê những khách hàng không sử dụng số điện  thoại của Mobiphone
select cust_id, cust_name, cust_phone
from customer
where cust_phone not like '09%'

--6.Hiển thị tên khách hàng và tên tỉnh thành phố mà họ sống--
select Cust_id,Cust_name, rtrim(right(Cust_ad,CHARINDEX(',',REVERSE(Cust_ad))-1))
from customer
where CHARINDEX(',',REVERSE(Cust_ad))>0

--cách 2--
SELECT Cust_id, Cust_name, RIGHT(Cust_ad, PATINDEX('%[-,]%', REVERSE(Cust_ad))-2)
FROM customer
WHERE PATINDEX('%[-,]%', REVERSE(Cust_ad)) > 0;

--9. Liệt kê những khách hàng không thuộc các chi nhánh miền bắc--
select cust_id,Cust_name,cust_phone,BR_id
from customer
Where BR_id NOT LIKE 'VB%'

--10. Liệt kê những tài khoản nhiều hơn 100 triệu trong tài khoản--
select ac_no, ac_balance
from account
where ac_balance > 100000000

--11. Liệt kê những giao dịch gửi tiền diễn ra ngoài giờ hành chính--
select t_id,t_time
from transactions
where t_type=1 and (DATEPART(HOUR, t_time) < 8 OR DATEPART(HOUR, t_time) >= 17);

--12. Liệt kê những giao dịch rút tiền diễn ra vào khoảng từ 0-3h sáng--
select t_id,t_time
from transactions
where t_type=0 and t_time between '00:00' and '03:00'

--13. Tìm những khách hàng có địa chỉ ở Ngũ Hành Sơn – Đà nẵng--
select cust_name, cust_phone, cust_ad
from customer
where cust_ad like N'%Ngũ Hành Sơn Đà Nẵng'

--14. Liệt kê những chi nhánh chưa có địa chỉ--
select BR_name,BR_ad
from Branch
Where BR_ad like N''

--5. Liệt kê những giao dịch rút tiền bất thường (nhỏ hơn 50.000)--
select t_id,t_amount
from transactions
where t_type =0 and t_amount < 50000

--16. Liệt kê các giao dịch gửi tiền diễn ra trong năm 2017.--
select t_id,t_date
from transactions
where t_type=1 and (year(t_date)=2017)

--17. Liệt kê những giao dịch bất thường (tiền trong tài khoản âm)--
select a.ac_no, ac_balance
from transactions t, account a
where ac_balance < 0

--18. Hiển thị tên khách hàng và tên tỉnh/thành phố mà họ sống--
select Cust_id,Cust_name, (right(Cust_ad,CHARINDEX(',',REVERSE(Cust_ad))-2))
from customer
where CHARINDEX(',',REVERSE(Cust_ad))>0

--19. Hiển thị danh sách khách hàng có họ tên không bắt đầu bằng chữ N, T--
select cust_id,cust_name
from customer
where cust_name not like N'N%' AND cust_name not like N'T%'

--20. Hiển thị danh sách khách hàng có kí tự thứ 3 từ cuối lên là chữ a, u, i--
select cust_id,cust_name
from customer
where cust_name like '% [a, á , à , ả , ã , ạ, u, ú, ù, ủ, ũ, ụ, i, í, ì, ỉ, ĩ, ị]__'

--21. Hiển thị khách hàng có tên đệm là Thị hoặc Văn--
select cust_name
from customer
where (cust_name like N'%Thị%' or cust_name like N'%Văn%') and cust_name not like N'%Văn'

--22. Hiển thị khách hàng có địa chỉ sống ở vùng nông thôn. Với quy ước: nông thôn là vùng mà địa chỉ chứa: thôn, xã, xóm--
select cust_name, cust_ad
from customer 
where (cust_ad like N'%THÔN%'or cust_ad like N'%XÓM%' or cust_ad LIKE N'%XÃ %')and cust_ad NOT LIKE N'%THỊ XÃ%'


--23. Hiển thị danh sách khách hàng có kí tự thứ hai của TÊN là chữ u hoặc ũ hoặc a.--
select Cust_id,Cust_name, (right(Cust_name,CHARINDEX(' ',REVERSE(Cust_name))-1))
from customer
where right(Cust_name,CHARINDEX(' ',REVERSE(Cust_name))-1) like N'_[u,ũ,a,ạ,ã,ả,à,á]%'


--Bài tập về nhà (tổng hợp)--
--1.Có bao nhiêu khách hàng có ở Quảng Nam thuộc chi nhánh ngân hàng Vietcombank Đà Nẵng--
--cot: count(cust_id)
--bang: customer, branch
--ddk: br_name= N"Vietcombank Da nang" and cust_ad=n'Quang Nam'
SELECT COUNT (Cust_id)
FROM CUSTOMER c JOIN BRANCH b ON c.Br_id=b.BR_id 
WHERE c.Cust_ad like N'%Quảng Nam' AND  b.BR_name like N'%Vietcombank Đà Nẵng'

--2.Hiển thị danh sách khách hàng thuộc chi nhánh Vũng Tàu và số dư trong tài khoản của họ.
--cot: cust_name, br_name, ac_balance
--bang: branch, account, customer
--đk: br_name chứa Vũng Tàu
select c.Cust_id,Cust_name, BR_name, ac_balance
from customer c join Branch b on c.Br_id=b.BR_id join Account a on c.cust_id=a.cust_id
WHERE BR_name like N'%Vũng Tàu%' 

--3.Trong quý 1 năm 2012, có bao nhiêu khách hàng thực hiện giao dịch rút tiền tại Ngân hàng Vietcombank?
--cot: count(t_amount)
--bang: customer, transaction, account, branch
--dk: khong co
select count(distinct c.cust_id) AS 'SỐ LƯỢNG KH'
from transactions t join ACCOUNT a on t.ac_no=a.Ac_no join customer c ON a.cust_id=c.Cust_id join branch b on c.Br_id=b.BR_id
WHERE t_type=0 and (DATEPART(q,t_date)=1) and (year(t_date)=2012) and b.BR_name like N'%Vietcombank%'

--4. Thống kê số lượng giao dịch, tổng tiền giao dịch trong từng tháng của năm 2014--
--cot: count(t_amount), sum(t_amount)
--bang: transaction, 
--đk: year(t_date)=2014
SELECT MONTH(t.t_date) AS Thang, COUNT(*) AS SoLuongGiaoDich, SUM(t.t_amount) AS 'TongTienGiaoDich'
FROM transactions t
WHERE YEAR(t.t_date) = 2014
GROUP BY MONTH(t.t_date)
ORDER BY Thang;


select br_id ,count(*)
from customer


--5.Thống kê tổng tiền khách hàng gửi của mỗi chi nhánh, sắp xếp theo thứ tự giảm dần của tổng tiền--
--cot: desc(sum(t_type=1))
--bang: transactions, branch
--đk: khong co
select B.BR_name,SUM(a.ac_balance) AS 'TONG TIEN KH GUI'
from customer c
join branch b on b.BR_id=c.Br_id
join account a on c.Cust_id=a.cust_id
GROUP BY b.BR_name
order by [TONG TIEN KH GUI] DESC
--6. Chi nhánh Sài Gòn có bao nhiêu khách hàng không thực hiện bất kỳ giao dịch nào trong vòng 3 năm trở lại đây. Nếu có thể, hãy hiển thị tên và số điện thoại của các khách đó để phòng marketing xử lý.--
--cot: cust_name, cust_phone
--bang: customer, transactions
--đk: giao dịch thực hiện trong vòng 3 năm
SELECT COUNT(distinct c.Cust_id) AS 'SỐ LƯỢNG KHÁCH HÀNG', c.Cust_name, c.Cust_phone
FROM customer c
JOIN account a ON c.cust_id = a.cust_id
JOIN transactions t ON t.ac_no = a.ac_no
JOIN branch b ON b.br_id = c.Br_id
WHERE b.Br_name LIKE N'%Sài Gòn' AND (t.t_id IS NULL or t.t_date <= DATEADD(YEAR, -3, GETDATE()))
GROUP BY c.Cust_name, c.Cust_phone


SELECT distinct c.Cust_name, c.Cust_phone
FROM customer c
LEFT JOIN account a ON c.Cust_id = a.Cust_id
LEFT outer JOIN transactions t ON a.Ac_no = t.Ac_no AND t.t_date >= DATEADD(YEAR, -3, GETDATE())
JOIN branch b ON c.Br_id = b.BR_id
WHERE b.BR_name LIKE N'%Sài Gòn' AND t.id is null



SELECT c.Cust_name, c.Cust_phone
FROM customer c
LEFT JOIN account a ON c.Cust_id = a.Cust_id
LEFT OUTER JOIN transactions t ON a.Ac_no = t.Ac_no AND t.t_date >= DATEADD(YEAR, -3, GETDATE())
JOIN branch b ON c.Br_id = b.BR_id
WHERE b.BR_name LIKE N'%Sài Gòn' AND t.t_id is null

UNION

SELECT 'Số lượng khách', count (distinct c.cust_id)
FROM customer c
LEFT JOIN account a ON c.Cust_id = a.Cust_id
LEFT OUTER JOIN transactions t ON a.Ac_no = t.Ac_no AND t.t_date >= DATEADD(YEAR, -3, GETDATE())
JOIN branch b ON c.Br_id = b.BR_id
WHERE b.BR_name LIKE N'%Sài Gòn' AND t.t_id is null



SELECT c.Cust_name, c.Cust_phone
FROM customer c
LEFT JOIN account a ON c.Cust_id = a.Cust_id
LEFT JOIN transactions t ON a.Ac_no = t.Ac_no AND t.t_date >= DATEADD(YEAR, -3, GETDATE())
JOIN branch b ON c.Br_id = b.BR_id
WHERE b.BR_name LIKE N'%Sài Gòn' AND t.Ac_no IS NULL
--Cách 2:--
SELECT COUNT(distinct c.Cust_id) AS 'SỐ LƯỢNG KHÁCH HÀNG', c.Cust_name, c.Cust_phone
FROM customer c
JOIN account a ON c.cust_id = a.cust_id
JOIN branch b ON b.br_id = c.Br_id
WHERE b.Br_name LIKE N'%Sài Gòn%' AND c.cust_id NOT IN (
    SELECT a.cust_id
    FROM account a
    JOIN transactions t ON t.ac_no = a.ac_no
    WHERE t.t_date >= DATEADD(YEAR, -3, GETDATE())
)
GROUP BY c.Cust_name, c.Cust_phone;
--7. Thống kê thông tin giao dịch theo mùa, nội dung thống kê gồm: số lượng giao dịch, lượng tiền giao dịch trung bình, tổng tiền giao dịch, lượng tiền giao dịch nhiều nhất, lượng tiền giao dịch ít nhất.
--cot: t_id, AVG(t_amount), sum(t_amount), max(t_amount), min(t_amount)
--bang: transactions, account
--ddkien: giao dịch theo mùa
SELECT 
	CASE
		WHEN MONTH(t.t_date) IN (1,2,3) then 'MUA XUAN'
		WHEN MONTH(t.t_date) IN (4,5,6) then 'MUA HA'
		WHEN MONTH(t.t_date) IN (7,8,9) then 'MUA THU'
		WHEN MONTH(t.t_date) IN (10,11,12) then 'MUA DONG'
	END AS 'MUA', 
	COUNT(*)'SỐ LƯỢNG GD',
	AVG(t.t_amount) 'LƯỢNG TIỀN GD TB',
	SUM(t.t_amount) 'TỔNG TIỀN GD',
	MAX (t.t_amount) 'LƯỢNG TIỀN GD NHIỀU NHẤT',
	MIN (t.t_amount) 'LƯỢNG TIỀN GD ÍT NHẤT'
FROM transactions t
GROUP BY MONTH(T.T_DATE)
ORDER BY MONTH(T.T_DATE)

--cách 2--
select count(t_amount) SL, avg(t_amount) TB, sum(t_amount) T, max(t_amount), min(t_amount)
from transactions
group by datepart (qq, t_date)
--8. Tìm số tiền giao dịch nhiều nhất trong năm 2016 của chi nhánh Huế. Nếu có thể, hãy đưa ra tên của khách hàng thực hiện giao dịch đó.--
--cot: max(t_amount)
--bang: branch, transactions, customer
--ddkien: year(t_date)=2016, br_name like Huế
SELECT BR_NAME,C.CUST_NAME,MAX(t.t_amount) 'SỐ TIỀN GD NHIỀU NHẤT'
FROM TRANSACTIONS T 
JOIN account A ON A.Ac_no=T.ac_no
JOIN CUSTOMER C ON C.Cust_id=A.cust_id
JOIN BRANCH B ON B.BR_id=C.Br_id
WHERE (YEAR(T.T_DATE)=2016) AND B.BR_NAME like N'%Huế'
GROUP BY C.Cust_name, BR_name

--CÁCH 2
select Cust_name, BR_name, t_amount
from Branch b, Account a, customer c, transactions t
where b.BR_id=c.Br_id and c.Cust_id=a.cust_id and t.ac_no = a.Ac_no
and t_amount = (select max(t_amount)
				from Branch b, Account a, customer c, transactions t
				where b.BR_id=c.Br_id and c.Cust_id=a.cust_id and t.ac_no = a.Ac_no
				and  BR_name like N'%Huế%' and year(t_date) = 2016)
--9.Tìm khách hàng có lượng tiền gửi nhiều nhất vào ngân hàng trong năm 2017 (nhằm mục đích tri ân khách hàng)--
SELECT top 1 C.Cust_name,T_AMOUNT,t_date
FROM CUSTOMER C
JOIN BRANCH B ON B.BR_id=C.Br_id
JOIN ACCOUNT A ON A.cust_id=c.cust_id
JOIN TRANSACTIONS T ON T.ac_no=A.Ac_no
Where t_type=1
GROUP BY C.Cust_name,t_date,t_amount
HAVING YEAR(T.T_DATE)=2017
order by t_amount desc
--10. Tìm những khách hàng có cùng chi nhánh với ông Phan Nguyên Anh--
SELECT c.Cust_name, B.BR_name
FROM customer c
JOIN branch b ON b.BR_id = c.Br_id
WHERE c.Br_id IN (
    SELECT c2.Br_id
    FROM customer c2
    WHERE c2.Cust_name = 'Phan Nguyên Anh'
)
--11.Liệt kê những giao dịch thực hiện cùng giờ (t_time=t_time của LNHV)
--với giao dịch của ông Lê Nguyễn Hoàng Văn ngày 2016-12-02--
SELECT t.t_id,t_date, c.cust_name,t_time
FROM transactions t
JOIN account a ON t.ac_no = a.Ac_no
JOIN customer c ON a.cust_id = c.Cust_id
where t_date='2016-12-02'
and cust_name<> N'Lê Nguyễn Hoàng Văn'
and datepart(hh,t_time)= (select datepart(hh,t_time)
				FROM transactions t
				JOIN account a ON t.ac_no = a.Ac_no
				JOIN customer c ON a.cust_id = c.Cust_id
				where cust_name like N'Lê Nguyễn Hoàng Văn' and t_date='2016-12-02')

 --Cách 2:
 SELECT t1.t_id, t1.t_type, t1.t_amount, t1.t_date, t1.t_time, t1.ac_no
FROM transactions t1
JOIN transactions t2 ON t1.t_time = t2.t_time
JOIN account a ON t2.ac_no = a.Ac_no
JOIN customer c ON a.cust_id = c.Cust_id
WHERE c.Cust_name = N'Lê Nguyễn Hoàng Văn'
    AND t2.t_date = '2016-12-02'
--12. Hiển thị danh sách khách hàng ở cùng thành phố 
--với Trần Văn Thiện Thanh (subquerry)
select cust_id,Cust_name,Cust_ad
from customer c 
join Branch b on c.Br_id=b.BR_id
where RTRIM(RIGHT(Cust_ad, PATINDEX('%[-,]%', REVERSE(Cust_ad))-1))=(select RTRIM(RIGHT(Cust_ad, PATINDEX('%[-,]%', REVERSE(Cust_ad))-1))
				from customer c 
				join Branch b on c.Br_id=b.BR_id
				where cust_name=N'Trần Văn Thiện Thanh')
				AND cust_name!=N'Trần Văn Thiện Thanh'
--13.Tìm những giao dịch diễn ra cùng ngày với giao 
--dịch có mã số 0000000217--
select t_id
from transactions t
where (datepart(dd,t_date))=(select datepart(dd,t_date)
					from transactions t
					where t_id='0000000217')
					and t_id<>'0000000217'
--14. Tìm những giao dịch cùng loại với giao dịch 
--có mã số 0000000387--
select t_id
from transactions t
where t_type=(select t_type
					from transactions t
					where t_id='0000000387')
					and t_id<>'0000000387'
--15. Những chi nhánh nào thực hiện nhiều giao dịch 
--gửi tiền trong tháng 12/2015 hơn chi nhánh Đà Nẵng--
select br_name
FROM CUSTOMER C
JOIN BRANCH B ON B.BR_id=C.Br_id
JOIN ACCOUNT A ON A.cust_id=c.cust_id
JOIN TRANSACTIONS T ON T.ac_no=A.Ac_no
where t_date like'2015-12%' and t_type=1 
group by br_name
having count(t_id)>(select count(t_id)
									FROM CUSTOMER C
									JOIN BRANCH B ON B.BR_id=C.Br_id
									JOIN ACCOUNT A ON A.cust_id=c.cust_id
									JOIN TRANSACTIONS T ON T.ac_no=A.Ac_no
									where  t_type=1 and t_date like'2015-12%' and BR_name like N'%Đà Nẵng')
--16. Hãy liệt kê những tài khoản trong vòng 6 tháng trở lại đây không phát sinh giao dịch
select t.Ac_no
from account a join transactions t on a.ac_no=t.ac_no
where t.t_id is NULL or t.t_date<=dateadd(month, -6, GETDATE())

--17. Ông Phạm Duy Khánh thuộc chi nhánh nào? Từ 01/2017 đến nay 
--ông Khánh đã thực hiện bao nhiêu giao dịch gửi tiền vào ngân hàng 
--với tổng số tiền là bao nhiêu.
SELECT BR_NAME 'Chi nhánh'
from branch b join customer c on c.Br_id=b.BR_id
where cust_name like N'Phạm Duy Khánh'

select count(t_id) 'SỐ GIAO DỊCH', sum(t_amount) 'TỔNG SỐ TIỀN'
from customer c
JOIN ACCOUNT A ON A.cust_id=c.cust_id
JOIN TRANSACTIONS T ON T.ac_no=A.Ac_no
where t_type=1 and cust_name=N'Phạm Duy Khánh' and t_date >= '2017/01/01'

--18. Thống kê giao dịch theo từng năm, nội dung thống kê gồm: 
--số lượng giao dịch, lượng tiền giao dịch trung bình
select count(t_id) 'SỐ LƯỢNG GIAO DỊCH', avg(t_amount) 'LƯỢNG TIỀN GIAO DỊCH TRUNG BÌNH',YEAR(T_DATE) 'NĂM'
from transactions t
GROUP BY YEAR(T_DATE)
ORDER BY YEAR(T_DATE) ASC

--19.Thống kê số lượng giao dịch theo ngày và đêm trong năm 2017 ở 
--chi nhánh Hà Nội, Sài Gòn
SELECT 
CASE
		when datepart(hour,t_time)>=6 and datepart(hour, t_time) <18 THEN 'Ngày'
		ELSE 'Đêm'
	end as 'Thời điểm',
	COUNT(T_ID) 'SỐ LƯỢNG GD'
FROM transactions t 
join account a on a.Ac_no=t.ac_no
join customer c on c.Cust_id=a.cust_id
join branch b on b.BR_id=c.Br_id
where br_name like N'%Hà Nội' or br_name like N'%Sài Gòn' and (year(t_date)=2017)
GROUP BY 
	CASE
		when datepart(hour,t_time)>=6 and datepart(hour, t_time) <18 THEN 'Ngày'
		ELSE 'Đêm'
	end
order by
	CASE
		when datepart(hour,t_time)>=6 and datepart(hour, t_time) <18 THEN 'Ngày'
		ELSE 'Đêm'
	end
--20. Hiển thị danh sách khách hàng chưa thực hiện giao dịch nào 
--trong năm 2017?
select c.cust_id, cust_name,t_date
from customer c
join account a on a.cust_id=c.Cust_id
join transactions t on t.ac_no= a.ac_no
where t_id is NULL or year(t_date)=2017
--21. Hiển thị những giao dịch trong mùa xuân của các chi nhánh miền 
--trung. Gợi ý: giả sử một năm có 4 mùa, mỗi mùa kéo dài 3 tháng; 
--chi nhánh miền trung có mã chi nhánh bắt đầu bằng VT.
SELECT t.t_id, t.t_amount, t.t_date,b.br_id,'MÙA XUÂN' AS MÙA
FROM transactions t
JOIN account a ON a.Ac_no = t.ac_no
JOIN customer c ON c.Cust_id = a.cust_id
JOIN Branch b ON b.BR_id = c.Br_id
WHERE MONTH(t.t_date) >= 1 AND MONTH(t.t_date) <= 3 AND b.BR_id LIKE 'VT%'

--22.Hiển thị họ tên và các giao dịch của khách hàng sử
--dụng số điện thoại có 3 số đầu là 093 và 2 số cuối là 02.
select cust_name,t_id,Cust_phone
from transactions t
join account a on a.ac_no=t.ac_no
join customer c on c.Cust_id=a.cust_id
join Branch b on b.BR_id=c.Br_id
where cust_phone like '0[9]3%0[2]'

--23. Hãy liệt kê 2 chi nhánh làm việc kém hiệu quả nhất 
--trong toàn hệ thống (số lượng giao dịch gửi tiền ít nhất)
--trong quý 3 năm 2017 
select top 2 b.br_name, count(t_id) 'SỐ LƯỢNG GIAO DỊCH GỬI TIỀN'
from transactions t
join account a on a.ac_no=t.ac_no
join customer c on c.Cust_id=a.cust_id
join Branch b on b.BR_id=c.Br_id
where datepart(qq,t_date)=3 and year(t_date)=2017 and t_type=1
group by b.br_name
order by count(t_id) asc

--24. Hãy liệt kê 2 chi nhánh có bận mải nhất hệ thống 
--(thực hiện nhiều giao dịch gửi tiền nhất) trong năm 2017 
select TOP 2 b.br_name,COUNT(T_ID) 'SỐ LƯỢNG GIAO DỊCH'
from transactions t
join account a on a.ac_no=t.ac_no
join customer c on c.Cust_id=a.cust_id
join Branch b on b.BR_id=c.Br_id
where year(t_date)=2017 and t_type=1
group by b.br_name
ORDER BY COUNT(T_ID) DESC

--25.Tìm giao dịch gửi tiền nhiều nhất trong mùa đông. Nếu có
--thể, hãy đưa ra tên của người thực hiện giao dịch và 
--chi nhánh.
SELECT TOP 1 C.CUST_NAME,t_id, BR_NAME, max(T.T_AMOUNT) 'SO TIEN GUI NHIEU NHAT',t_date 'MÙA ĐÔNG'
FROM TRANSACTIONS T 
JOIN ACCOUNT A ON A.AC_NO = T.AC_NO 
JOIN CUSTOMER C ON C.CUST_ID = A.CUST_ID 
JOIN BRANCH B ON B.BR_ID = C.BR_ID
WHERE T_TYPE=1 AND (MONTH(T_DATE) BETWEEN 10 AND 12)
GROUP BY C.CUST_NAME,t_id, BR_NAME,t_date
order by max(t_amount) desc
--26.Để bổ sung nhân sự cho các chi nhánh, cần có kết quả 
--phân tích về cường độ làm việc của họ. Hãy liệt kê những chi 
--nhánh phải làm việc qua trưa và loại giao dịch là gửi tiền.--
SELECT BR_name,T_TYPE,T_TIME
FROM CUSTOMER C JOIN BRANCH B ON B.BR_ID=C.BR_ID
JOIN ACCOUNT A ON A.cust_id=C.Cust_id
JOIN transactions T ON T.ac_no=A.Ac_no
WHERE T_TYPE=1 AND T_TIME BETWEEN '12:00' AND '14:00'
GROUP BY BR_name,T_TYPE,T_TIME
ORDER BY T_TIME ASC
--27. Hãy liệt kê các giao dịch bất thường. Gợi ý: là các 
--giao dịch gửi tiền những được thực hiện ngoài khung giờ làm 
--việc và cho phép overtime (từ sau 16h đến trước 7h)
SELECT T_ID
FROM TRANSACTIONS T JOIN ACCOUNT A ON A.AC_NO=T.AC_NO
WHERE (DATEPART(HOUR,T_TIME)<7 AND DATEPART(HOUR,T_TIME)>=16) AND T_TYPE=1

--28.Hãy điều tra những giao dịch bất thường trong năm 2017. 
--Giao dịch bất thường là giao dịch diễn ra trong khoảng thời
--gian từ 12h đêm tới 3 giờ sáng.
SELECT T_ID,T_TIME
FROM transactions T
WHERE YEAR (T_DATE)=2017 AND T_TIME BETWEEN '00:00' AND '03:00'
GROUP BY T_ID, T_TIME
ORDER BY T_TIME ASC

--CÁCH 2:
SELECT T_ID,T_TIME
FROM transactions
WHERE YEAR(t_date) = 2017
AND (DATEPART(HOUR, t_time) >= 0 AND DATEPART(HOUR, t_time) < 3)
GROUP BY T_ID, T_TIME
ORDER BY T_TIME ASC

--29. Có bao nhiêu người ở Đắc Lắc sở hữu nhiều hơn một tài khoản?--
SELECT COUNT(DISTINCT C.CUST_ID) 'SỐ LƯỢNG NGƯỜI'
FROM CUSTOMER C 
JOIN BRANCH B ON C.BR_ID=B.BR_ID
JOIN ACCOUNT A ON C.Cust_id=A.cust_id
WHERE Cust_ad LIKE N'%ĐĂK LĂK%' AND (Ac_no>1)

--30. Nếu mỗi giao dịch rút tiền ngân hàng thu phí 3.000 đồng,
--hãy tính xem tổng tiền phí thu được từ thu phí dịch vụ từ 
--năm 2012 đến năm 2017 là bao nhiêu?
SELECT COUNT(*)*3000 'TỔNG TIỀN PHÍ'
FROM transactions T
WHERE (T_TYPE=0) AND (YEAR(T_DATE) BETWEEN 2012 AND 2017)

--31.Hiển thị thông tin các khách hàng họ Trần theo các cột sau:
SELECT C.CUST_ID 'Mã KH', REVERSE(SUBSTRING(REVERSE(CUST_NAME), CHARINDEX(' ', REVERSE(CUST_NAME),0)+1,100))'Họ', REVERSE(LEFT(REVERSE(cust_name), CHARINDEX(' ',REVERSE(CUST_NAME),0)-1))'Tên', ac_balance 'Số dư tài khoản'
FROM CUSTOMER C JOIN ACCOUNT A ON A.cust_id=C.Cust_id
where cust_name like N'Trần%'

--32.Cuối mỗi năm, nhiều khách hàng có xu hướng rút tiền 
--khỏi ngân hàng để chuyển sang ngân hàng khác hoặc 
--chuyển sang hình thức tiết kiệm khác. Hãy lọc những
--khách hàng có xu hướng rút tiền khỏi ngân hàng bằng
--hiển thị những người rút gần hết tiền trong tài khoản 
--(tổng tiền rút trong tháng 12/2017 nhiều hơn 100 
--triệu và số dư trong tài khoản còn lại <= 100.000)
select c.cust_id, cust_name
from customer c
join account a on a.cust_id=c.cust_id
join transactions t on t.ac_no=a.Ac_no
where t_type=0 and t_date like '2017/12%' and ac_balance <=100000 
group by c.cust_id, cust_name
having sum(t_amount)>100000000

--33.Thời gian vừa qua, hệ thống CSDL của ngân hàng bị 
--hacker tấn công (giả sử tí cho vui J), tổng tiền trong 
--tài khoản bị thay đổi bất thường. Hãy liệt kê những tài 
--khoản bất thường đó. Gợi ý: tài khoản bất thường là tài 
--khoản có tổng tiền gửi – tổng tiền rút <> số tiền trong 
--tài khoản
SELECT a.Ac_no, c.Cust_name, 
       SUM(CASE WHEN t.t_type = '1' THEN t.t_amount ELSE -t.t_amount END) AS 'Tổng tiền gửi-tổng tiền rút', a.ac_balance
FROM account a
JOIN customer c ON a.cust_id = c.Cust_id
JOIN transactions t ON a.Ac_no = t.ac_no
GROUP BY a.Ac_no, c.Cust_name, a.ac_balance
HAVING SUM(CASE WHEN t.t_type = '1' THEN t.t_amount ELSE -t.t_amount END) <> a.ac_balance 


--Cách 2:--
SELECT a.Ac_no, c.Cust_name, 
       SUM(CASE WHEN t.t_type = '1' THEN t.t_amount ELSE -t.t_amount END) AS 'Tổng tiền gửi',
       SUM(CASE WHEN t.t_type = '0' THEN t.t_amount ELSE -t.t_amount END) AS 'Tổng tiền rút',
       a.ac_balance
FROM account a
JOIN customer c ON a.cust_id = c.Cust_id
JOIN transactions t ON a.Ac_no = t.ac_no
GROUP BY a.Ac_no, c.Cust_name, a.ac_balance
HAVING SUM(CASE WHEN t.t_type = '1' THEN t.t_amount ELSE -t.t_amount END) + SUM(CASE WHEN t.t_type = '0' THEN t.t_amount ELSE -t.t_amount END) <> a.ac_balance;

--34. Do hệ thống mạng bị nghẽn và hệ thống xử lý chưa tốt 
--phần điều khiển đa người dùng nên một số tài khoản bị 
--invalid. Hãy liệt kê những tài khoản đó. Gợi ý: tài 
--khoản bị invalid là những tài khoản có số tiền âm. Nếu 
--có thể hãy liệt kê giao dịch gây ra sự cố tài khoản âm.
--Giao dịch đó được thực hiện ở chi nhánh nào? (mục đích 
--để quy kết trách nhiệm J)
select ac_no, br_name,ac_balance
from account a 
join customer c on c.Cust_id=a.cust_id
join branch b on b.BR_id=c.Br_id
where ac_balance<0 

--35. (Giả sử) Gần đây, một số khách hàng ở chi nhánh Đà 
--Nẵng kiện rằng: tổng tiền trong tài khoản không khớp với
--số tiền họ thực hiện giao dịch. Hãy điều tra sự việc này
--bằng cách hiển thị danh sách khách hàng ở Đà Nẵng bao gồm
--các thông tin sau: mã khách hàng, họ tên khách hàng, tổng
--tiền đang có trong tài khoản, tổng tiền đã gửi, tổng 
--tiền đã rút, kết luận (nếu tổng tiền gửi – tổng tiền 
--rút = số tiền trong tài khoản à OK, trường hợp còn lại 
--là có sai)
select C.cust_id 'Mã khách hàng', cust_name 'Họ tên khách hàng', sum(ac_balance) 'Tổng tiền trong tài khoản', 
SUM(CASE WHEN t.t_type = '1' THEN t.t_amount ELSE 0 END) 'Tổng tiền đã gửi',
SUM (CASE WHEN T_TYPE= '0' THEN T.T_AMOUNT ELSE 0 END) 'Tổng tiền rút',
CASE WHEN SUM(CASE WHEN t.t_type = '1' THEN t.t_amount ELSE 0 END)-SUM(CASE WHEN T_TYPE= '0' THEN T.T_AMOUNT ELSE 0 END)=ac_balance THEN 'OK' ELSE 'SAI'
END 'KẾT LUẬN'
from customer c
join branch b on c.Br_id=b.BR_id
JOIN ACCOUNT A ON A.cust_id=C.Cust_id
JOIN transactions T ON T.ac_no=A.Ac_no
WHERE BR_NAME LIKE N'%Đà Nẵng' 
GROUP BY C.Cust_id,CUST_NAME,ac_balance

--36.Ngân hàng cần biết những chi nhánh nào có nhiều giao
--dịch rút tiền vào buổi chiều để chuẩn bị chuyển tiền tới.
--Hãy liệt kê danh sách các chi nhánh và lượng tiền rút 
--trung bình theo ngày (chỉ xét những giao dịch diễn ra 
--trong buổi chiều), sắp xếp giảm giần theo lượng tiền 
--giao dịch.
select br_name, t_time,avg(t_amount) 'Lượng tiền rút trung bình', datepart(dd,t_date) 'Theo ngày' 
from customer c
join branch b on c.Br_id=b.BR_id
JOIN ACCOUNT A ON A.cust_id=C.Cust_id
JOIN transactions T ON T.ac_no=A.Ac_no
where t_time >='12:00' and t_time < '18:00'
group by br_name,t_date,t_time
order by avg(t_amount) desc





SELECT AVG(t_amount) AS 'Trung bình 1 lần gửi tiền'
FROM transactions t
JOIN account a ON t.ac_no = a.Ac_no
JOIN customer c ON a.cust_id = c.Cust_id
JOIN Branch b ON c.Br_id = b.BR_id
WHERE b.BR_name like N'%Cà Mau' AND t.t_type = '1'




--Thống kê số lượng khách chưa thực hiện giao dịch nào của mỗi chi nhánh. Sắp xếp giảm dần theo số lượng khách
select count(c.cust_id) 'SỐ LƯỢNG KHÁCH CHƯA THỰC HIỆN GIAO DỊCH',br_name 'Chi nhánh'
from customer c
join branch b on b.BR_id=c.Br_id
join account a on c.Cust_id=a.cust_id
left outer join transactions t on t.ac_no=a.Ac_no
where t_id is NULL
GROUP BY BR_name
ORDER BY COUNT(c.cust_id) desc 



DECLARE @count int, @name nvarchar(100)
set @count=0
while @count<10
begin
	select @name=cust_name from customer
	where cust_id='00000' + cast(@count as varchar)
	print @name
	set @count = @count + 1
end


--In ra tên của chi nhánh VN012--
--input:VN012
--output: tên chi nhánh
--process:
--1) lấy tên chi nhánh với dk br_id='VN012' --> @tenCN
--2) in @tenCN
go
declare @tenCN nvarchar(100) 
set @tenCN =(select br_name from branch where br_id ='VN012')
print @tenCN

--IN RA DÃY LẺ SỐ 1-1000
--input: 
--output: dãy số lẻ <=999
--process:
--1) @count=1
--2) lặp: 
--in @count
-- tăng @count lên 2 đơn vị

declare @count int=1
while @count<=999
begin 
	print @count
	set @count =@count+2
end

go
declare @count int=0
while @count<=1000
begin 
	print @count
	set @count=@count+2
end

---Trần Văn Thiện Thanh đã thực hiện giao dịch nào chưa?--
--input: Trần Văn Thiện Thanh
--output: đã thực hiện giao dịch t_id--
--process

DECLARE @dem int
SELECT @dem = count(t_id) 
		FROM transactions t
		JOIN account a ON t.ac_no = a.ac_no
		JOIN customer c ON a.cust_id = c.cust_id
		JOIN branch b ON c.br_id = b.br_id
		WHERE cust_name = N'Trần Văn Thiện Thanh' 

if @dem>0
begin
	print N'Rồi'
end
else
begin
	print N'Chưa'
end
--Chi nhánh Huế có bao nhiêu khách hàng ?--
declare @KH int
select @KH=count(cust_id)
from Branch b join customer on customer.Br_id=b. BR_id
where br_name like N'%Huế'
print N'Có' + cast(@KH AS  varchar)+ N'khách hàng ở chi nhánh Huế'

--Ông Trần Văn Thiện Thanh sống ở thành phố nào--
declare @addcust nvarchar(100)
set @addcust = (select rtrim(right(Cust_ad,CHARINDEX(',',REVERSE(Cust_ad))-1)) from customer where cust_name like N'Trần Văn Thiện Thanh')
print N'Sống' + cast(@addcust as nvarchar)

--In ra bảng cửu chương--
--input: 
--output:
--process:

DECLARE @i INT = 1;
WHILE @i < 11
BEGIN
    DECLARE @line VARCHAR(100) = '';

    DECLARE @j INT = 2;
    WHILE @j < 10
    BEGIN
        DECLARE @result INT = @j * @i;
        SET @line = CONCAT(@line, @j, 'x', @i, '=', @result, CHAR(9));
        SET @j = @j + 1;
    END

    PRINT @line;
    SET @i = @i + 1;
END
