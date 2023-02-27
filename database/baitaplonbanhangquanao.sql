--Tạo database quan lí bán quần áo
--gồm hai file 1 file vật lí QLBANAO và 1 file nhật kí QLBANAO_log 
CREATE database quanlibanquanao
on primary
(
	name = QLBANAO,
	filename = 'D:\thai\hequantricsdl\thiketthucmon\QLBANAO.mdf',
	size = 10MB,
	maxsize = Unlimited,
	filegrowth = 3MB
)
log on
(
name = QLBANAO_log,
	filename = 'D:\thai\hequantricsdl\thiketthucmon\QLBANAO_log.ldf',
	size = 5MB,
	maxsize = Unlimited,
	filegrowth = 1MB
)
--Tạo bảng
--Bảng nhà cung cấp 
CREATE TABLE NhaCungCap(
	IDNhaCungCap nvarchar(30) primary key,
	TenCongTy nvarchar(255),
	DiaChi	nvarchar(255),
	SDT nvarchar(255),
	ConGiaoDich bit
)
-- bảng loại hàng
create table LoaiHang
(
	IDLoaiHang nvarchar(30) primary key,
	TenLoaiHang nvarchar(255) NOT NULL,
	MoTa nvarchar(255)
)
-- bảng công ty giao hàng
create table CtyGiaoHang
(
	IDCty nvarchar(30) primary key,
	TenCongTy nvarchar(255),
	SDT nvarchar(255),
	DiaChi nvarchar(255),
	PhiGiaoHang float
)
-- bảng khách hàng
create table KhachHang 
(
	IDKhachHang nvarchar(8) primary key,
	HoTen nvarchar(255),
	GioiTinh nvarchar(10)  Check (GioiTinh = N'Nam' or GioiTinh = N'Nữ') ,
	DiaChi nvarchar(255),
	Email nvarchar(50) unique Check(Email like '%@%'),
	SDT char(11) unique,
)
-- bảng nhân viên
create table NhanVien
(
	IDNhanVien nvarchar(8) primary key,
	HoTen nvarchar(255),
	NgaySinh date,
	GioiTinh nvarchar(255) Check (GioiTinh = N'Nam' or GioiTinh = N'Nữ'),
	NgayBatDauLam date,
	DiaChi nvarchar(255),
	Email nvarchar(255) unique Check(Email like '%@%'),
	SDT char(11),
	Luongcb FLOAT,
	ChucVu nvarchar(200),
	TongLuong FLOAT,
	TinhTrang NVARCHAR(50)
	CHECK(tinhtrang IN (N'đang làm',N'thử việc',N'nghỉ làm'))
)
-- bảng sản phẩm 
create table SanPham 
(	
	IDSanPham nvarchar(30) primary key,
	TenSanPham nvarchar(255) unique,
	IDNhaCungCap nvarchar(30) foreign key references NhaCungCap(IDNhaCungCap),
	IDLoaiHang nvarchar(30) foreign key references LoaiHang(idLoaiHang),
	DonGiaNhap int,
	DonGiaBan int,
	SoLuongCon int,
	SoLuongnhap int,
	MoTa nvarchar(500),
	NgungBan bit
)
-- bảng đơn hàng 
create table  DonHang
(
	IDDonHang int primary key identity (1,1),
	IDKhachHang nvarchar(8) foreign key references KhachHang(IDKhachHang) ON DELETE CASCADE,
	IDNhanVien nvarchar(8) foreign key references NhanVien(IDNhanVien),
	NgayDatHang date,
	NgayGiaoHang date,
	NgayYeuCauChuyen date,
	IDCty nvarchar(30) foreign key references CtyGiaoHang(IDCty),
	DiaChiGiaoHang nvarchar(255),
	Tongtien FLOAT
)
-- bảng sản phẩm đơn hàng
create table SP_DonHang
(
	IDDonHang int foreign key references DonHang(IDDonHang) ON DELETE CASCADE,
	IDSanPham  nvarchar(30) foreign key references SanPham(IDSanPham),
	SoLuongban int,
	TyLeGiamGia float,
	Thanhtien FLOAT,
	primary key (IDDonHang,IDSanPham)
)
--thêm dữ liệu cho các bảng
INSERT INTO NhaCungCap ( IDNhaCungCap ,TenCongTy ,DiaChi ,SDT ,ConGiaoDich)
VALUES  ( N'vnshop' ,N'shop việt nam' , N'Hai Bà Trưng Hà Nội' , N'0365478954' ,1 ),
		( N'nike' ,N'Shop Nike' , N'Tây Sơn Hà Nội' ,N'0988899999' ,1  ),
		( N'jody' , N'shop jody' ,N'Thái Hà Đống Đa' , N'0866668888' ,1  ),
		( N'bitit' ,N'shop bitit' , N'Thanh Trì Hà Nội' ,N'024.35586520' , 1 ),
		( N'adidas' ,N'adidas shop' ,N'Ngọc Hồi Hà Nội' ,N'01682413890' ,1 )
SELECT * FROM NhaCungCap
-- bảng loại hàng 
INSERT INTO LoaiHang( IDLoaiHang, TenLoaiHang, MoTa )
VALUES  ( N'aopolo',N'áo polo', N'Áo polo có cổ, mặc sang trọng, lịch sự' ),
		( N'tshirt', N'áo thun ', N'Áo thun mặc, đơn giản thích hợp đi dạo'),
		( N'aolen',N'áo len', N'áo len giúp giữ ấm cho cơ thể những ngày đông'),
		( N'quanshort', N'quần short',N'mặc đơn giản')
SELECT * FROM LoaiHang
-- cong ty giao hang
INSERT INTO CtyGiaoHang( IDCty ,TenCongTy ,SDT ,DiaChi ,PhiGiaoHang)
VALUES  ( N'vtpost' , N'Viettell post' ,N'0365844589' ,N'Giải Phóng, Hà Nội' , 20000  ),
		( N'giaohangnhanh' , N'Giaohangnhanh' ,N'18008198' , N'Xã Đàn, Hà Nội' , 30000 ),
		( N'giaohangtietkiem' ,N'Giaohangtietkiem' , N'1908198' ,N'Trường Chinh, Hà Nội',15000 ),
		( N'vnexpress' ,N'Việt Nam Express' ,N'0423658965' , N'Hà Nội' , 40000  ),
		( N'grab' ,N'Xe máy grab' ,N'04225636547',N'Hà Nội' , 50000)
