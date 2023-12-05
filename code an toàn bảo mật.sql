USE QLNV2

UPDATE NHANVIEN SET DCHI=CONVERT(VARCHAR(100), HASHBYTES('SHA2_256',DCHI),1)

CREATE TRIGGER trig_Insert_DC on NHANVIEN
FOR INSERT AS
BEGIN
	UPDATE NHANVIEN
	SET DCHI=(SELECT CONVERT(VARCHAR(100),
			HASHBYTES('SHA2_256', i.DCHI), 2)
			FROM inserted i)
	WHERE MaNV=(Select i.MaNV
		     FROM inserted i)
END

SET DATEFORMAT DMY
INSERT INTO NHANVIEN VALUES('009',N'Lê',N'Âu Anh',N'Thư','15/06/2003',N'Nữ',N'K249 H28/17 Hà Huy Tập, Đà Nẵng','003','DH',6000000)


CREATE TRIGGER trig_UPDATE_DC ON NHANVIEN
FOR UPDATE AS
BEGIN
    IF UPDATE(DCHI)
    BEGIN
        UPDATE NV
        SET NV.DCHI = (SELECT CONVERT(VARCHAR(100), HASHBYTES('SHA2_256', i.DCHI), 1)
                       FROM inserted i
                       WHERE i.MaNV = NV.MaNV)
        FROM NHANVIEN NV
        JOIN inserted i ON NV.MaNV = i.MaNV
    END
END


SELECT*FROM NHANVIEN
WHERE MANV='009'
	AND DCHI=CONVERT(VARCHAR(100),
	HASHBYTES('SHA2_256', N'K249 H28/17 Hà Huy Tập, Đà Nẵng'), 1)


ALTER TABLE NHANVIEN ADD Salt Varchar(100)
UPDATE NHANVIEN SET Salt=Convert(varchar(100), CRYPT_GEN_RANDOM(8),1)
UPDATE NHANVIEN
SET DCHI = CONVERT(VARCHAR(100), HASHBYTES('SHA2_256', DCHI+ Salt),1)


Declare @encrypted VARBINARY(128)
Set @encrypted=EncryptByPassphrase('This is my passphrase', 'My secret')

Select @encrypted AS encryted, CONVERT(VARCHAR,
	DecryptByPassphrase('This is my passphrase', @encrypted)) AS decryted




Declare @encrypted VARBINARY(128)
Set @encrypted=EncryptByPassphrase(0x123456789, 'My secret')

Select @encrypted AS encryted, CONVERT(VARCHAR,
	DecryptByPassphrase(0x123456789, @encrypted)) AS decryted

--Tạo khóa đối xứng mã hóa bằng mật khẩu--
CREATE SYMMETRIC KEY MySymKey
	WITH ALGORITHM = AES_256
	ENCRYPTION BY PASSWORD='p@sswOrdfOr$ymKey'

--mở khóa--
OPEN SYMMETRIC KEY MySymKey
DECRYPTION BY PASSWORD='p@sswOrdfOr$ymKey'

--MÃ HÓA--
DECLARE @encrypted VARBINARY (8000)
DECLARE @string NVARCHAR (50) = N'An toàn và bảo mật'
SET @encrypted = EncryptByKey (Key_GUID ('MySymKey'), @string)

--Giải mã
DECLARE @encrypted VARBINARY (8000)
DECLARE @decrypted NVARCHAR (50)
SET @decrypted = CONVERT(NVARCHAR , DecryptByKey (@encrypted))


CLOSE SYMMETRIC KEY MySymKey

--Tạo DMK cho CSDL QLNV được bảo vệ bằng mật khẩu
USE QLNV2
CREATE MASTER KEY ENCRYPTION BY PASSWORD ='p@sswOrdfOrDMK'

--Mở khóa DMK bằng mật khẩu--
OPEN MASTER KEY DECRYPTION BY PASSWORD='p@sswOrdfOrDMK'

--Sao lưu DMK 
BACKUP MASTER KEY TO FILE='D:\ENCRYPTION_KEYS\dmk.key'
ENCRYPTION BY PASSWORD='MyB@ckupP@sswOrdFOrDMK'

--Đóng DMK
CLOSE MASTER KEY

--Khôi phục DMK từ file
RESTORE MASTER KEY FROM FILE='D:\ENCRYPTION_KEYS\dmk.key'
DECRYPTION BY PASSWORD='MyB@ckupP@sswOrdFOrDMK'
ENCRYPTION BY PASSWORD='p@sswOrdfOrDMK'

--Tạo bản sao DMK được bảo vệ bằng SMK
ALTER MASTER KEY ADD ENCRYPTION BY SERVICE MASTER KEY

--XÓA DMK
DROP MASTER KEY


--Mã hóa
DECLARE @encrypted VARBINARY (8000)
DECLARE @string NVARCHAR (50) = N'An toàn và bảo mật'
SET @encrypted = EncryptByKey(Key_GUID ('MySymKey'), @string)

--Giải mã
DECLARE @decrypted NVARCHAR (50)
SET @decrypted = CONVERT (NVARCHAR , DecryptByKey ( @encrypted))

DECLARE @decrypted NVARCHAR (50)
SELECT @decrypted = CONVERT(NVARCHAR ,DecryptByASymKey(AsymKey_ID ('MyAKey'),@encrypted,
N'myp@sswOrdfOrA$ymKey'))

