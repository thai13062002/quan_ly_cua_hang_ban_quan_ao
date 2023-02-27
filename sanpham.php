<?php
include('connect.php');
include('header.php');
?>
<div class="container">
<button type="button" class="btn btn-primary"><a style=  'text-decoration: none; color:aliceblue;' href="themsanpham1.php">Thêm sản phẩm</a></button>
        <div class="row">
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">Mã sản phẩm</th>
                        <th scope="col">Tên sản phẩm</th>
                        <th scope="col">Mã nhà cung cấp </th>
                        <th scope="col">Mã loại hàng</th>
                        <th scope="col">Đơn giá nhập </th>
                        <th scope="col">Đơn giá bán </th>
                        <th scope="col">Số lượng còn </th>
                        <th scope="col">Số lượng nhập </th>
                        <th scope="col">Mô tả </th>
                        <th scope="col">Ngừng bán </th>
                        <th scope="col">Sửa/Xoá</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                        $sql = "SELECT  * From SanPham";

                        $result = sqlsrv_query($conn, $sql);
                        if($result===false){
                            echo "Error in executing query.</br>";
                            die( print_r( sqlsrv_errors(), true));
                        } 
                        while ($row = sqlsrv_fetch_array($result)) { 
                                $idsp = $row['IDSanPham'];
                                $tensp = $row['TenSanPham'];
                                $idnhacungcap = $row['IDNhaCungCap'];
                                $idloaihang = $row['IDLoaiHang'];
                                $dongianhap = $row['DonGiaNhap']; 
                                $dongiaban = $row['DonGiaBan'];                            
                                $soluongcon = $row['SoLuongCon'];                            
                                $soluongnhap = $row['SoLuongnhap'];                            
                                $mota = $row['MoTa'];                            
                                $ngungban = $row['NgungBan'];                            

                    ?>
                    <tr>
                        <th><?php echo $idsp; ?></th>
                        <td><?php echo $tensp; ?></td>
                        <td><?php echo $idnhacungcap; ?></td>
                        <td><?php echo $idloaihang; ?></td>
                        <td><?php echo $dongianhap; ?></td>
                    
                        <td><?php echo $dongiaban; ?></td>
                        <td><?php echo $soluongcon; ?></td>
                        <td><?php echo $soluongnhap; ?></td>
                        <td><?php echo $mota; ?></td>
                        <th><?php echo $ngungban; ?></th>
                     
                        <td>
                        <a href="suasanpham1.php?id=<?php echo $idsp ?>">    <svg xmlns="http://www.w3.org/2000/svg" href="sua.php?id= <?php echo $makh ?>" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
  <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>                     
</svg></a>
 
                        <a href="xoasanpham1.php?id=<?php echo $idsp; ?>">                 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-archive" viewBox="0 0 16 16">
  <path d="M0 2a1 1 0 0 1 1-1h14a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1v7.5a2.5 2.5 0 0 1-2.5 2.5h-9A2.5 2.5 0 0 1 1 12.5V5a1 1 0 0 1-1-1V2zm2 3v7.5A1.5 1.5 0 0 0 3.5 14h9a1.5 1.5 0 0 0 1.5-1.5V5H2zm13-3H1v2h14V2zM5 7.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z"/>
</svg></a>

                        </td>
                    </tr>
                    <?php } ?>
                </tbody>
            </table>
        </div>
    </div>