SELECT * FROM CtyGiaoHang
--bang san pham
INSERT INTO SanPham( IDSanPham ,TenSanPham ,IDNhaCungCap ,IDLoaiHang ,DonGiaNhap,DonGiaBan ,SoLuongCon ,SoLuongnhap ,MoTa ,NgungBan)
VALUES ( N'casau' ,N'áo polo cá sấu' ,N'nike' ,N'aopolo' ,8000,10000 , 60 , 100 , N'3 màu: Trắng, Đen, xanh lá; Size S,XS,M,L' ,0 ),
	   ( N'mickey' , N'áo polo mickey' , N'nike' ,N'aopolo' ,10000,12000 , 40 , 100 ,N'3 màu: Trắng, Đen, Rêu;Size S,XS,M,L' ,0 ),
	   ( N'doraemon' ,N'áo polo doraemon' ,N'nike' ,N'aopolo' , 6000,8000 , 20 ,100 ,N'2 màu: Trắng, Đen; Size S,M,L' ,0  ),
	   ( N'conan' ,N'áo polo conan' ,N'nike' ,N'aopolo' ,11000,13000 , 30 , 100 ,N'3 màu: Trắng, Đen, Cam; Size dưới 75kg' , 0  ),
	   ( N'pikachu' ,N'áo polo pikachu' ,N'nike' ,N'aopolo' ,15000,17000 , 50 , 100 ,N'2 màu: Trắng, Đen; Size dưới M,L,S' ,0 ),
	   ( N'aokhoac1' , N'áo khoác lông' , N'jody' ,N'tshirt' , 30000,32000 , 75 , 100 , N'Áo mặc dữ ấm mùa đông' , 0 ),
	   ( N'aokhoac2', N'áo khoác len dài' , N'vnshop', N'tshirt' , 25000,27000 , 50 , 100 , N'Áo mặc dữ ấm mùa đông' , 0  ),
	   ( N'aolennike' , N'áo len NIKE' , N'vnshop' , N'aolen' ,12000,14000 ,40 , 100 , N'Áo len nike mặc đẹp' , 0 ),
	   ( N'bomber' , N'áo  bomber' ,N'vnshop' ,N'tshirt' ,40000,42000 , 40 , 100 ,N'Áo dữ ấm cơ thể' , 0  ),
	   ( N'quanjody' , N'quần short thun jody' , N'jody' , N'quanshort' ,6000,8000 , 99 , 100 , N'chất cotton lạnh' , 0  ),
	   ( N'shortda' , N'Quần Short Thun Da Cá Cao Cấp jody' , N'jody' , N'quanshort' ,11000,13000 , 88 , 100 ,N'làm hoàn toàn bằng da cá sấu, màu xám của hãng jody' , 0 ),
	   ( N'polojody' , N'Áo polo jody đắp vải' , N'jody' ,N'aopolo' , 14000,16000 ,27 ,100 , N'Áo polo của hãng jody mặc sang trọng lịch sự',0 ),
       ( N'polo175' ,N'Áo polo Sọc AF 05' , N'jody' , N'aopolo' , 4000,6000 , 60 , 100 , N'Chất áo polo cotton mềm mại' , 0  ),
	   ( N'poloj10' , N'Áo polo sọc bản to - J10' , N'jody' , N'aopolo' ,7000,9000 , 60 , 100 ,N'Chất polo cotton mềm mại' ,0 ),
	   ( N'polodoi' , N'Áo cặp polo tình nhân' , N'jody' ,N'aopolo' , 12000,14000 , 80 , 100 , N'Áo đôi đẹp phù hợp cho các cặp tình nhân',0  ),
	   ( N'polodongphuc' , N'Áo lớp polo' , N'bitit' ,N'aopolo' , 9000,11000 ,20 ,100 , N'Hãng Btit chuyên cung cấp các mẫu áo lớp siêu đẹp, chất lượng',0 ),
	   ( N'polodongphucgd' , N'áo polo gia đình' , N'bitit' , N'aopolo' ,9000,11000 , 70 ,100 , N'bộ đồ cho gia đình thật đáng yêu và đồng điệu' , 0 )
		
SELECT * FROM SanPham
--nhân viên
INSERT INTO NhanVien( IDNhanVien ,HoTen ,NgaySinh ,GioiTinh ,NgayBatDauLam ,DiaChi ,Email ,SDT ,Luongcb,ChucVu,TinhTrang)
VALUES  ( N'NV1' , N'Nguyễn Đình Thái' , '20020613' , N'nam' ,'20191111' , N'Hà Nội' ,N'thai200210@gmail.com' , N'0329374812' , 4000000 , N'quản lý',N'đang làm'),
		( N'NV2' , N'Hoàng Thị Phương Liên' , '20020729' , N'nữ' ,'20200101' ,N'Hà Nam' , N'pikachu@gmail.com' , N'0366699995' , 3000000 ,N'nhân viên',N'đang làm'),
		( N'NV3' , N'Nguyễn Đức Tài' ,'20020302' ,N'nam' , '20200613' , N'Quảng Bình' , N'mavantai2002@gmail.com' , N'0366668888' ,2000000,  N'nhân viên',N'đang làm'),
		( N'NV4' , N'Nguyễn Hoà Phát' ,'20031111' , N'nam' , '20211113' , N'Bắc Ninh' ,N'thanhlam0502@gmail.com' , N'093226345' , 1300000 ,N'nhân viên',N'đang làm'),
		( N'NV5' , N'Lưu Thị Thuý' , '20021111' ,N'nữ' , '20201111' ,N'Phú Thọ' ,N'thuyluu@gmail.com' , N'0394184574' , 1900000 , N'nhân viên',N'đang làm'),
		( N'NV6' , N'Phạm Nguyễn Phương Thảo' , '20020519' , N'nữ' , '20191111' , N'Phú Thọ' ,N'thaopham@gmail.com' , N'0326587458' , 1900000  ,N'thư ký',N'đang làm'),
		( N'NV7' , N'Phạm Văn Đồng' , '20041113' ,N'nữ' , '20210606' , N'Hà Nội' , N'dongnien@gmail.com' ,N'0326541258' , 2200000  ,N'nhân viên',N'đang làm')
SELECT * FROM NhanVien
--khach hang
insert into KhachHang values
('KH1',N'Thiên An','Nam',N'Hà Nội','an@mail.com','032654125'),
('KH2',N'Hồ Quang Hiếu',N'Nữ',N'Hải Phòng','hieu@gmail.com','025636547'),
('KH3',N'Tăng Đức Phúc','Nam',N'Phú Thọ','phuc@gmail.com','0326541258'),
('KH4',N'Sơn Tùng','Nam',N'Thái Bình','tung@gmail.com','0321547458'),
('KH5',N'Mạnh Quỳnh','Nam',N'Hà Nội','quynh@gmail.com','0325145826')
SELECT * FROM KhachHang
--don hang
INSERT INTO DonHang( IDKhachHang ,IDNhanVien ,NgayDatHang ,NgayGiaoHang ,NgayYeuCauChuyen ,IDCty ,DiaChiGiaoHang)
VALUES
( 'KH1' , 'NV1' , '20220401', '20220403', '20220402', 'vtpost' , N'Hà Nội' ),
( 'KH2' , 'NV3' , '20220511', '20220513', '20220512', 'giaohangtietkiem' , N'Hà Nội'),
( 'KH3' , 'NV6' , '20221011', '20221020', '20221015', 'grab' , N'Kim Liên' ),
( 'KH4' , 'NV5' , '20220924', '20220930', '20220926', 'vtpost' , N'Long Biên' ),
( 'KH5' , 'NV5' , '20220924', '20220930', '20220926', 'vnexpress' , N'Đống Đa' ),
( 'KH1' , 'NV2' , '20221203', '20221207', '20221205', 'giaohangnhanh',N'Thanh Trì'),
( 'KH1' , 'NV2' , '20220712', '20221226','20221214','vtpost',N'Hà Nội'),
( 'KH5' , 'NV4' , '20220904', '20221227','20220925','vnexpress',N'Đống Đa'),
( 'KH3' , 'NV5' , '20220606', '20221228','20221223' , 'giaohangtietkiem',N'Thường Tin')
SELECT * FROM DonHang
--san pham don hang
insert into SP_DonHang (IDDonHang,IDSanPham,SoLuongban,TyLeGiamGia) values 
(1,'aokhoac1',2,0.01),
(1,'bomber',3,0.02),
(1,'aolennike',4,0.03),
(1,'shortda',2,0.01),
(1,'mickey',1,0.03),
(1,'polodoi',6,0.04),
(2,'polodoi',3,0.04),
(2,'quanjody',2,0.09),
(3,'pikachu',1,0.08),
(3,'poloj10',1,0.07),
(3,'polojody',3,0.04),
(4,'pikachu',4,0.02),
(4,'doraemon',6,0.01),
(4,'aolennike',8,0.05),
(4,'aokhoac2',9,0.1),
(4,'polodongphucgd',5,0.31),
(4,'polo175',10,0.6),
(5,'pikachu',4,0.09),
(6,'conan',8,0.01),
(6,'doraemon',3,0.01),
(7,'shortda',5,0.01),
(7,'quanjody',1,0.01),
(7,'mickey',9,0.01),
(8,'aolennike',3,0.01),
(9,'casau',1,0.01)
SELECT * FROM SP_DonHang
-------------------------------------------------------------------
--các con trỏ
--sử dụng con trỏ để in ra họ tên của những khách hàng có số lần mua hàng nhiều nhất
declare @maxsl float
select top(1) @maxsl=count(IDDonHang) from DonHang group by IDKhachHang order by count(IDDonHang) desc
declare kh cursor dynamic scroll
for
	select DonHang.IDKhachHang, KhachHang.HoTen, COUNT(IDDonHang) from KhachHang, DonHang where KhachHang.IDKhachHang=DonHang.IDKhachHang group by DonHang.IDKhachHang, KhachHang.HoTen having count(IDDonHang)>=@maxsl
