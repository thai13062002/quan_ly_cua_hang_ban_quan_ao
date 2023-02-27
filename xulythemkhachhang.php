<?php
include('connect.php');
if(isset($_POST['luu'])){
    $makh = $_POST['makh'];
    $tenkh = $_POST['tenkh'];
    $gioitinh = $_POST['gioitinh'];
    $diachi = $_POST['diachi'];
    $email = $_POST['email'];
    $sdt = $_POST['sdt'];

}

    $sql = "INSERT into KhachHang values ('$makh', N'$tenkh', N'$gioitinh', N'$diachi',N'$email', '$sdt')";

    $result = sqlsrv_query($conn, $sql);

    if($result>0){
        header("Location:index.php");
    }
    else{
    echo "Error in executing query.</br>";
            die( print_r( sqlsrv_errors(), true));}

?>