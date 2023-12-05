create database THU
go
use THU
go
create table Nganh(
	MaNganh char(3),
	TenNganh nvarchar(100)
)
go
create table GiangVien(
	MaGV char(4),
	TenGV nvarchar(100)
)
go
create table SinhVien(
	MaSV char(12),
	HoTen nvarchar(100),
	NgaySinh date,
	SoDT varchar(15)
)
go
create table MonHoc(
	MaMon char(7),
	TenMon nvarchar(100),
	SoTC tinyint,
	LoaiMon bit, --: 1: bat buoc, 0: tu chon
	MonTienQuyet char(7), --ma mon hoc tien quyet
)
go
create table Diem(
	MaSV char(12),
	MaMon char(7),
	HocKy nvarchar(100),
	MaGV char(4),
	Diem float
)
go
insert into Nganh values('K21',N'Quản trị HTTT')
insert into Nganh values('K14',N'Tin học quản lý')
insert into Nganh values('K05',N'Thống kê')
insert into Nganh values('K22',N'Thương mại điện tử')
insert into Nganh values('K29',N'Khoa học dữ liệu')
insert into Nganh values('K32',N'Kinh tế quốc tế')
go
insert into GiangVien values ('GV01',N'Nguyễn Bá Thành')
insert into GiangVien values ('GV02',N'Trần Thanh Thủy')
insert into GiangVien values ('GV03',N'Lê Bá Hoàng')
insert into GiangVien values ('GV04',N'Đào Thị Ý Liên')
insert into GiangVien values ('GV05',N'Hoàng Thu Hiền')
insert into GiangVien values ('GV06',N'Khổng Thành Danh')
insert into GiangVien values ('GV07',N'Phan Đình Phùng')
insert into GiangVien values ('GV08',N'Đặng Tiến Tùng')
go
insert into SinhVien values('151121505150',N'Nguyễn Quốc Trung','1997-11-07','01649052843')
insert into SinhVien values('151121505151',N'Nguyễn Cẩm Tú','1996-01-03','0906570122')
insert into SinhVien values('151121505153',N'Nguyễn Thị Tường','1997-09-19','1656616271')
insert into SinhVien values('151121505155',N'Trần Thị Thanh Vân','1996-06-01','0964814041')
insert into SinhVien values('151121505157',N'Đặng Thị Thu Yên','1997-05-06','01632188064')
insert into SinhVien values('151121514130',N'Hồ Thị Oanh','1997-07-04','0981361941')
insert into SinhVien values('151121521101',N'Nguyễn Đình Anh','1997-08-27','01224836902')
insert into SinhVien values('151121521113',N'Lê Thị Mỹ Huyền','1997-10-24','01266636185')
insert into SinhVien values('151121521125',N'Đào Quốc Nghĩa','1997-02-16','0963044777')
insert into SinhVien values('151121521126',N'Hồ Trọng Nghĩa','1996-09-21','976711314')
insert into SinhVien values('151121521148',N'Phạm Thanh Tùng','1997-03-11','0904454299')
insert into SinhVien values('161121514108',N'Nguyễn Ngọc Hà','1997-01-01','0905659365')
insert into SinhVien values('161121514112',N'Võ Việt Hiếu','1997-06-02','0914226768')
insert into SinhVien values('161121514114',N'Đặng Khánh Lam','1998-01-20','0985520548')
insert into SinhVien values('161121514121',N'Trần Phước Minh Luận','1998-08-19','01268023919')
insert into SinhVien values('161121514123',N'Phan Đức Minh','1998-04-04','01219015560')
insert into SinhVien values('161121514131',N'Nguyễn Văn Quang','1998-02-24','0935295652')
insert into SinhVien values('161121514139',N'Lương Chí Thắng','1998-09-18','01223372993')
insert into SinhVien values('161121514144',N'Lê Thị Mộng Thùy','1998-06-23','01264882896')
insert into SinhVien values('161121514146',N'Phạm Thị Trang','1998-05-20','01674786351')
insert into SinhVien values('161121521104',N'Lê Viết Dũng','1998-10-20','01652043206')
insert into SinhVien values('161121521115',N'Phạm Văn Huy','1998-04-05','01683527149')
insert into SinhVien values('161121521118',N'Ngô Thị Kim Kha','1998-04-20','01684644723')
insert into SinhVien values('161121521130',N'Lê Thị Hồng Ngọc','1997-03-22','0935120945')
insert into SinhVien values('161121521144',N'Trần Ngọc Thái Sơn','1997-01-19','0935650775')
insert into SinhVien values('161121521154',N'Hoàng Toàn','1995-03-05','0964957600')
insert into SinhVien values('161121521166',N'Phạm Nguyễn Anh Vương','1997-05-10','01694856119')
go
insert into MonHoc values('MIS2002',N'Hệ thống thông tin quản lý',3,1,'')
insert into MonHoc values('LAW1001',N'Pháp luật đại cương',2,1,'')
insert into MonHoc values('ENG1011',N'PRE-IELTS 1',3,1,'')
insert into MonHoc values('ENG1012',N'PRE-IELTS 2 ',2,1,'')
insert into MonHoc values('MGT1002',N'Quản trị học',3,1,'')
insert into MonHoc values('MIS3001',N'Cơ sở lập trình',3,1,'')
insert into MonHoc values('TOU1001',N'Giao tiếp trong kinh doanh',3,1,'')
insert into MonHoc values('ENG1013',N'IELTS BEGINNERS 1',3,1,'')
insert into MonHoc values('ENG1014',N'IELTS BEGINNERS 2',3,1,'')
insert into MonHoc values('MGT1001',N'Kinh tế vi mô',3,1,'')
insert into MonHoc values('ECO1001',N'Kinh tế vĩ mô',3,1,'')
insert into MonHoc values('ENG2011',N'IELTS PRE-INTERMEDIATE 1',3,1,'')
insert into MonHoc values('ENG2012',N'IELTS PRE-INTERMEDIATE 2',2,1,'')
insert into MonHoc values('MIS3002',N'Mạng và truyền thông',3,1,'')
insert into MonHoc values('MKT2001',N'Marketing căn bản ',3,1,'')
insert into MonHoc values('ACC1001',N'Nguyên lý kế toán',3,1,'')
insert into MonHoc values('MGT2002',N'Nhập môn kinh doanh',3,1,'')
insert into MonHoc values('HRM3001',N'Quản trị nguồn nhân lực',3,1,'')
insert into MonHoc values('MIS2011',N'Thực tập nhận thức',2,1,'')
insert into MonHoc values('SMT1001',N'Các nguyên lý cơ bản CN Mác – Lê Nin 1',2,1,'')
insert into MonHoc values('MIS2001',N'Cơ sở dữ liệu ',3,1,'')
insert into MonHoc values('HRM2001',N'Hành vi tổ chức',3,1,'')
insert into MonHoc values('ENG2014',N'IELTS INTERMEDIATE 2',2,1,'')
insert into MonHoc values('ENG2013',N'IELTS INTERMEDIATE 1',3,1,'')
insert into MonHoc values('ACC2003',N'Kế toán tài chính',3,1,'')
insert into MonHoc values('STA2002',N'Thống kê kinh doanh và kinh tế',3,1,'')
insert into MonHoc values('MIS3003',N'An toàn và bảo mật hệ thống thông tin',3,1,'')
insert into MonHoc values('SMT1002',N'Các nguyên lý cơ bản CN Mác – Lê Nin 2',3,1,'')
insert into MonHoc values('LAW2001',N'Luật kinh doanh',3,1,'')
insert into MonHoc values('MIS3008',N'Quản trị cơ sở dữ liệu',3,1,'')
insert into MonHoc values('MIS3012',N'Quản trị mạng',3,1,'')
insert into MonHoc values('FIN2001',N'Thị trường và các định chế tài chính',3,1,'')
insert into MonHoc values('ENG3001',N'Tiếng Anh kinh doanh',3,1,'')
insert into MonHoc values('MIS3007',N'Phân tích và thiết kế hệ thống thông tin',3,0,'')
insert into MonHoc values('MIS2013',N'Thực tập nghề nghiệp',2,1,'')
insert into MonHoc values('MIS3009',N'Kho và khai phá dữ liệu',3,1,'')
insert into MonHoc values('IBS2001',N'Kinh doanh quốc tế',3,1,'')
insert into MonHoc values('MIS3004',N'Quản trị dự án công nghệ thông tin',3,1,'')
insert into MonHoc values('SMT1004',N'Tư tưởng Hồ Chí Minh',2,1,'')
insert into MonHoc values('MIS3011',N'Hệ thống hoạch định nguồn lực doanh nghiệp',3,1,'')
insert into MonHoc values('MIS3013',N'Kinh doanh điện tử',3,0,'')
insert into MonHoc values('MGT3002',N'Quản trị chuỗi cung ứng',3,0,'')
insert into MonHoc values('MIS3039',N'Thực hành Phân tích và Thiết kế HTTT',2,0,'MIS3007')
insert into MonHoc values('MIS3040',N'Thực hành Quản trị CSDL',2,0,'MIS3008')
insert into MonHoc values('SMT1003',N'Đường lối cách mạng của Đảng cộng sản Việt Nam',3,1,'')
insert into MonHoc values('MIS3036',N'Thực hành hệ thống hoạch định nguồn lực doanh nghiệp',2,1,'MIS3011')
insert into MonHoc values('MIS3038',N'Thực hành Quản trị dự án CNTT',2,1,'MIS3004')
insert into MonHoc values('MIS3037',N'Thực hành thiết kế kho và phân tích dữ liệu kinh doanh',2,1,'MIS3009')
insert into MonHoc values('ACC3008',N'Hệ thống thông tin kế toán',3,0,'')
insert into MonHoc values('HRM3002',N'Phát triển kỹ năng quản trị',3,0,'')
insert into MonHoc values('COM3003',N'Quản trị quan hệ khách hàng',3,0,'')
insert into MonHoc values('MGT3003',N'Quản trị sản xuất',3,0,'')
insert into MonHoc values('MIS4002',N'Thực tập tốt nghiệp',10,1,'')
go
insert into Diem values('161121521130','ENG3001',N'Kỳ 1 năm 2023-2024','GV02',4)
insert into Diem values('161121514144','LAW2001',N'Kỳ 1 năm 2020-2021','GV04',7)
insert into Diem values('151121521125','ENG1012',N'Kỳ 1 năm 2023-2024','GV08',1)
insert into Diem values('161121514139','ACC1001',N'Kỳ 1 năm 2022-2023','GV05',5)
insert into Diem values('151121505157','ACC2003',N'Kỳ 2 năm 2022-2023','GV04',7)
insert into Diem values('161121514139','MIS2011',N'Kỳ 2 năm 2021-2022','GV03',2)
insert into Diem values('151121505155','MIS3001',N'Kỳ 2 năm 2022-2023','GV01',7)
insert into Diem values('161121514146','ENG3001',N'Kỳ 1 năm 2023-2024','GV08',1)
insert into Diem values('151121514130','SMT1004',N'Kỳ 1 năm 2021-2022','GV04',7)
insert into Diem values('151121521125','ECO1001',N'Kỳ 1 năm 2022-2023','GV05',3)
insert into Diem values('161121514121','MGT3003',N'Kỳ 1 năm 2022-2023','GV05',2)
insert into Diem values('151121505153','MGT2002',N'Kỳ 1 năm 2023-2024','GV04',7)
insert into Diem values('151121521101','MIS3039',N'Kỳ 1 năm 2021-2022','GV04',6)
insert into Diem values('161121521115','MIS2002',N'Kỳ 1 năm 2022-2023','GV03',2)
insert into Diem values('161121521166','MIS3036',N'Kỳ 1 năm 2023-2024','GV04',9)
insert into Diem values('151121514130','MGT3002',N'Kỳ 1 năm 2023-2024','GV07',4)
insert into Diem values('151121505153','MIS3039',N'Kỳ 2 năm 2020-2021','GV08',6)
insert into Diem values('151121505150','ACC3008',N'Kỳ 1 năm 2023-2024','GV02',6)
insert into Diem values('151121505150','MIS3008',N'Kỳ 2 năm 2022-2023','GV01',5)
insert into Diem values('161121514114','MGT2002',N'Kỳ 1 năm 2020-2021','GV01',8)
insert into Diem values('161121521118','ENG3001',N'Kỳ 1 năm 2023-2024','GV07',6)
insert into Diem values('161121521130','MIS2001',N'Kỳ 1 năm 2020-2021','GV02',6)
insert into Diem values('161121514114','LAW1001',N'Kỳ 1 năm 2022-2023','GV03',8)
insert into Diem values('161121514114','COM3003',N'Kỳ 1 năm 2022-2023','GV07',6)
insert into Diem values('151121505151','HRM3002',N'Kỳ 2 năm 2021-2022','GV04',7)
insert into Diem values('151121505157','MIS3012',N'Kỳ 1 năm 2022-2023','GV06',8)
insert into Diem values('161121521115','HRM2001',N'Kỳ 2 năm 2022-2023','GV02',4)
insert into Diem values('161121521115','ACC1001',N'Kỳ 1 năm 2023-2024','GV06',9)
insert into Diem values('151121505151','ACC1001',N'Kỳ 2 năm 2021-2022','GV05',9)
insert into Diem values('151121521125','MGT3003',N'Kỳ 1 năm 2022-2023','GV04',8)
insert into Diem values('161121521115','MIS2001',N'Kỳ 1 năm 2021-2022','GV03',5)
insert into Diem values('161121514121','MGT1001',N'Kỳ 1 năm 2022-2023','GV02',6)
insert into Diem values('161121514146','FIN2001',N'Kỳ 1 năm 2023-2024','GV04',8)
insert into Diem values('161121514146','COM3003',N'Kỳ 1 năm 2021-2022','GV02',4)
insert into Diem values('151121505157','MIS3003',N'Kỳ 1 năm 2020-2021','GV01',6)
insert into Diem values('161121514123','ENG1011',N'Kỳ 1 năm 2023-2024','GV03',6)
insert into Diem values('161121514112','MIS3009',N'Kỳ 2 năm 2022-2023','GV04',4)
insert into Diem values('161121521130','MIS3037',N'Kỳ 1 năm 2022-2023','GV02',1)
insert into Diem values('151121505150','MIS2001',N'Kỳ 2 năm 2020-2021','GV04',4)
insert into Diem values('161121521104','LAW1001',N'Kỳ 1 năm 2020-2021','GV01',1)
insert into Diem values('161121514131','ENG1014',N'Kỳ 1 năm 2022-2023','GV08',7)
insert into Diem values('151121521125','MIS2011',N'Kỳ 2 năm 2022-2023','GV03',6)
insert into Diem values('161121514139','SMT1003',N'Kỳ 2 năm 2022-2023','GV06',7)
insert into Diem values('161121521144','ENG1012',N'Kỳ 1 năm 2022-2023','GV04',10)
insert into Diem values('161121514146','MIS3001',N'Kỳ 1 năm 2023-2024','GV07',10)
insert into Diem values('161121514114','COM3003',N'Kỳ 1 năm 2020-2021','GV01',9)
insert into Diem values('151121505157','MGT1001',N'Kỳ 1 năm 2020-2021','GV08',7)
insert into Diem values('151121521148','FIN2001',N'Kỳ 2 năm 2020-2021','GV05',1)
insert into Diem values('161121514108','MIS4002',N'Kỳ 2 năm 2021-2022','GV04',3)
insert into Diem values('161121514108','MIS3039',N'Kỳ 1 năm 2021-2022','GV06',4)
insert into Diem values('161121514112','STA2002',N'Kỳ 1 năm 2022-2023','GV06',8)
insert into Diem values('161121521154','ENG2013',N'Kỳ 2 năm 2020-2021','GV04',3)
insert into Diem values('161121514123','MIS3004',N'Kỳ 1 năm 2021-2022','GV07',1)
insert into Diem values('151121505157','MIS3009',N'Kỳ 1 năm 2021-2022','GV05',3)
insert into Diem values('151121521148','ENG2014',N'Kỳ 2 năm 2022-2023','GV01',1)
insert into Diem values('161121521104','MIS3004',N'Kỳ 2 năm 2020-2021','GV03',5)
insert into Diem values('151121521101','ENG2011',N'Kỳ 2 năm 2022-2023','GV03',6)
insert into Diem values('161121521166','MIS2013',N'Kỳ 1 năm 2021-2022','GV07',4)
insert into Diem values('151121505150','MIS2013',N'Kỳ 1 năm 2023-2024','GV01',10)
insert into Diem values('151121521125','MIS3012',N'Kỳ 1 năm 2021-2022','GV05',10)
insert into Diem values('161121514123','MIS3009',N'Kỳ 1 năm 2020-2021','GV05',6)
insert into Diem values('161121521118','STA2002',N'Kỳ 1 năm 2022-2023','GV04',8)
insert into Diem values('151121521113','SMT1004',N'Kỳ 1 năm 2023-2024','GV08',7)
insert into Diem values('161121514108','MIS3002',N'Kỳ 1 năm 2020-2021','GV02',2)
insert into Diem values('151121521113','ACC2003',N'Kỳ 1 năm 2022-2023','GV01',2)
insert into Diem values('161121514131','ENG2012',N'Kỳ 1 năm 2023-2024','GV01',4)
insert into Diem values('161121514114','MIS3004',N'Kỳ 1 năm 2021-2022','GV05',10)
insert into Diem values('161121514121','HRM3001',N'Kỳ 1 năm 2022-2023','GV03',9)
insert into Diem values('151121514130','MIS3040',N'Kỳ 2 năm 2021-2022','GV04',8)
insert into Diem values('151121521126','ACC1001',N'Kỳ 2 năm 2022-2023','GV04',9)
insert into Diem values('161121521130','MGT1002',N'Kỳ 1 năm 2023-2024','GV07',7)
insert into Diem values('151121505150','HRM3002',N'Kỳ 2 năm 2022-2023','GV05',4)
insert into Diem values('151121505157','MIS3011',N'Kỳ 2 năm 2021-2022','GV02',1)
insert into Diem values('151121521126','ENG2014',N'Kỳ 1 năm 2020-2021','GV08',2)
insert into Diem values('151121505150','MIS3013',N'Kỳ 1 năm 2020-2021','GV04',1)
insert into Diem values('161121514131','ENG1011',N'Kỳ 2 năm 2020-2021','GV06',10)
insert into Diem values('161121514146','MKT2001',N'Kỳ 2 năm 2022-2023','GV05',6)
insert into Diem values('161121514108','MIS3004',N'Kỳ 2 năm 2022-2023','GV08',8)
insert into Diem values('161121514121','MIS3003',N'Kỳ 1 năm 2021-2022','GV08',8)
insert into Diem values('161121514121','SMT1001',N'Kỳ 2 năm 2022-2023','GV03',3)

