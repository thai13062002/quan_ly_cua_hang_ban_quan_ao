<?php
include('connect.php');
if(isset($_POST['luu'])){
    $idkhachhang = $_POST['idkhachhang'];
    $idnhanvien = $_POST['idnhanvien'];
    $ngaydathang = $_POST['ngaydathang'];
    $ngaygiaohang = $_POST['ngaygiaohang'];
    $ngayyeucauchuyen = $_POST['ngayyeucauchuyen'];
    $idcty = $_POST['idcty'];
    $diachigiaohang = $_POST['diachigiaohang'];


}

    $sql = "INSERT into DonHang(IDKhachHang, IDNhanVien, NgayDatHang, NgayGiaoHang, NgayYeuCauChuyen, IDCty, DiaChiGiaoHang) values ('$idkhachhang', N'$idnhanvien', N'$ngaydathang', N'$ngaygiaohang',N'$ngayyeucauchuyen', N'$idcty', N'$diachigiaohang')";

    $result = sqlsrv_query($conn, $sql);


        header("Location:xemhoadon.php");



?>