open kh
declare @makh nvarchar(20), @hoten nvarchar(20), @sl int
print N'Danh sách khách hàng mua nhiều nhất'
fetch first from kh into @makh,@hoten,@sl
while (@@FETCH_STATUS=0)
begin
	print convert(nvarchar(5),@makh)+' tên: '+@hoten+N' có số lần mua: '+ convert(nvarchar(5),@sl)
	fetch next from kh  into @makh,@hoten,@sl
end
close kh
deallocate kh
-------------------------------
--sử dụng con trỏ để thống kê tổng số hoá đơn theo từng ngày trong các tuần.
create proc sp_ThongKe
@max int output,
@thu cursor varying output
as begin
	select top(1) @max=count(IDDonHang) from DonHang group by DATEPART(dw,NgayDatHang) order by count(IDDonHang) desc
	set @thu = cursor dynamic scroll for
		select DATEPART(dw,NgayDatHang),count(IDDonHang) from DonHang group by DATEPART(dw,NgayDatHang) order by DATEPART(dw,NgayDatHang) asc
	open @thu
end
declare @thongke cursor, @maxsl int, @thutrongtuan int,@sl int
exec sp_ThongKe @maxsl output, @thu=@thongke output
fetch first from @thongke into @thutrongtuan,@sl 
while(@@FETCH_STATUS=0)
	begin
	if(@thutrongtuan=1)
		begin
			print N'Chủa nhật: '+ convert(nvarchar(10),@sl)+' hoá đơn'
			fetch next from @thongke into @thutrongtuan,@sl
		end
	else 
		print N'Chủ nhât: 0 hoá đơn'
	if(@thutrongtuan=2)
		begin
			print N'Thứ hai: '+ convert(nvarchar(10),@sl)+' hoá đơn'
			fetch next from @thongke into @thutrongtuan,@sl
		end
	else 
		print N'Thứ hai: 0 hoá đơn'
	if(@thutrongtuan=3)
		begin
			print N'Thứ ba: '+ convert(nvarchar(10),@sl)+' hoá đơn'
			fetch next from @thongke into @thutrongtuan,@sl
		end	
	else 
		print N'Thứ ba: 0 hoá đơn'
	if(@thutrongtuan=4)
		begin
			print N'Thứ tư: '+ convert(nvarchar(10),@sl)+' hoá đơn'
			fetch next from @thongke into @thutrongtuan,@sl
		end	
	else 
		print N'Thứ tư: 0 hoá đơn'
	if(@thutrongtuan=5)
		begin 
			print N'Thứ năm: '+ convert(nvarchar(10),@sl)+' hoá đơn'
			fetch next from @thongke into @thutrongtuan,@sl
		end
	else 
		print N'Thứ năm: 0 hoá đơn'
	if(@thutrongtuan=6)
		begin 
			print N'Thứ sáu: '+ convert(nvarchar(10),@sl)+' hoá đơn'
			fetch next from @thongke into @thutrongtuan,@sl
		end
	else 
		print N'Thứ sáu: 0 hoá đơn'
	if(@thutrongtuan=7)
		begin
			print N'Thứ bảy: '+ convert(nvarchar(10),@sl)+' hoá đơn'
			fetch next from @thongke into @thutrongtuan,@sl
		end
	else 
		print N'Thứ bảy: 0 hoá đơn'
	end
fetch first from @thongke into @thutrongtuan,@sl 
while(@@FETCH_STATUS=0)
	begin
		if(@sl=@maxsl)
		begin
			if(@thutrongtuan=1)
				begin
					print N'Chủa nhật có nhiều người mua hàng nhất '
				end
			if(@thutrongtuan=2)
				begin
					print N'Thứ hai có nhiều người mua hàng nhất'
				end	
			if(@thutrongtuan=3)
				begin
					print N'Thứ ba có nhiều người mua hàng nhất '
				end	
			if(@thutrongtuan=4)
				begin
					print N'Thứ tư có nhiều người mua hàng nhất '
				end	
			if(@thutrongtuan=5)
				begin 
					print N'Thứ năm có nhiều người mua hàng nhất '
				end
			if(@thutrongtuan=6)
				begin 
					print N'Thứ sáu có nhiều người mua hàng nhất '
				end
			if(@thutrongtuan=7)
				begin
					print N'Thứ bảy có nhiều người mua hàng nhất '
				end
			
		end
		fetch next from @thongke into @thutrongtuan,@sl
	end
close @thongke
deallocate @thongke
select * from SanPham
--Viết 1 con trỏ in ra các nhà cung cấp có số lượng hàng nhập cung cấp ít nhất cho cửa hàng 
declare dsncc_cungcapmin cursor dynamic scroll
for
	select IDNhaCungCap , sum(SoLuongnhap) from SanPham
	group by IDNhaCungCap 
	having  sum(SoLuongnhap) <= all(select sum(SoLuongnhap) from SanPham
	group by IDNhaCungCap)
open  dsncc_cungcapmin;
declare @mancc nvarchar(10), @slgnhap int ;
fetch next from dsncc_cungcapmin into @mancc,@slgnhap
while(@@FETCH_STATUS=0)
	begin
		print N'Nhà cung cấp'+' '+@mancc+' '+N'với số lượng nhập là'+' '+cast(@slgnhap as char(10))
		fetch next from dsncc_cungcapmin into  @mancc,@slgnhap
	end
close dsncc_cungcapmin;
deallocate dsncc_cungcapmin;
---------------------------------------
--Viết 1 con trỏ in ra danh sách doanh thu của tất cả các nhân viên trong cửa hàng với doanh thu là tổng tiền của tất cả hóa đơn mà các nhân viên đó đã thanh toán 
declare ds_doanhthu_nv cursor dynamic scroll
for 
	select IDNhanVien,sum(TongTien) from DonHang group by IDNhanVien