--1.Viết hàm xếp loại dựa vào điểm--
CREATE OR ALTER FUNCTION fXEPLOAI(@Diem float)
RETURNS nvarchar(10)
AS
BEGIN
		DECLARE @phanloai nvarchar(10)
		SET @phanloai=
		CASE
			WHEN @Diem>=8 THEN N'Giỏi'
			WHEN @Diem>=7 THEN N'Khá'
			WHEN @Diem>=5 THEN N'Trung bình'
			ELSE N'Yếu'
		END
		RETURN @phanloai
END

--test--
select dbo.fXEPLOAI('7.9')
select*from Diem

--2.
CREATE or alter FUNCTION fTACHTEN(@ht nvarchar(30))
RETURNS nvarchar(10)
AS
BEGIN
		DECLARE @ten varchar(10), @L int, @i int,@j int,@kt varchar(10)
		select @ten=hoten from SinhVien
		SET @L=LEN(@ht)
		SET @i=1
		WHILE @i<=@L
		BEGIN
		SET @kt=SUBSTRING(@ht,@i,1)
		IF @kt='' SET @j=@i
		SET @i=@i+1
		END
		SET @ten=SUBSTRING(@ht,@j+1,10)
		RETURN @ten
END

--test--
select dbo.fTACHTEN('Nguyễn Quốc Trung')

