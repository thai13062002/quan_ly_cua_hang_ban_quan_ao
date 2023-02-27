<?php
include('connect.php');

if(isset($_POST['luu'])){
    $iddh=$_GET['id'];
    $idsanpham = $_POST['idsanpham'];
    $soluong = $_POST['soluong'];
    $tylegiamgia = $_POST['tylegiamgia'];
  
}

    $sql = "INSERT into SP_DonHang (IDDonHang, IDSanPham,SoLuongban,TyLeGiamGia) values ('$iddh' , '$idsanpham', '$soluong', '$tylegiamgia')  ";
    $result = sqlsrv_query($conn, $sql);
    header("Location:/btl_sql/xemchitiethoadon.php?id=$iddh");
?>