open ds_doanhthu_nv;
declare @manv nvarchar(10), @doanhthu float ;
fetch next from ds_doanhthu_nv into @manv,@doanhthu
while(@@FETCH_STATUS=0)
begin
print N'Nhân viên'+' '+@manv+' '+N'với số doanh thu là'+' '+cast(@doanhthu as char(100))
fetch next from ds_doanhthu_nv into  @manv,@doanhthu
end
close ds_doanhthu_nv;
deallocate ds_doanhthu_nv;
--sử dụng con trỏ để in ra những khách hàng chưa mua lần nào
declare kh cursor dynamic scroll
for
	select KhachHang.IDKhachHang, HoTen from KhachHang left join DonHang on KhachHang.IDKhachHang=DonHang.IDKhachHang where DonHang.IDNhanVien is null
open kh
declare @makh nvarchar(20), @hoten nvarchar(20)
print N'Danh sách khách hàng chưa mua hàng'
fetch first from kh into @makh,@hoten
while (@@FETCH_STATUS=0)
begin
	print @makh+' tên: '+@hoten+N' đã chưa mua hàng lần nào'
	fetch next from kh  into @makh,@hoten
end
close kh
deallocate kh
------------------------------------
--Viết 1 con trỏ in ra danh sách các hóa đơn bao gồm các thông tin sohd , ngayban , tongtien có ngày bán trong khoảng thời gian từ tháng 1 đến tháng 5 
declare con_tro_dshd cursor
dynamic scroll
for
	select IDDonHang,NgayDatHang,Tongtien from DonHang where MONTH(NgayDatHang) BETWEEN 1 and 5
open con_tro_dshd;
declare @madonhang int ,@ngayban date ,@tongtien float;
fetch next from con_tro_dshd into @madonhang,@ngayban,@tongtien
while(@@FETCH_STATUS=0)
begin
print N'Hóa đơn'+' '+cast(@madonhang as nvarchar(5))+' '+N'với ngày bán'+' '+cast(@ngayban as char(10))+' '+N'có tổng tiền'+' '+cast(@tongtien as char(10))
fetch next from con_tro_dshd into @madonhang,@ngayban,@tongtien
end
close con_tro_dshd;
deallocate con_tro_dshd;
-------------------------------------------------------------------
--các function
-- hàm tính thành tiền của 1 sản phẩm cụ thể 
create FUNCTION Thanhtien(@iddonhang int, @idsanpham nvarchar(30))
RETURNS float
AS BEGIN
	DECLARE @thanhtien FLOAT
	SELECT @thanhtien =(SoLuongban*(select DonGiaBan from SanPham where IDSanPham=@idsanpham)*(1-TyLeGiamGia)) FROM SP_DonHang
	WHERE IDDonHang = @iddonhang AND IDSanPham = @idsanpham
	RETURN @thanhtien
   END
select * from SanPham
PRINT dbo.thanhtien(1,N'aokhoac1')
----
-- hàm tính tổng--
alter FUNCTION tinhtongtien(@iddonhang int)
RETURNS float
AS BEGIN
	DECLARE @phivc FLOAT
	SELECT @phivc = PhiGiaoHang FROM CtyGiaoHang,DonHang WHERE CtyGiaoHang.IDCty = DonHang.IDCty AND DonHang.IDDonHang = @iddonhang
   	DECLARE @tong FLOAT
	SELECT @tong = SUM(Thanhtien)+ @phivc FROM SP_DonHang WHERE IDDonHang = @iddonhang 
	RETURN @tong
END
PRINT dbo.tinhtongtien(6)
---- tinh tiền nhập của một sản phẩm trong 1 đơn hàng cụ thể---
create function Tien_nhap(@iddh int, @idsp nvarchar(30))
returns float
as
begin
	declare @t float
	select @t = DonGiaNhap*SoLuongban from SanPham,SP_DonHang 
	where SP_DonHang.IDSanPham = SanPham.IDSanPham and SP_DonHang.IDSanPham = @idsp 
	and SP_DonHang.IDDonHang = @iddh
	return @t
end
select * from SanPham
select * from SP_DonHang
print dbo.Tien_nhap(6,'conan')
-- hàm tính số lượng mặt hàng của 1 đơn hàng --
CREATE FUNCTION Tinh_SoLuong_MatHang(@iddh int)
RETURNS int
AS
BEGIN
	DECLARE @count INT
	SELECT @count = count(IDSanPham) FROM SP_DonHang WHERE IDDonHang = @iddh
	RETURN @count
END
PRINT dbo.Tinh_SoLuong_MatHang(6)
---  tien lai của 1 sản phẩm cụ thể trong đơn hàng
create function Lai(@iddh int, @idsp nvarchar(30))
returns float
as 
begin
	declare @l float
	select @l =dbo.Thanhtien(@iddh,@idsp)- dbo.Tien_nhap(@iddh,@idsp) from SP_DonHang where IDDonHang = @iddh and IDSanPham = @idsp
	return @l
END
PRINT dbo.lai(6,N'conan')
-- hàm tính tổng tiền lãi của 1 đơn hàng--
CREATE FUNCTION Tinh_tonglai(@iddh int)
RETURNs float
AS 
BEGIN
   	DECLARE @sum FLOAT
	SELECT @sum = sum(dbo.Lai(SP_DonHang.IDDonHang,SP_DonHang.IDSanPham)) FROM SP_DonHang, DonHang 
	WHERE SP_DonHang.IDDonHang = DonHang.IDDonHang and DonHang.IDDonHang = @iddh  
	RETURN @sum
END
PRINT dbo.Tinh_tonglai(6)
--hàm tính tổng lương theo hoa hồng cho nhân viên, dữ liệu được cập nhật thông qua view luong_NhanVien_DonHang
create FUNCTION tinhluong_NhanVien( @idnv nvarchar(30))
RETURNS float
AS
BEGIN
	DECLARE @tongluong FLOAT,@iddh int
	SELECT @tongluong= SUM(Luongdh) FROM luong_NhanVien_DonHang WHERE IDNhanVien = @idnv  GROUP BY IDNhanVien
	return @tongluong
END
--vd
SELECT * FROM luong_NhanVien_DonHang
SELECT * FROM TongKetDonHang WHERE  IDNhanVien =N'NV1'
SELECT SUM(luongdh) FROM luong_NhanVien_DonHang WHERE IDNhanVien =N'NV1'  GROUP BY IDNhanVien
PRINT dbo.tinhluong_NhanVien('NV1')
--------------------------------------------------------
--các thủ tục
-- thủ tục cho phép xóa bản ghi vĩnh viễn ở bảng nhà cung cấp--
select * from NhaCungCap
alter PROC delete_forever_nhacungcap
@idncc nvarchar(8)
AS 
BEGIN
	ALTER TABLE NhaCungCap DISABLE TRIGGER delete_temporary_nhacungcap --tắt hoạt động trigger
	DELETE FROM NhaCungCap WHERE IDNhaCungCap = @idncc
	PRINT N'Bạn đã xóa thành công nhà cung cấp: '+  @idncc
	ALTER TABLE NhaCungCap ENABLE TRIGGER delete_temporary_nhacungcap --mở hoạt động trigger
END
--vd 
select * from NhaCungCap
INSERT INTO NhaCungCap
 ( IDNhaCungCap ,TenCongTy , DiaChi ,SDT ,ConGiaoDich)
VALUES ( N'test1' ,N'kemxoi' , N'HN' , N'' , 1  ),
		( N'test2' , N'kiem' , N'hp'  , N'' , 1 )