--3. Viết hàm tính điểm trung bình chung của sinh viên có mã chỉ định ở
--học kỳ bất kỳ.
CREATE OR ALTER FUNCTION TinhDiemTrungBinh(@MaSV char(12), @HocKy nvarchar(100))
RETURNS FLOAT
AS
BEGIN
    DECLARE @DiemTrungBinh FLOAT;

    SELECT @DiemTrungBinh = AVG(Diem)
    FROM Diem
    WHERE MaSV = @MaSV AND HocKy = @HocKy;

    RETURN @DiemTrungBinh;
END;

--test--
SELECT dbo.TinhDiemTrungBinh('161121521130', N'Kỳ 1 năm 2023-2024') AS DiemTrungBinh;

--4.
CREATE OR ALTER FUNCTION fDemSVDiemDuoi5(@MaMon nvarchar(50))
RETURNS INT
AS
BEGIN
    DECLARE @SoSinhVienDuoi5 INT;

    SELECT @SoSinhVienDuoi5 = COUNT(*)
    FROM Diem
    WHERE MaMon=@MaMon AND Diem < 5;

    RETURN @SoSinhVienDuoi5;
END;

--TEST--
SELECT dbo.fDemSVDiemDuoi5('ENG3001') AS SoSinhVienDuoi5;

