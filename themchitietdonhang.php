<?php
include('header.php');
$iddh=$_GET['id'];
?>
<div class="container">
    <div class="row">
        <h1 class="text-center">Thêm sản phẩm</h1>
        <form action="xulythemsanpham.php?id=<?php echo $iddh;?>" method="POST">
            <div class="form-group">
                <label for="email">Mã sản phẩm</label>
                <input type="text" name='idsanpham' class="form-control" placeholder="" id="email">
            </div>
            <div class="form-group">
                <label for="email">Só lượng</label>
                <input type="text" name="soluong" class="form-control" placeholder="" id="email">
            </div>
            <div class="form-group">
                <label for="email">Tỷ lệ giảm giá</label>
                <input type="text" name="tylegiamgia" class="form-control" placeholder="" id="email">
            </div>
         
            <button type="submit" name="luu" class="btn btn-primary mt-3">Submit</button>
       </form> 
    </div>
</div>