DELETE FROM nhacungcap WHERE IDNhaCungCap = N'test1'
EXEC delete_forever_nhacungcap N'1'
---------------------------------------
-- thủ tục cho phép xóa bản ghi vĩnh viễn ở bảng nhân viên--
ALTER PROC delete_forever_nhanvien
@idnv nvarchar(30)
AS 
BEGIN
	ALTER TABLE nhanvien DISABLE TRIGGER delete_nhanvien
	DELETE FROM nhanvien WHERE IDNhanVien = @idnv
	PRINT N'Bạn đã xóa thành công nhân viên: '+  @idnv
	ALTER TABLE nhanvien ENABLE TRIGGER delete_nhanvien
END
--vd
select * from NhanVien
insert into NhanVien ( IDNhanVien ,HoTen ,NgaySinh ,GioiTinh ,NgayBatDauLam ,DiaChi ,Email ,SDT ,Luongcb,ChucVu,TinhTrang) values  ( N'NVTEST' , N'Nguyễn Đình Thái' , '20020613' , N'nam' ,'20191111' , N'Hà Nội' ,N'thaidz@gmail.com' , N'0329374812' , 4000000 , N'quản lý',N'đang làm')
EXEC delete_forever_nhanvien 'NV10'
-- viết thủ tục cập nhật thành tiền
CREATE PROC capnhat_Thanhtien
AS
BEGIN
	UPDATE SP_DonHang SET Thanhtien = dbo.thanhtien(IDDonHang,IDSanPham)
END
--vd
select * from SP_DonHang
EXEC capnhat_Thanhtien
----------------------------------------------
-- thủ tục cập nhật trường tổng tiền của tất cả các đơn hàng trong bảng đơn hàng--
alter PROC UPDATE_tongtien
AS
BEGIN
	UPDATE DonHang SET Tongtien = dbo.tinhtongtien(IDDonHang)
END
--vd
select * from DonHang
exec UPDATE_tongtien
----- thủ tục cập nhật trường số lượng còn của bảng sản phẩm 
alter PROC GiaoDich
@idsp NVARCHAR(30),
@soluong int 
AS BEGIN
	DECLARE @con INT
	--TH1: Kiểm tra sản phẩm đó còn bán tức NgưngBan=0
	IF(SELECT NgungBan FROM SanPham WHERE IDSanPham = @idsp)=0
	BEGIN
		IF(SELECT SoLuongCon FROM SanPham WHERE IDSanPham=@idsp)>=@soluong
		BEGIN
			UPDATE SanPham
			SET SoLuongCon=SoLuongCon-@soluong
			WHERE IDSanPham=@idsp
			PRINT N'GIAO DỊCH THÀNH CÔNG, BẠN ĐÃ ĐẶT HÀNG THÀNH CÔNG SẢN PHẨM: '+ @idsp
		END
		ELSE
		BEGIN
			SET @con=(SELECT SoLuongCon FROM SanPham WHERE IDSanPham=@idsp)
			PRINT N'SỐ LƯỢNG SẢN PHẨM KHÔNG ĐỦ, SỐ LƯỢNG CÒN LẠI CỦA '+@idsp+N' LÀ: ' + CAST(@con AS char(4));
		END
	END
	--TH2: Kiểm tra sản phẩm đó không còn bán tức NgưngBan=1 
	else
		print N'Sản phẩm này đã ngừng bán rồi bán nhé!' 
 END
 --vd
select * from SanPham
INSERT INTO SanPham( IDSanPham ,TenSanPham ,IDNhaCungCap ,IDLoaiHang ,DonGiaNhap,DonGiaBan ,SoLuongCon ,SoLuongnhap ,MoTa ,NgungBan)
VALUES ( N'test1' ,N'ac' ,N'nike' ,N'aopolo' ,8000,10000 , 60 , 100 , N'3 màu: Trắng, Đen, xanh lá; Size S,XS,M,L' ,0 ),
( N'test2' ,N'd2' ,N'nike' ,N'aopolo' ,8000,10000 , 60 , 100 , N'3 màu: Trắng, Đen, xanh lá; Size S,XS,M,L' ,1 )
delete SanPham where IDSanPham='test1'
EXEC GiaoDich 'test',1
select * from SanPham
-------------------------------------------------
--- thủ tục cập nhật lại trường tổng tiền khi nhập 1 bản ghi của bảng sản phẩm đơn hàng--
create PROC UPDATE_tongtien_for_auto_insert
@iddh int
AS BEGIN
   	UPDATE DonHang SET Tongtien = dbo.tinhtongtien(@iddh) WHERE IDDonHang = @iddh
	PRINT N'bạn đã cập nhật thành công trường tổng tiền của đơn hàng '+ CAST(@iddh AS NVARCHAR(3))
   END
EXEC UPDATE_tongtien_for_auto_insert 1
------------------------------------------------
-- thủ tục cập nhật lương cho trường tổng lương trong bảng nhân viên
CREATE PROC update_tongluong_NhanVien
AS BEGIN
   	UPDATE NhanVien SET tongluong = dbo.tinhluong_NhanVien(IDNhanVien)
END
EXEC update_tongluong_NhanVien
---------------------------------------------------------
--CÁC VIEW
-- view chi tiết đơn hàng--
--gồm mã đơn hàng, mã sản phẩm, số lượng bán, đơn giá nhập, đơn giá bán,
-- phí giao hàng, tỷ lệ giảm giá, thành tiền, tiền lãi của các sản phẩm trong hóa đơn
CREATE VIEW ChiTietDonHang
AS
	SELECT SP_DonHang.IDDonHang, SP_DonHang.IDSanPham, SoLuongban, DonGiaNhap, DonGiaBan,PhiGiaoHang, TyLeGiamGia, Thanhtien,dbo.lai(SP_DonHang.IDDonHang, SP_DonHang.IDSanPham) AS tienlai 
	FROM SP_DonHang, SanPham, CtyGiaoHang, DonHang 
	WHERE SP_DonHang.IDSanPham = SanPham.IDSanPham 
	AND SP_DonHang.IDDonHang = DonHang.IDDonHang 
	AND DonHang.IDCty = CtyGiaoHang.IDCty
SELECT * FROM ChiTietDonHang
-------- view tổng kết đơn hàng ------------
alter VIEW TongKetDonHang
AS
	SELECT DISTINCT DonHang.IDDonHang, DonHang.IDKhachHang, KhachHang.HoTen,
	KhachHang.SDT, DonHang.IDNhanVien, NhanVien.HoTen AS HoTenNV,
	NgayDatHang, NgayGiaoHang, NgayYeuCauChuyen, DonHang.IDCty, TenCongTy,
	dbo.Tinh_SoLuong_MatHang(DonHang.IDDonHang) AS SoLuongMatHang, Tongtien,
	dbo.Tinh_tonglai(DonHang.IDDonHang) AS TongLai
	FROM CtyGiaoHang, DonHang, NhanVien, LoaiHang, KhachHang
	WHERE DonHang.IDKhachHang = KhachHang.IDKhachHang AND DonHang.IDNhanVien = NhanVien.IDNhanVien
	AND DonHang.IDCty = CtyGiaoHang.IDCty
select * from TongKetDonHang

--thiết kế thêm 1 view tính lương cho nhân viên theo từng sản phẩm mà nhân viên đó bán được
--+ví dụ với số lượng mặt hàng dưới 10 tính lương với đơn vị là * 0.003
--+ví dụ với số lượng mặt hàng trên 10 tính lương với đơn vị là * 0.005
--+ví dụ với số lượng mặt hàng trên 50 tính lương với đơn vị là * 0.01
--+ví dụ với số lượng mặt hàng trên 100 tính lương với đơn vị là * 0.03
CREATE VIEW luong_NhanVien_DonHang
as
SELECT TongKetDonHang.IDDonHang,TongKetDonHang.IDNhanVien, TongKetDonHang.HoTenNV,SoLuongMatHang, luongdh = 
( CASE 
	WHEN SoLuongMatHang >= 10 THEN (TongLai*0.005*SoLuongMatHang)
	WHEN SoLuongMatHang >= 50 THEN (TongLai*0.01*SoLuongMatHang)
	WHEN SoLuongMatHang >= 100 THEN (TongLai*0.03*SoLuongMatHang)
	ELSE (TongLai*0.003*SoLuongMatHang)
  END)
