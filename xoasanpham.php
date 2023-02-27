<?php 
include('connect.php');


$id = $_GET['id'];
$idsp=$_GET['idsp'];
$sql = "DELETE SP_DonHang where IDDonHang = '$id' and IDSanPham='$idsp' ";
$result = sqlsrv_query($conn, $sql);
header("Location:/btl_sql/xemchitiethoadon.php?id=$id");
?>