--5.Tạo thủ tục: Hiển thị danh sách gồm: MaSV, HoTen, MaLop, NgaySinh, GioiTinh
--NamSinh của những sinh viên có tuổi trong khoảng chỉ định. Nếu không có thì hiển thị thông báo không có sinh viên nào
CREATE OR ALTER PROCEDURE spHienThiSinhVienTheoTuoi
    @TuoiMin INT,
    @TuoiMax INT
AS
BEGIN
    IF EXISTS (
        SELECT *
        FROM SinhVien
        WHERE DATEDIFF(YEAR, NgaySinh, GETDATE()) BETWEEN @TuoiMin AND @TuoiMax
    )
    BEGIN
        SELECT MaSV, HoTen, MaLop, NgaySinh, GioiTinh, YEAR(sv.NgaySinh) AS NamSinh
        FROM SinhVien sv
        INNER JOIN Lop l ON sv.MaLop = l.MaLop
        WHERE DATEDIFF(YEAR, sv.NgaySinh, GETDATE()) BETWEEN @TuoiMin AND @TuoiMax
    END
    ELSE
    BEGIN
        PRINT 'Không có sinh viên nào trong khoảng tuổi chỉ định.'
    END
END;
select * from SinhVien

--test--
declare  @TuoiMin int = '20'
declare   @TuoiMax int = '25'
exec spHienThiSinhVienTheoTuoi @TuoiMin, @TuoiMax


