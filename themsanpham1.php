<?php
include('header.php');
?>
<div class="container">
    <div class="row">
        <h1 class="text-center">Thêm sản phẩm</h1>
        <form action="xulythemsanpham1.php" method="POST">
            <div class="form-group">
                <label for="email">Mã sản phẩm</label>
                <input type="text" name='idsp' class="form-control" placeholder="" id="email">
            </div>
            <div class="form-group">
                <label for="email">Tên sản phẩm</label>
                <input type="text" name="tensp" class="form-control" placeholder="" id="email">
            </div>
            <div class="form-group">
                <label for="email">Mã nhà cung cấp</label>
                <input type="text" name="manhacungcap" class="form-control" placeholder="" id="email">
            </div>
            <div class="form-group">
                <label for="email">Mã loại hàng</label>
                <input type="text" name="maloaihang" class="form-control" placeholder="" id="email">
            </div>
            <div class="form-group">
                <label for="email">Đơn giá nhập</label>
                <input type="text" name="dongianhap" class="form-control" placeholder="" id="email">
            </div>
            <div class="form-group">
                <label for="email">Đơn giá bán</label>
                <input type="text" name="dongiaban" class="form-control" placeholder="" id="email">
            </div>
            <div class="form-group">
                <label for="email">Số lượng còn</label>
                <input type="text" name="soluongcon" class="form-control" placeholder="" id="email">
            </div> <div class="form-group">
                <label for="email">Só lượng nhập</label>
                <input type="text" name="soluongnhap" class="form-control" placeholder="" id="email">
            </div> <div class="form-group">
                <label for="email">Mô tả</label>
                <input type="text" name="mota" class="form-control" placeholder="" id="email">
            </div> <div class="form-group">
                <label for="email">Ngưng bán</label>
                <input type="text" name="ngungban" class="form-control" placeholder="" id="email">
            </div>
            <button type="submit" name="luu" class="btn btn-primary mt-3">Submit</button>
       </form> 
    </div>
</div>