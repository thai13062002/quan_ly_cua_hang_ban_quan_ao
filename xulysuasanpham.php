<?php
include('connect.php');
if(isset($_POST['luu'])){
    $iddh=$_GET['id'];
    $idsp=$_GET['idsp'];
    $idsanpham=$_POST['idsanpham'];
    $soluong=$_POST['soluong'];
    $tylegiamgia=$_POST['tylegiamgia'];
}
    $sql = "UPDATE SP_DonHang SET IDSanPham='$idsanpham', SoLuongban='$soluong', TyLeGiamGia='$tylegiamgia' where IDDonHang='$iddh' and IDSanPham='$idsp'";
    $result = sqlsrv_query($conn, $sql);
    header("Location:/btl_sql/xemchitiethoadon.php?id=$iddh");



?>