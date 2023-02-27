<?php
include('connect.php');
include('header.php');
$iddh=$_GET['id'];
$sql = "SELECT  * From DonHang where IDDonHang='$iddh'";
$result = sqlsrv_query($conn, $sql);
while ($row = sqlsrv_fetch_array($result)) { 
            
    $idkhachhang = $row['IDKhachHang'];
    $idnhanvien = $row['IDNhanVien'];
    $ngaydathang = $row['NgayDatHang']->format('Y-m-d');
    $ngaygiaohang = $row['NgayGiaoHang']->format('Y-m-d');
    $ngayyeucauchuyen = $row['NgayYeuCauChuyen']->format('Y-m-d');
    $idcty = $row['IDCty'];
    $diachigiaohang = $row['DiaChiGiaoHang'];

?>
<div class="container">
    <div class="row">
        <h1 class="text-center">Sửa đơn hàng</h1>
        <form action="xulysuadonhang.php?id=<?php echo $iddh; ?>" method="POST">
            <div class="form-group">
                <label for="email">Mã khách hàng</label>
                <input type="text" value="<?php echo $idkhachhang; ?>" name='idkhachhang' class="form-control" placeholder="" id="email">
            </div>
            <div class="form-group">
                <label for="email">Mã nhân viên</label>
                <input type="text" value="<?php echo $idnhanvien; ?>" name="idnhanvien" class="form-control" placeholder="" id="email">
            </div>
            <div class="form-group">
                <label for="email">Ngày đặt hàng</label>
                <input type="date" value="<?php echo $ngaydathang; ?>" name="ngaydathang" class="form-control" placeholder="" id="email">
            </div>
            <div class="form-group">
                <label for="email">Ngày giao hàng</label>
                <input type="date" value="<?php echo $ngaygiaohang; ?>" name="ngaygiaohang" class="form-control" placeholder="" id="email">
            </div>
            <div class="form-group">
                <label for="email">Ngày yêu cầu chuyển</label>
                <input type="date" value="<?php echo $ngayyeucauchuyen; ?>" name="ngayyeucauchuyen" class="form-control" placeholder="" id="email">
            </div>
            <div class="form-group">
                <label for="email">Mã công ty giao hàng</label>
                <input type="text" value="<?php echo $idcty; ?>" name="idcty" class="form-control" placeholder="" id="email">
            </div>
            <div class="form-group">
                <label for="email">Địa chỉ giao hàng</label>
                <input type="text" value="<?php echo $diachigiaohang; ?>" name="diachigiaohang" class="form-control" placeholder="" id="email">
            </div>
            <button type="submit" name="luu" class="btn btn-primary mt-3">Submit</button>
       </form> 
    </div>
</div>
<?php }?>