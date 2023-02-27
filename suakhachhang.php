<?php
include('connect.php');
include('header.php');
$makh=$_GET['id'];
$sql = "SELECT  * From KhachHang where IDKhachHang='$makh'";
$result = sqlsrv_query($conn, $sql);
while ($row = sqlsrv_fetch_array($result)) { 
            
    $tenkh = $row['HoTen'];
    $gioitinh = $row['GioiTinh'];
    $diachi = $row['DiaChi'];
    $email = $row['Email'];
    $sdt = $row['SDT'];
?>
<div class="container">
    <div class="row">
        <h1 class="text-center">Sửa khách hàng</h1>
        <form action="xulysuakhachhang.php?id=<?php echo $makh; ?>" method="POST">
            <div class="form-group">
                <label for="email">Tên khách hàng</label>
                <input type="text" name="tenkh" value="<?php echo $tenkh; ?>" class="form-control" placeholder="" id="email">
            </div>
            <div class="form-group">
                <label for="email">Giới tính</label>
                <input type="text" name="gioitinh" value="<?php echo $gioitinh; ?>"  class="form-control" placeholder="" id="email">
            </div>
            <div class="form-group">
                <label for="email">Địa chỉ</label>
                <input type="text" name="diachi" value="<?php echo $diachi; ?>"  class="form-control" placeholder="" id="email">
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="text" name="email" value="<?php echo $email; ?>"  class="form-control" placeholder="" id="email">
            </div>
            <div class="form-group">
                <label for="email">Số điện thoại</label>
                <input type="text" name="sdt" value="<?php echo $sdt; ?>"  class="form-control" placeholder="" id="email">
            </div>
            <button type="submit" name="luu" class="btn btn-primary mt-3">Submit</button>
       </form> 
    </div>
</div>
<?php }?>