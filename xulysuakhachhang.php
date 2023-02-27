<?php
include('connect.php');
if(isset($_POST['luu'])){
    $makh = $_GET['id'];
    $tenkh = $_POST['tenkh'];
    $gioitinh = $_POST['gioitinh'];
    $diachi = $_POST['diachi'];
    $email = $_POST['email'];
    $sdt = $_POST['sdt'];

}

    $sql = "UPDATE KhachHang SET HoTen=N'$tenkh', GioiTinh=N'$gioitinh', DiaChi=N'$diachi', Email='$email', SDT='$sdt' where IDKhachHang='$makh'";

    $result = sqlsrv_query($conn, $sql);

    if($result>0){
        header("Location:index.php");
    }
    else{
    echo "Error in executing query.</br>";
            die( print_r( sqlsrv_errors(), true));}

?>