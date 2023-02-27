<?php
include('connect.php');
include('header.php');
$iddh=$_GET['id'];
$idsp=$_GET['idsp'];
$sql = "SELECT  * From SP_DonHang where IDDonHang='$iddh' and IDSanPham = '$idsp' ";
$result = sqlsrv_query($conn, $sql);
while ($row = sqlsrv_fetch_array($result)) { 
            
    $idsanpham = $row['IDSanPham'];
    $soluong = $row['SoLuongban'];
    $tylegiamgia = $row['TyLeGiamGia'];
?>
<div class="container">
    <div class="row">
        <h1 class="text-center">Thêm sản phẩm</h1>
        <form action="xulysuasanpham.php?id=<?php echo $iddh;?>&idsp=<?php echo $idsp ?>" method="POST">
            <div class="form-group">
                <label for="email">Mã sản phẩm</label>
                <input type="text" value="<?php echo $idsanpham; ?> " name='idsanpham' class="form-control" placeholder="" id="email">
            </div>
            <div class="form-group">
                <label for="email">Só lượng</label>
                <input type="text" value="<?php echo $soluong; ?> " name="soluong" class="form-control" placeholder="" id="email">
            </div>
            <div class="form-group">
                <label for="email">Tỷ lệ giảm giá</label>
                <input type="text" value="<?php echo $tylegiamgia; ?> " name="tylegiamgia" class="form-control" placeholder="" id="email">
            </div>
         
            <button type="submit" name="luu" class="btn btn-primary mt-3">Submit</button>
       </form> 
    </div>
</div>
<?php }?>