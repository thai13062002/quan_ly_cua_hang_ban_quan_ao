<?php
include('connect.php');

if(isset($_POST['luu'])){
    $manv=$_POST['manv'];
    $tennv = $_POST['tennv'];
    $ngaysinh = $_POST['ngaysinh'];
    $gioitinh = $_POST['gioitinh'];
    $ngaybatdaulam=$_POST['ngaybatdaulam'];
    $diachi = $_POST['diachi'];
    $email = $_POST['email'];
    $sdt = $_POST['sdt'];
    $luongcb = $_POST['luongcb'];
    $chucvu = $_POST['chucvu'];
    $tinhtrang = $_POST['tinhtrang'];
}

    $sql = "INSERT into NhanVien (IDNhanVien, HoTen,NgaySinh,GioiTinh, NgayBatDauLam, DiaChi, Email, SDT, Luongcb, ChucVu, TinhTrang) 
    values ('$manv' , N'$tennv', '$ngaysinh', '$gioitinh','$ngaybatdaulam',N'$diachi','$email','$sdt','$luongcb',N'$chucvu',N'$tinhtrang')  ";
    $result = sqlsrv_query($conn, $sql);
    header("Location:/btl_sql/nhanvien.php");
?>