FROM TongKetDonHang, NhanVien WHERE  TongKetDonHang.IDNhanVien = NhanVien.IDNhanVien
select * from luong_NhanVien_DonHang
--tạo view hiển thị các sản phẩm thuộc loại hàng nào
Create View sanphamthuocloaihang
as
	Select IDSanPham,TenSanPham, TenLoaiHang from SanPham, LoaiHang 
	Where SanPham.IDLoaiHang=LoaiHang.IDLoaiHang
select * from sanphamthuocloaihang
--tạo view hiển thi tên khách hàng trong từng đơn hàng do nhân viên nào bán.
Create view khachhang_donhang
as
	SELECT IDDonHang, KhachHang.HoTen as HoTenKH, NhanVien.HoTen AS HoTenNV, NgayDatHang  from DonHang, KhachHang, NhanVien
	where DonHang.IDKhachHang=KhachHang.IDKhachHang and DonHang.IDNhanVien=NhanVien.IDNhanVien
SELECT * from khachhang_donhang
-------------------------------------------------------------------
--CÁC TRIGGER
--trigger khi insert hoặc update 1 hay nhiều bản ghi vào bảng loại hàng thì trường "tên loại hàng" không được trùng nhau
-- vấn đề xử lí nhiều bản ghi được giải quyết thôg qua con trỏ
CREATE TRIGGER Them_LoaiHang
ON LoaiHang
FOR INSERT,UPDATE
AS begin
DECLARE Them_LoaiHang_cursor CURSOR SCROLL DYNAMIC
	FOR SELECT IDLoaiHang,TenLoaiHang FROM inserted
OPEN Them_LoaiHang_cursor
DECLARE @idloaihang NVARCHAR(8)
DECLARE @tenloaihang NVARCHAR(30)
DECLARE @count INT = 0
FETCH NEXT FROM Them_LoaiHang_cursor INTO @idloaihang,@tenloaihang
WHILE @@FETCH_STATUS =0
BEGIN
	PRINT N'loại hàng: '+ CAST(@count AS NVARCHAR(2)) +N' mã loại hàng: '+ @idloaihang +N' tên loại hàng: '+ @tenloaihang
	SET @count = @count+1
	IF (SELECT COUNT(TenLoaiHang) FROM LoaiHang WHERE TenLoaiHang = @tenloaihang) >1
	BEGIN
		PRINT N'loại hàng '+@tenloaihang +N' này đã tồn tại trong bảng.'
		ROLLBACK TRAN
		BREAK
	END
	ELSE PRINT N'thêm thành công '+@tenloaihang
	FETCH NEXT FROM Them_LoaiHang_cursor INTO @idloaihang,@tenloaihang
END
CLOSE Them_LoaiHang_cursor
DEALLOCATE Them_LoaiHang_cursor
end
--vd
SELECT * FROM LoaiHang
INSERT INTO LoaiHang
        ( idLoaiHang, TenLoaiHang, MoTa )
VALUES  ( N'test34', N'ao ok12',  N'áo '  ),
		 ( N'test2', N'áo sơ-mi', N'áo đẹp'  )
UPDATE LoaiHang SET TenLoaiHang = N'ao ok1' WHERE IDLoaiHang ='test34'
delete LoaiHang where IDLoaiHang like 'test%'
--Trigger để khi xóa một nhà cung cấp trong bảng NhaCungCap thì thay vì
--xóa nhà cung cấp đó sẽ thực hiện cập nhật trường ConGiaoDich = 0 đối với nhà cung
--cấp đó và cập nhật bảng SanPham để thiết lập NgungBan = 1 với tất cả các sản phẩm
--của nhà cung cấp bị xóa đi.

create TRIGGER delete_temporary_nhacungcap
ON nhacungcap 
INSTEAD OF DELETE
AS 
BEGIN
	UPDATE NhaCungCap SET ConGiaoDich = 0 WHERE IDNhaCungCap = (SELECT IDNhaCungCap FROM deleted)
	UPDATE SanPham SET NgungBan = 1 WHERE IDNhaCungCap = (SELECT IDNhaCungCap FROM deleted)
	PRINT N'Bạn đã sửa thành công !'
END
--vd
select * from NhaCungCap
insert into NhaCungCap values('test2','thai','hn','223',1)
select * from SanPham
insert into SanPham values('test2','ao1','test2','aopolo',1,1,12,111,'ok',0)
delete from NhaCungCap where IDNhaCungCap='test2'
--trigger khi thêm 1 nhà cung cấp :
--+ nếu nhà cung cấp này đã tồn tại trong bảng nhà cung cấp thì 
--cập nhật trường ConGiaoDich = 1 đối với nhà cung cấp đó 
--và cập nhật bảng SanPham để thiết lập NgungBan = 0 với tất cả các sản phẩm của nhà cung cấp đó
--+ nếu chưa tồn tại thì đơn thuần chỉ cần thêm vào 
CREATE TRIGGER Them_nhacungcap
ON nhacungcap 
INSTEAD OF INSERT
AS 
BEGIN
DECLARE Them_nhacungcap_cursor CURSOR SCROLL DYNAMIC
	FOR SELECT IDNhaCungCap FROM inserted
OPEN Them_nhacungcap_cursor
DECLARE @idnhacungcap NVARCHAR(50)
FETCH NEXT FROM Them_nhacungcap_cursor INTO @idnhacungcap
WHILE @@FETCH_STATUS = 0
BEGIN
	IF(SELECT count(IDNhaCungCap) FROM NhaCungCap WHERE IDNhaCungCap = @idnhacungcap) != 0
	BEGIN
		UPDATE NhaCungCap SET ConGiaoDich = 1 WHERE IDNhaCungCap = @idnhacungcap
		UPDATE SanPham SET NgungBan = 0 WHERE IDNhaCungCap = @idnhacungcap
		PRINT N'Bạn đã sửa thành công '
		PRINT N'------------------------------------'
	END
	ELSE
		BEGIN
		INSERT INTO NhaCungCap
		SELECT IDNhaCungCap,TenCongTy,DiaChi,SDT,ConGiaoDich FROM inserted WHERE IDNhaCungCap = @idnhacungcap
		PRINT N'Bạn đã thêm thành công !'
		PRINT N'------------------------------------'
		END
	FETCH NEXT FROM Them_nhacungcap_cursor INTO @idnhacungcap
END
CLOSE Them_nhacungcap_cursor
DEALLOCATE Them_nhacungcap_cursor
END
--vd
select * from NhaCungCap
select * from SanPham
insert into NhaCungCap ( IDNhaCungCap ,TenCongTy ,DiaChi ,SDT) values('test2','thai','sd',123)
 -- trigger tự động cập nhật trường thành tiền cho bảng sản phẩm đơn hàng và trường số lượng cho bảng sản phẩm
 --và tự động tính lại trường tổng tiền của bảng đơn hàng, cập nhật lương cho nhân viên
