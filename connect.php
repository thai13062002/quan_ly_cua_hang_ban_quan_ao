<?php
    /* Địa chỉ SQL Server */
    $serverName = "DELL-5577\SQLEXPRESS";
    /* Tài khoản kết nối */
    $uid = 'sa';
    $pwd = '123';

    /* Cấu hình kết nối */
    $connectionInfo =  [ "UID"=>$uid, "PWD"=>$pwd, "Database"=>"quanlibanquanao", 'CharacterSet' => 'UTF-8' ];

    /* Thực hiện kết nối */
    $conn = sqlsrv_connect( $serverName, $connectionInfo);
    if( $conn === false )
    {
        echo "Không kết nối được";
        die( print_r( sqlsrv_errors(), true));
    }
?>