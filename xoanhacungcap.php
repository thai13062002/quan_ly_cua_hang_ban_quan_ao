<?php 
include('connect.php');


$id = $_GET['id'];
$sql = "DELETE NhaCungCap where IDNhaCungCap = '$id' ";
$result = sqlsrv_query($conn, $sql);
header("Location: nhacungcap.php");

?>