select*from Diem
select *from GiangVien
select*from MonHoc
select *from Nganh
select *from SinhVien




--đề 21.2--
--Câu 1. Viết hàm hoặc thủ tục kiểm tra một giáo viên đã
--từng dạy môn học nào đó hay chưa nếu biết mã môn học và
--mã giảng viên.
--input: MaMH, MaGV
--output: ret
create or alter function fKiemtra(@mamh nvarchar(15), @magv nvarchar(20))
returns bit
as
begin
	declare @count int
	set @count=(select count(*) from Diem d join MonHoc m on d.MaMon=m.MaMon join GiangVien g on g.MaGV=d.MaGV
				where d.MaGV=@magv and m.MaMon=@mamh)
	return case when @count >0 then 1 
				else 0 end
end


--test--
select dbo.fKiemtra(N'GV01', N'MIS2002')
print concat(N'Giá trị trả về là: ', dbo.fKiemtra(N'GV01', N'MIS2002'))
select * from GiangVien
select * from MonHoc
select * from Diem

--Câu 2. Viết thủ tục thực hiện việc đăng kí môn học bao
--gồm các thông tin mô tả như sau:
--Đầu vào: mã sinh viên, mã môn học, mã giảng viên, kì 
--học
--Công việc cần thực hiện:
--a)Kiểm tra sự hợp lệ của mã sinh viên. Mã sinh viên hợp lệ là chuỗi gồm 12 kí tự. Nếu không hợp lệ thì ngừng xử lý

