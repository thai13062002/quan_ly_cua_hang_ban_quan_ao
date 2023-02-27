<?php 
include('connect.php');


$id = $_GET['id'];
$sql = "DELETE NhanVien where IDNhanVien = '$id'  ";
$result = sqlsrv_query($conn, $sql);
header("Location:/btl_sql/nhanvien.php");
?>