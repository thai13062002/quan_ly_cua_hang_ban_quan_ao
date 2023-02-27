<?php 
include('connect.php');


$id = $_GET['id'];
$sql = "DELETE SanPham where IDSanPham = '$id' ";
$result = sqlsrv_query($conn, $sql);
header("Location:/btl_sql/sanpham.php");

?>