alter TRIGGER auto_update_thanhtien
ON SP_DonHang
FOR INSERT 
AS 
DECLARE update_thanhtien CURSOR SCROLL
	FOR SELECT IDDonHang,IDSanPham,SoLuongban, TyLeGiamGia FROM inserted
OPEN update_thanhtien
DECLARE @iddh int, @idsp NVARCHAR(30),@soluong INT, @tylegiamgia float
FETCH NEXT FROM update_thanhtien INTO @iddh,@idsp,@soluong,@tylegiamgia
WHILE @@FETCH_STATUS = 0
BEGIN
IF(@idsp IS NOT NULL)
BEGIN 
	EXEC Giaodich @idsp,@soluong
	UPDATE SP_DonHang
	SET Thanhtien = (SoLuongban*DonGiaBan*(1-TyLeGiamGia))
	FROM SanPham
	WHERE SanPham.IDSanPham = SP_DonHang.IDSanPham
	AND SP_DonHang.IDDonHang = @iddh
	AND SP_DonHang.IDSanPham = @idsp
	EXEC UPDATE_tongtien_for_auto_insert @iddh
	EXEC update_tongluong_NhanVien
END
FETCH NEXT FROM update_thanhtien INTO @iddh,@idsp,@soluong,@tylegiamgia
END
CLOSE update_thanhtien
DEALLOCATE update_thanhtien
--vd
select * from SanPham
select * from SP_DonHang
select * from NhanVien
INSERT INTO SP_DonHang 
        ( IDDonHang ,IDSanPham , SoLuongban  , TyLeGiamGia
        )
VALUES  ( 1,  N'test' , 10 ,  0.08   )
-- trigger tính lại trường tổng tiền khi xóa 1 bản ghi của bảng sản phẩm đơn hàng --
-- trả lại số lượng bán cho trường số lượng còn trong bảng sản phẩm , tính lại lương cho nhân viên--
create TRIGGER UPDATE_tongtien_for_auto_delete
ON SP_DonHang
FOR DELETE as
BEGIN
	DECLARE update_tongtien CURSOR SCROLL
		FOR SELECT IDDonHang,IDSanPham,SoLuongban FROM deleted
	OPEN update_tongtien
	DECLARE @iddh int,@idsp NVARCHAR(30),@soluong INT
	FETCH NEXT FROM update_tongtien INTO @iddh,@idsp,@soluong
	WHILE @@FETCH_STATUS = 0
	BEGIN
		EXEC UPDATE_tongtien_for_auto_insert @iddh
		UPDATE SanPham SET SoLuongCon = SoLuongCon + @soluong WHERE IDSanPham = @idsp
		PRINT N'đã cập nhật lại trường số lượng còn trong bảng sản phẩm '+ CAST(@idsp AS NVARCHAR(30))
		EXEC update_tongluong_NhanVien
		FETCH NEXT FROM update_tongtien INTO @iddh,@idsp,@soluong
	END
	CLOSE update_tongtien
	DEALLOCATE update_tongtien
END
--Trigger thực hiện xóa các bản ghi bảng khách hàng thì bảng
--bảng DonHang và SP_DonHang cũng bị xoá khách hàng đó

CREATE TRIGGER delete_khachhang_on_donhang   --xoá khách khách hàng và bảng đơn hàng
ON KhachHang
FOR DELETE
AS 
	DELETE DonHang FROM DonHang, deleted WHERE DonHang.IDKhachHang = deleted.IDKhachHang
--------
CREATE TRIGGER delete_donhang_on_sp_donhang   --xoá don hàng và spdonhang
ON DonHang
FOR DELETE
AS 
begin
	DELETE SP_DonHang FROM SP_DonHang,deleted WHERE SP_DonHang.IDDonHang = deleted.IDDonHang
END
-----------------------

----------------------------------------
--khi thêm một sản phẩm vào bảng sản phẩm thì phải kiểm tra nhà cung cấp xem nhà cung cấp đó còn hoạt động hay không
--+ nếu không thì thông báo ko cho nhập và rollback
--+ nếu có thì thông báo thành công
CREATE TRIGGER check_nhacungcap_for_insert_soluongsp
ON SanPham
FOR INSERT,UPDATE
AS 
BEGIN
	DECLARE check_sp CURSOR SCROLL
	FOR SELECT IDSanPham FROM inserted
	OPEN check_sp
	DECLARE @idsp NVARCHAR(50)
	FETCH NEXT FROM check_sp INTO @idsp
	WHILE @@FETCH_STATUS = 0
	BEGIN
		DECLARE @idnhacungcap NVARCHAR(50)
		SELECT @idnhacungcap = IDNhaCungCap FROM nhacungcap WHERE nhacungcap.IDNhaCungCap = (SELECT IDNhaCungCap FROM SanPham WHERE IDSanPham = @idsp)
		IF(SELECT ConGiaoDich FROM nhacungcap WHERE nhacungcap.IDNhaCungCap = (SELECT IDNhaCungCap FROM SanPham WHERE IDSanPham = @idsp)) = 1
			PRINT N'Bạn đã thêm(cập nhật) thành công sản phẩm '+@idsp
		ELSE 
		BEGIN
			PRINT N'Sản phẩm '+ @idsp +N' không thể thêm được, do nhà cung cấp('+@idnhacungcap+N') sản phẩm này đã ngừng giao dịch'
			ROLLBACK TRAN
			COMMIT TRAN
		END
		FETCH NEXT FROM check_sp INTO @idsp
	END
	CLOSE check_sp
	DEALLOCATE check_sp
END
-------------------------------------
--xoá nhân viên
--cập nhật lại tình trạng thành nghỉ làm
CREATE TRIGGER delete_nhanvien
ON nhanvien
INSTEAD OF DELETE
AS BEGIN
   	UPDATE NhanVien SET tinhtrang = N'nghỉ làm' WHERE IDNhanVien = (SELECT IDNhanVien FROM deleted)
	PRINT N'Bạn đã sửa thành công nhân viên'
END
select * from NhanVien
--vd
insert into NhanVien values('NV8','TEST','20020101','nam','20020101','hn','a@gmail.com','254','','nhân viên','',N'đang làm')
delete NhanVien where IDNhanVien='NV8'
-----------------------------------------
--trigger thêm nhân viên
--kiểm tra nhân viên đó đã từng làm tại cửa hàng chưa
--+nếu chưa thì thêm bình thường
--+còn đã làm nhưng mà nghỉ thì cập nhật lại trường tình trạng thành đang làm
--+dùng con trỏ để xử lý thêm một lúc nhiều nhân viên
alter TRIGGER Them_nhanvien
ON nhanvien
INSTEAD OF INSERT
AS 
BEGIN
DECLARE Them_nhanvien_cursor CURSOR SCROLL DYNAMIC
FOR SELECT IDNhanVien FROM inserted
OPEN Them_nhanvien_cursor
DECLARE @idnv NVARCHAR(50)
FETCH NEXT FROM Them_nhanvien_cursor INTO @idnv
WHILE @@FETCH_STATUS = 0
BEGIN
	IF(SELECT count(IDNhanVien) FROM NhanVien WHERE IDNhanVien = @idnv) != 0
	BEGIN
		UPDATE NhanVien SET tinhtrang = N'đang làm' WHERE IDNhanVien = @idnv
		PRINT N'Bạn đã sửa thành công '
	END
	ELSE
		BEGIN
		INSERT INTO NhanVien
		SELECT IDNhanVien,HoTen,NgaySinh,GioiTinh,NgayBatDauLam,DiaChi,Email,SDT,luongcb,chucvu,tongluong,tinhtrang FROM inserted WHERE IDNhanVien = @idnv
		PRINT N'Bạn đã thêm thành công nhân viên !'
		END
	FETCH NEXT FROM Them_nhanvien_cursor INTO @idnv