CLOSE SYMMETRIC KEY MySymKey
--Tạo chứng chỉ
SET DATEFORMAT DMY

CREATE CERTIFICATE MyCert1
ENCRYPTION BY PASSWORD = 'p@sswOrdfOrCert1'
WITH SUBJECT = 'Certificate for demo',
START_DATE = '05/01/2019', EXPIRY_DATE = '01/01/2020'


--Sao lưu chứng chỉ
BACKUP CERTIFICATE MyCert1 TO FILE = 'D:\BACKUP\MyCert1.cer'
WITH PRIVATE KEY ( FILE = 'D:\BACKUP\MyCert1_PrivateKey.pvk',
ENCRYPTION BY PASSWORD = 'p@sswOrdfOrb@ckupCert1',
DECRYPTION BY PASSWORD = 'p@sswOrdfOrCert1')


--Tạo chứng chỉ mới từ file sao lưu
CREATE CERTIFICATE MyCert2
FROM FILE = 'D:\Backup\MyCert1.cer'
WITH PRIVATE KEY ( FILE = 'D:\BACKUP\MyCert1_PrivateKey.pvk',
DECRYPTION BY PASSWORD= 'p@sswOrdfOrb@ckupCert1',
ENCRYPTION BY PASSWORD= 'p@sswOrdfOrCert2')

--Tạo dữ liệu ảo giống MyCert1--
SET DATEFORMAT DMY

CREATE CERTIFICATE MyCert2
ENCRYPTION BY PASSWORD = 'p@sswOrdfOrCert2'
WITH SUBJECT = 'Certificate for demo',
START_DATE = '05/01/2019', EXPIRY_DATE = '01/01/2020'



--MÃ HÓA LAI
--TẠO CHỨNG CHỈ
CREATE CERTIFICATE MyCert
ENCRYPTION BY PASSWORD= 'Cert_P@$$wOrd'
WITH SUBJECT= 'Certificate for THANHVIEN'

--Tạo 2 khóa đối xứng được mã hóa bằng chứng chỉ cho 
--2 trưởng đơn vị
CREATE SYMMETRIC KEY SymKey_DV01 WITH
ALGORITHM = AES_192
ENCRYPTION BY CERTIFICATE MyCert
CREATE SYMMETRIC KEY SymKey_DV02 WITH
ALGORITHM = AES_192
ENCRYPTION BY CERTIFICATE MyCert


GRANT CONTROL ON SYMMETRIC KEY:: SymKey_QL TO 001
GRANT CONTROL ON SYMMETRIC KEY:: SymKey_DH TO 002
GRANT CONTROL ON CERTIFICATE:: MyCert TO Role_TruongDonVi

--Kiểm tra danh sách tài khoản người dùng--
SELECT name FROM sys.sysusers

--Mã hóa lương của mỗi đơn vị bằng khóa tương ứng
UPDATE NHANVIEN
SET DCHI = EncryptByKey(Key_GUID ('SymKey_ 001'),
CONVERT(VARCHAR (20), DCHI), 1, N'Tùng')
WHERE MA_NQL= '001'


UPDATE NHANVIEN
SET DCHI = EncryptByKey(Key_GUID ('SymKey_ 002'),
CONVERT(VARCHAR (20), DCHI), 1, N'Tiên')
WHERE MA_NQL= '002'
--


EXECUTE AS USER = '001'
OPEN SYMMETRIC KEY SymKey_001 DECRYPTION BY CERTIFICATE MyCert
WITH PASSWORD= 'Cert_P@$$wOrd'
SELECT MANV, TENNV, NGSINH, DCHI,
CONVERT (VARCHAR (20), DecryptByKey (DCHI, 1, N'Tùng')) AS DECRYPT_DIACHI
FROM NHANVIEN
CLOSE SYMMETRIC KEY SymKey_001
REVERT


EXECUTE AS USER = '002'
OPEN SYMMETRIC KEY SymKey_001 DECRYPTION BY CERTIFICATE MyCert
WITH PASSWORD= 'Cert_P@$$wOrd'
SELECT MANV, TENNV, NGSINH, DCHI,
CONVERT (VARCHAR (20), DecryptByKey (DCHI, 1, N'Tiên')) AS DECRYPT_DIACHI
FROM NHANVIEN
CLOSE SYMMETRIC KEY SymKey_002
REVERT


CREATE ASYMMETRIC KEY MyAKey
WITH ALGORITHM= RSA_2048
ENCRYPTION BY PASSWORD= 'myp@sswOrdfOrA$ymKey'

DECLARE @encrypted VARBINARY (8000)
DECLARE @string NVARCHAR (50) = N'An toàn và bảo mật'
SELECT @encrypted= EncryptByASymKey(AsymKey_ID (' MyAKey'), @string)

--
--Mã hóa 
DECLARE @encrypted VARBINARY (8000)
DECLARE @string NVARCHAR (50) = N'An toàn và bảo mật'
SELECT @encrypted= EncryptByASymKey (AsymKey_ID (' MyAKey'), @string)

--
Giải mã
DECLARE @decrypted NVARCHAR (50)
SELECT @decrypted = CONVERT(NVARCHAR ,DecryptByASymKey(AsymKey_ID ('MyAKey'),@encrypted,
N'myp@sswOrdfOrA$ymKey'))