create or alter proc pDkimon @masv nvarchar(15), @mamh nvarchar(20), @magv nvarchar(15), @kihoc nvarchar(100), @ret bit out
as
begin
	--câu a: )Kiểm tra sự hợp lệ của mã sinh viên. Mã sinh viên hợp lệ là chuỗi
	--gồm 12 kí tự. Nếu không hợp lệ thì ngừng xử lý
	if LEN(@masv) <> 12
    BEGIN
        PRINT 'Mã sinh viên không hợp lệ.'
        RETURN
    END
	--câu b)Kiểm tra sự hợp lệ của mã môn học. Mã môn học hợp lệ nếu
	--đã tồn tại trong bảng MonHoc. Nếu hợp lệ thì ngừng xử lý.
	if NOT EXISTS (SELECT 1 FROM MonHoc WHERE MaMon = @mamh)
	BEGIN 
		PRINT N'Đã tồn tại trong bảng MonHoc'
		RETURN
	END
	--câu c: Kiểm tra mã giảng viên có hợp lệ không. Mã giảng viên hợp lệ nếu
	--giảng viên đã từng dạy môn học này trước đó. Nếu hợp lệ thì ngừng xử lý
	select @magv = dbo.fKiemtra(@mamh, @magv)
	--câu d: Kiểm tra học kỳ có hợp lệ không. Học kỳ hợp lệ nếu viết theo
	--đúng cú pháp: “kỳ x năm xxxx-xxxx”. Nếu không hợp lệ thì ngừng xử lý.
	 DECLARE @hocky nvarchar(100) = N'Kỳ [0-9] năm [0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'
	IF @kihoc NOT LIKE @hocky
	BEGIN
		PRINT 'Học kỳ không hợp lệ.'
		RETURN
	END
	--câu e:Thêm dữ liệu vào bảng Diem với các dữ liệu đã có. 
	--Điểm để giá trị NULL.
	select*from DIEM
	INSERT INTO Diem(MaSV, MaMon, HocKy, MaGV, Diem)
	VALUES (@masv, @mamh, @kihoc, @magv, NULL)
		if @@ROWCOUNT <= 0
	begin 
		set @ret = 0
		return
	end

	set @ret = 1
end

--test--
declare @masv nvarchar(15)='151121505159',
		@mamh nvarchar(20)='MIS2082',
		@magv nvarchar(15)='GV09',
		@kihoc nvarchar(100)='Kỳ 1 năm 2023-2024',
		@ret bit
exec pDkimon @masv, @mamh, @magv, @kihoc, @ret out
print @ret

select *from SinhVien
select *from MonHoc
select*from GiangVien
select * from Diem


CREATE OR ALTER PROCEDURE pDangKiMonHoc
    @masv char(12),
    @mamh nvarchar(20),
    @magv nvarchar(15),
    @kihoc nvarchar(100),
    @ret bit OUT
AS
BEGIN
    -- Câu a: Kiểm tra sự hợp lệ của mã sinh viên
    IF LEN(@masv) < 12
    BEGIN
        SET @ret = 0
        RETURN
    END

    -- Câu b: Kiểm tra sự hợp lệ của mã môn học
    IF NOT EXISTS (SELECT 1 FROM MonHoc WHERE MaMon = @mamh)
    BEGIN 
        SET @ret = 1
        RETURN
    END

    -- Câu c: Kiểm tra sự hợp lệ của mã giảng viên
   	select @magv = dbo.fKiemtra(@mamh, @magv)

    -- Câu d: Kiểm tra sự hợp lệ của học kỳ
    DECLARE @hocky nvarchar(100) = N'Kỳ [0-9] năm [0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'
    IF @kihoc NOT LIKE @hocky
    BEGIN
        SET @ret = 0
        RETURN
    END

    -- Câu e: Thêm dữ liệu vào bảng Diem
    INSERT INTO Diem (MaSV, MaMon, HocKy, MaGV, Diem)
    VALUES (@masv, @mamh, @kihoc, @magv, NULL)
	if @@ROWCOUNT <= 0
	begin 
		set @ret = 0
		return
	end

	set @ret = 1
