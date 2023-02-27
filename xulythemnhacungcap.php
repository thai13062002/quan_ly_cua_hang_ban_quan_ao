<?php
include('connect.php');
if(isset($_POST['luu'])){
    $manhacungcap = $_POST['manhacungcap'];
    $tencongty = $_POST['tencongty'];
    $diachi = $_POST['diachi'];
    $sdt = $_POST['sdt'];
    $congiaodich = $_POST['congiaodich'];
}

    $sql = "INSERT into NhaCungCap values ('$manhacungcap', N'$tencongty', N'$diachi','$sdt', '$congiaodich')";

    $result = sqlsrv_query($conn, $sql);

    if($result>0){
        header("Location:/btl_sql/nhacungcap.php");
    }
    else{
    echo "Error in executing query.</br>";
            die( print_r( sqlsrv_errors(), true));}

?>