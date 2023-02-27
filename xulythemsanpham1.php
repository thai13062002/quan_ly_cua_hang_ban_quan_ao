<?php
include('connect.php');

if(isset($_POST['luu'])){;
    $idsp = $_POST['idsp'];
    $tensp = $_POST['tensp'];
    $manhacungcap = $_POST['manhacungcap'];
    $maloaihang = $_POST['maloaihang'];
    $dongianhap = $_POST['dongianhap'];
    $dongiaban = $_POST['dongiaban'];
    $soluongcon = $_POST['soluongcon'];
    $soluongnhap = $_POST['soluongnhap'];
    $mota = $_POST['mota'];
    $ngungban = $_POST['ngungban'];

  
}

    $sql = "INSERT into SanPham values ('$idsp' , N'$tensp', '$manhacungcap', '$maloaihang','$dongianhap' , '$dongiaban', '$soluongcon', '$soluongnhap',N'$mota','$ngungban')  ";
    $result = sqlsrv_query($conn, $sql);
    header("Location:/btl_sql/sanpham.php");
?>