END

--test--
DECLARE @MaSV char(12) = '161121514121'; --a
DECLARE @MaMon nvarchar(20) = 'MIS3003'; --b
DECLARE @HocKy nvarchar(100) = N'Kỳ 1 năm 2021-2022'; --c
DECLARE @MaGV char(4) = 'GV08'; --d
DECLARE @ret bit
EXEC pDangKiMonHoc @MaSV, @MaMon, @HocKy, @MaGV, @ret out
print @ret
select * from Diem


--Câu 3: Khi thêm mới dữ liệu cho bảng môn học hãy đảm bảo
--rằng mã môn học mới không bị trùng với các mã môn học trước đó.
CREATE OR ALTER TRIGGER tThemDL
ON MONHOC
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (SELECT MaMon FROM MonHoc WHERE MaMon IN (SELECT MaMon FROM inserted))
    BEGIN
        PRINT N'Mã môn học mới bị trùng lặp.'
        ROLLBACK
    END
END

select*from MonHoc

--test--
insert into MONHOC values('MGT3003','Hệ thống thông tin quản lý',3,1,NULL)

SELECT *FROM MonHoc






create or alter proc pDki @masv char(12),
							@mamh nvarchar(20),
							@magv nvarchar(15),
							@kihoc nvarchar(100),
							@ret bit OUT
as
begin
	--câu a:Kiểm tra sự hợp lệ của mã sinh viên.
	--Mã sinh viên hợp lệ là chuỗi gồm 12 kí tự số. 
	--Nếu không hợp lệ thì ngừng xử lý.
	  IF LEN(@masv) < 12 or LEN(@masv) > 12
	  BEGIN
		print N'Mã sinh viên không hợp lệ'
        SET @ret = 0
        RETURN
	  END
	  --câu b:Kiểm tra sự hợp lệ của mã môn học. Mã môn học hợp
	  --lệ nếu đã tồn tại trong bảng MonHoc. Nếu không hợp lệ 
	  --thì ngừng xử lý.
	 IF NOT EXISTS (SELECT 1 FROM MonHoc WHERE MaMon = @mamh)
      BEGIN
		print N'Mã môn học không hợp lệ'
        SET @ret = 0
        RETURN
    END
	--câu c: Kiểm tra mã giảng viên có hợp lệ không. 
	--Mã giảng viên hợp lệ nếu đã tồn tại trong bảng GiangVien.
	--Nếu không hợp lệ thì ngừng xử lý.
	  IF NOT EXISTS (SELECT 1 FROM GiangVien WHERE MaGV = @magv)
      BEGIN
		print N'Mã môn học không hợp lệ'
        SET @ret = 0
        RETURN
    END
	--câu d: Kiểm tra sinh viên có đủ điều kiện học đăng kí môn
	--học không. Đủ điều kiện: đã học các môn tiên quyết (nếu có).
	--Nếu không hợp lệ thì ngừng xử lý
	    IF NOT EXISTS (SELECT *FROM MonHoc m WHERE m.MaMon = @mamh
        AND NOT EXISTS (SELECT * FROM Diem d WHERE D.MaSV = @MaSV
                AND d.MaMon = m.MonTienQuyet))
       BEGIN
			PRINT 'Sinh viên không đủ điều kiện học đăng ký môn học.'
			set @ret=0
			RETURN
	   END

	--câu e:Thêm dữ liệu vào bảng Diem với các dữ liệu đã có.
	--Điểm để giá trị NULL.
	    INSERT INTO Diem (MaSV, MaMon, HocKy, MaGV, Diem)
		VALUES (@masv, @mamh, null, @magv, NULL)
		if @@ROWCOUNT <= 0
		begin 
			print N'Lỗi không thêm dữ liệu'
			set @ret = 0
			return
	    end

	    set @ret = 1
end






--test--
DECLARE @MaSV char(12) = '211215190090'; --a
DECLARE @MaMon nvarchar(20) = 'MIS3003'; --b
DECLARE @MaGV char(4) = 'GV03'; --d
DECLARE @ret bit
EXEC pDangKiMonHoc1 @MaSV, @MaMon, @MaGV, @ret out
print @ret

select * from Diem




use thu

create or alter proc pDki @masv char(12),
							@mamh nvarchar(20),
							@magv nvarchar(15),
							@kihoc nvarchar(100),
							@ret bit OUT
