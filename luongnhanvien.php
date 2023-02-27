<?php
include('connect.php');
include('header.php');
?>
<div class="container">
        <div class="row">
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">Mã đơn hàng</th>
                        <th scope="col">Mã nhân viên </th>
                        <th scope="col">Tên nhân viên</th>
                        <th scope="col">Số lượng mặt hàng</th>
                        <th scope="col">Thưởng</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                        $sql = "SELECT * from luong_NhanVien_DonHang";

                        $result = sqlsrv_query($conn, $sql);
                        if($result===false){
                            echo "Error in executing query.</br>";
                            die( print_r( sqlsrv_errors(), true));
                        } 
                        while ($row = sqlsrv_fetch_array($result)) { 
                                $madonhang = $row['IDDonHang'];
                                $manhanvien = $row['IDNhanVien'];
                                $hoten = $row['HoTenNV'];
                                $soluongmathang = $row['SoLuongMatHang'];
                                $luongdh = $row['luongdh'];
                    ?>
                    <tr>
                        <th><?php echo $madonhang; ?></th>
                        <td><?php echo $manhanvien; ?></td>
                        <td><?php echo $hoten; ?></td>
                        <td><?php echo $soluongmathang; ?></td>
                        <td><?php echo $luongdh; ?></td>
                    </tr>
                    <?php } ?>
                </tbody>
            </table>
        </div>
    </div>