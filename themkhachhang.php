<?php
include('header.php');
?>
<div class="container">
    <div class="row">
        <h1 class="text-center">Thêm khách hàng</h1>
        <form action="xulythemkhachhang.php" method="POST">
            <div class="form-group">
                <label for="email">Mã khách hàng</label>
                <input type="text" name='makh' class="form-control" placeholder="" id="email">
            </div>
            <div class="form-group">
                <label for="email">Tên khách hàng</label>
                <input type="text" name="tenkh" class="form-control" placeholder="" id="email">
            </div>
            <div class="form-group">
                <label for="email">Giới tính</label>
                <input type="text" name="gioitinh" class="form-control" placeholder="" id="email">
            </div>
            <div class="form-group">
                <label for="email">Địa chỉ</label>
                <input type="text" name="diachi" class="form-control" placeholder="" id="email">
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="text" name="email" class="form-control" placeholder="" id="email">
            </div>
            <div class="form-group">
                <label for="email">Số điện thoại</label>
                <input type="text" name="sdt" class="form-control" placeholder="" id="email">
            </div>
            <button type="submit" name="luu" class="btn btn-primary mt-3">Submit</button>
       </form> 
    </div>
</div>