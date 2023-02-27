<?php
include('connect.php');
$iddh=$_GET['id'];

if(isset($_POST['luu'])){
    $idkhachhang = $_POST['idkhachhang'];
    $idnhanvien = $_POST['idnhanvien'];
    $ngaydathang = $_POST['ngaydathang'];
    $ngaygiaohang = $_POST['ngaygiaohang'];
    $ngayyeucauchuyen = $_POST['ngayyeucauchuyen'];
    $idcty = $_POST['idcty'];
    $diachigiaohang = $_POST['diachigiaohang'];

}

    $sql = "UPDATE DonHang SET IDKhachHang=N'$idkhachhang', IDNhanVien=N'$idnhanvien', NgayDatHang='$ngaydathang', NgayGiaoHang='$ngaygiaohang', NgayYeuCauChuyen='$ngayyeucauchuyen', IDCty='$idcty', DiaChiGiaoHang=N'$diachigiaohang' where IDDonHang='$iddh'";

    $result = sqlsrv_query($conn, $sql);

    header("Location:xemhoadon.php");
  

?>