as

begin
	--câu a:Kiểm tra sự hợp lệ của mã sinh viên.
	--Mã sinh viên hợp lệ là chuỗi gồm 12 kí tự số. 
	--Nếu không hợp lệ thì ngừng xử lý.
	  IF LEN(@masv) < 12 or LEN(@masv) > 12
	  BEGIN
		print N'Mã sinh viên không hợp lệ'
        SET @ret = 0
        RETURN
	  END
	  --câu b:Kiểm tra sự hợp lệ của mã môn học. Mã môn học hợp
	  --lệ nếu đã tồn tại trong bảng MonHoc. Nếu không hợp lệ 
	  --thì ngừng xử lý.
	 IF NOT EXISTS (SELECT 1 FROM MonHoc WHERE MaMon = @mamh)
      BEGIN
		print N'Mã môn học không hợp lệ'
        SET @ret = 0
        RETURN
    END
	--câu c: Kiểm tra mã giảng viên có hợp lệ không. 
	--Mã giảng viên hợp lệ nếu đã tồn tại trong bảng GiangVien.
	--Nếu không hợp lệ thì ngừng xử lý.
		 IF NOT EXISTS (SELECT 1 FROM GiangVien WHERE MaGV = @magv)
      BEGIN
		print N'Mã giảng viên không hợp lệ'
        SET @ret = 0
        RETURN
    END
	--câu d: Kiểm tra sinh viên có đủ điều kiện học đăng kí môn
	--học không. Đủ điều kiện: đã học các môn tiên quyết (nếu có).
	--Nếu không hợp lệ thì ngừng xử lý
	    IF NOT EXISTS (SELECT *FROM MonHoc m WHERE m.MaMon = @mamh
        AND NOT EXISTS (SELECT * FROM Diem d WHERE D.MaSV = @MaSV
                AND d.MaMon = m.MonTienQuyet))
       BEGIN
			PRINT 'Sinh viên không đủ điều kiện học đăng ký môn học.'
			set @ret=0
			RETURN
	   END

	--câu e:Thêm dữ liệu vào bảng Diem với các dữ liệu đã có.
	--Điểm để giá trị NULL.
	    INSERT INTO Diem (MaSV, MaMon, HocKy, MaGV, Diem)
		VALUES (@masv, @mamh, null, @magv, NULL)
		if @@ROWCOUNT <= 0
		begin 
			print N'Lỗi không thêm dữ liệu'
			set @ret = 0
			return
	    end

	    set @ret = 1
end
--test--
DECLARE @masv char(12) = '161121514121'
DECLARE @mamh nvarchar(20) = 'MIS3003'
DECLARE @magv nvarchar(15) = 'GV08'
DECLARE @kihoc nvarchar(100) = N'Kỳ 1 năm 2021-2022'
DECLARE @ret bit

EXEC pDki @masv, @mamh, @magv, @kihoc, @ret OUT

set @magv = 'GV08'
EXEC pDki @masv, @mamh, @magv, @kihoc, @ret OUT
select @ret as 'Kiểm tra mã giảng viên'
-- Kiểm tra mã sinh viên
DECLARE @masv char(12) = '161121514121'
DECLARE @mamh nvarchar(20) = 'MIS3003'
DECLARE @magv nvarchar(15) = 'GV08'
DECLARE @kihoc nvarchar(100) = N'Kỳ 1 năm 2021-2022'
DECLARE @ret bit

EXEC pDki @masv, @mamh, @magv, @kihoc, @ret OUT
set @masv  = '161121514121'

SELECT @ret AS 'Kiểm tra mã sinh viên'

-- Kiểm tra mã môn học
DECLARE @masv char(12) = '161121514121'
DECLARE @mamh nvarchar(20) = 'MIS3003'
DECLARE @magv nvarchar(15) = 'GV08'
DECLARE @kihoc nvarchar(100) = N'Kỳ 1 năm 2021-2022'
DECLARE @ret bit

EXEC pDki @masv, @mamh, @magv, @kihoc, @ret OUT

SET @mamh = 'MIS30099'
EXEC pDki @masv, @mamh, @magv, @kihoc, @ret OUT
SELECT @ret AS 'Kiểm tra mã môn học'


--kiểm tra sinh viên đủ điều kiện học--
DECLARE @masv char(12) = '161121514121'
DECLARE @mamh nvarchar(20) = 'MIS3003'
DECLARE @magv nvarchar(15) = 'GV08'
DECLARE @kihoc nvarchar(100) = N'Kỳ 1 năm 2021-2022'
DECLARE @ret bit

set 
EXEC pDki @masv, @mamh, @magv, @kihoc, @ret OUT


select *from GiangVien