END
CLOSE Them_nhanvien_cursor
DEALLOCATE Them_nhanvien_cursor
END
--vd
select * from NhanVien
insert into NhanVien(IDNhanVien) values('NV8')
insert into NhanVien(IDNhanVien,HoTen,NgaySinh,GioiTinh,NgayBatDauLam,DiaChi,Email,SDT,luongcb,chucvu) values
('NV9','TEST1','20020101','nam','20020101','hn','b@gmail.com','123',400000,'nhân viên'),
('NV10','TEST2','20020101','nam','20020101','hn','c@gmail.com','123',400000,'nhân viên')
--------------------------------------------------------
--trigger kiểm tra khi thêm hay cập nhật mà nhân viên bán cho đơn hàng thì phải kiểm tra nhân viên đó đang làm hay nghỉ làm
--nếu đang làm thông báo thêm/sửa thành công
--còn nếu nghỉ thì thông báo nghỉ và rollback
alter TRIGGER check_nhanvien_donhang
ON DonHang
FOR INSERT,UPDATE
AS
BEGIN
	DECLARE con_c CURSOR
	FOR SELECT IDNhanVien FROM inserted
	OPEN con_c
	DECLARE @idNV NVARCHAR(30)
	FETCH NEXT FROM con_c INTO @idNV
	WHILE @@FETCH_STATUS = 0
	BEGIN
		IF(SELECT tinhtrang FROM NhanVien WHERE IDNhanVien = @idNV) = N'nghỉ làm'
		BEGIN
			PRINT N'xin lỗi nhân viên này('+@idNV+N') đã nghỉ làm rồi! hãy chọn nhân viên khác nhé!'
			ROLLBACK TRAN
			COMMIT TRAN
		END
		ELSE
			PRINT N'bạn đã thêm đơn hàng thành công nhé!'
			FETCH NEXT FROM con_c INTO @idNV
	END
	CLOSE con_c
	DEALLOCATE con_c
END
--Các giao dịch
--------------------------------------------
/*T1: thao tac cap nhat vao kho 1 so luong hang cu the sau do set thoi gian 10s cho giao dich chay
T2: sau do cho doc ban ghi
van de: lost update
muc co lap ap dung: read committed
*/
select * from SanPham
-- giao dịch t1
BEGIN TRAN
UPDATE SanPham SET SoLuongCon = 50 WHERE IDSanPham = N'aokhoac1'
WAITFOR DELAY '00:00:10'
ROLLBACK
commit tran
-- giao dịch t2, mức cô lập read uncommited
BEGIN TRAN
SET TRAN ISOLATION LEVEL READ unCOMMITTED
SELECT * FROM SanPham
COMMIT TRAN
-- giao dịch t2, mức cô lập read commited
BEGIN TRAN
SET TRAN ISOLATION LEVEL READ COMMITTED
SELECT * FROM SanPham
COMMIT TRAN
/* vào thời điểm mà T1 đang chạy giao dịch này cập nhật 1 bản ghi nhưng chưa thực hiện commited
hơn nữa ở giao dịch t2 khi giao dịch này chạy, đã áp dụng mức cô lập read commited nên nó phải đợi cho đến khi giao dịch t1 đc hoàn thành(10s) thì mới cho đọc dữ liệu 
ưu điểm: giải quyết được vấn đề lost update
nhược điểm không giải quyêt được vấn đề unrepeattable read*/
/*
------------------------------
T1: doc ban ghi tong luong nhan vien cho doi 10s sau do doc lai
T2: cap nhat 1 ban ghi vao trong bang nhan vien nham thay doi luong cua 1 nhan vien trong bang
van de: unrepeattable read
muc co lap ap dung : repeatable read
*/
-- giao dịch t1 (mức cô lập: READ COMMITTED):
BEGIN TRAN
SET TRAN ISOLATION LEVEL READ COMMITTED
SELECT * FROM NhanVien
WAITFOR DELAY '00:00:10'
SELECT * FROM NhanVien
COMMIT TRAN
-- giao dịch t1 (mức cô lập: repeatable read):
BEGIN TRAN
SET TRAN ISOLATION LEVEL repeatable READ
SELECT * FROM NhanVien
WAITFOR DELAY '00:00:10'
SELECT * FROM NhanVien
COMMIT TRAN
-- giao dịch t2:
SELECT * FROM NhanVien
BEGIN TRAN
SET TRAN ISOLATION LEVEL READ COMMITTED
UPDATE NhanVien SET tongluong = 500000 WHERE IDNhanVien=N'NV7'
COMMIT TRAN
UPDATE NhanVien SET tongluong = null WHERE IDNhanVien=N'NV7'

/*với giao dịch t1(đã áp dụng mức cô lập repeatable read) thực hiện thao tác đọc dữ liệu từ bảng nhân viên 2 lần cách nhau 10s
thì khi giao dịch t2 thực hiện câu lệnh update nó phải đợi cho giao dịch t1 thực hiện xong 2 lần đọc bản ghi thì mới thực thi được câu lệnh update
ưu điểm: ngăn không cho transaction cập nhật dữ liệu đang được đọc bởi transaction khác cho đến khi transaction đó hoàn tất việc đọc
nhược điểm: chưa giải quyết được vấn đề phantom, cụ thể không bảo vệ được khỏi câu lệnh insert và delete
*/
---------------------------------------
/*
T1: doc ban ghi san pham don hang cho doi 10s sau do doc lai
T2: them 1 ban ghi vao trong bang sp_donhang nham thay doi so luong ban ghi sau do cho doc
van de : phantom
muc co lap ap dung : SERIALIZABLE
*/
-- giao dịch t1 mức cô lập: repeatable read
BEGIN TRAN
SET TRAN ISOLATION LEVEL repeatable READ
SELECT * FROM SP_DonHang
WAITFOR DELAY '00:00:10'
SELECT * FROM SP_DonHang
COMMIT TRAN
-- giao dịch t1 mức cô lập: serializable
BEGIN TRAN
SET TRAN ISOLATION LEVEL SERIALIZABLE
SELECT * FROM SP_DonHang
WAITFOR DELAY '00:00:10'
SELECT * FROM SP_DonHang
COMMIT TRAN
-- giao dịch t2
BEGIN TRAN
INSERT INTO SP_DonHang
        ( IDDonHang ,
          IDSanPham ,
          SoLuongban ,
          IDDonHang ,
          TyLeGiamGia
        )
VALUES  ( 9 , 
          N'jointhespace' , 
          2 , 
          130000 , 
          0.01
        )
SELECT * FROM SP_DonHang
COMMIT TRAN
DELETE FROM SP_DonHang WHERE IDDonHang = 9 AND IDSanPham = N'jointhespace'
/*với giao dịch t1(đã áp dụng mức cô lập SERIALIZABLE) thực hiện thao tác đọc dữ liệu từ bảng sản phẩm đơn hàng 2 lần cách nhau 10s
thì khi giao dịch t2 thực hiện câu lệnh insert nó phải đợi cho giao dịch t1 thực hiện xong 2 lần đọc bản ghi thì mới thực thi được câu lệnh insert
ưu điểm: ngăn không cho transaction cập nhật,thêm,xóa dữ liệu đang được đọc bởi transaction khác cho đến khi transaction đó hoàn tất việc đọc
nhược điểm: làm chậm hoạt động của hệ thống
*/

