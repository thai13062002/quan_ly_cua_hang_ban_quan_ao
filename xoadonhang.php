<?php 
include('connect.php');


$id = $_GET['id'];
$sql = "DELETE DonHang where IDDonHang = '$id' ";
$result = sqlsrv_query($conn, $sql);
header("Location: xemhoadon.php");

?>