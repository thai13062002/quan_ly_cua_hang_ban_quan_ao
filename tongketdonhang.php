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
                        <th scope="col">Mã khách hàng</th>
                        <th scope="col">Tên khách hàng</th>
                        <th scope="col">Số điện thoại</th>
                        <th scope="col">Mã nhân viên </th>
                        <th scope="col">Tên nhân viên</th>
                        <th scope="col">Ngày đặt hàng</th>
                        <th scope="col">Ngày giao hàng</th>
                        <th scope="col">Ngày yêu cầu chuyển</th>
                        <th scope="col">Mã công ty vận chuyển</th>
                        <th scope="col">Tên công ty vận chuyển</th>
                        <th scope="col">Số lượng mặt hàng</th>
                        <th scope="col">Tổng tiền</th>
                        <th scope="col">Tiền lãi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                        $sql = "SELECT * from TongKetDonHang";

                        $result = sqlsrv_query($conn, $sql);
                        if($result===false){
                            echo "Error in executing query.</br>";
                            die( print_r( sqlsrv_errors(), true));
                        } 
                        while ($row = sqlsrv_fetch_array($result)) { 
                                $madonhang = $row['IDDonHang'];
                                $makhachhang = $row['IDKhachHang'];
                                $hoten = $row['HoTen'];
                                $sdt = $row['SDT'];
                                $manhanvien = $row['IDNhanVien'];
                                $hotennv = $row['HoTenNV']; 
                                $ngaydathang = $row['NgayDatHang']->format('d-m-Y');
                                $ngaygiaohang = $row['NgayGiaoHang']->format('d-m-Y'); 
                                $ngayyeucauchuyen = $row['NgayYeuCauChuyen']->format('d-m-Y'); 
                                $macongty = $row['IDCty']; 
                                $tencongty = $row['TenCongTy']; 
                                $soluong = $row['SoLuongMatHang']; 
                                $tongtien = $row['Tongtien']; 
                                $tienlai = $row['TongLai']; 
                    ?>
                    <tr>
                        <th><?php echo $madonhang; ?></th>
                        <td><?php echo $makhachhang; ?></td>
                        <td><?php echo $hoten; ?></td>
                        <td><?php echo $sdt; ?></td>
                        <td><?php echo $manhanvien; ?></td>
                        <td><?php echo $hotennv; ?></td>
                        <th><?php echo $ngaydathang; ?></th>
                        <td><?php echo $ngaygiaohang; ?></td>
                        <td><?php echo $ngayyeucauchuyen; ?></td>
                        <td><?php echo $macongty; ?></td>
                        <td><?php echo $tencongty; ?></td>
                        <td><?php echo $soluong; ?></td>
                        <td><?php echo $tongtien; ?></td>
                        <td><?php echo $tienlai; ?></td>
                    </tr>
                    <?php } ?>
                </tbody>
            </table>
        </div>
    </div>