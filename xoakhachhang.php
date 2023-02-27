<?php 
include('connect.php');


$id = $_GET['id'];
$sql = "DELETE KhachHang where IDKhachHang = '$id' ";
$result = sqlsrv_query($conn, $sql);
header("Location: index.php");

?>