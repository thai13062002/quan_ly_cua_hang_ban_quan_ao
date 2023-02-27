<?php
include('header.php');
?>
<div class="container">
    <div class="row">
        <h1 class="text-center">Thêm nhà cung cấp</h1>
        <form action="xulythemnhacungcap.php" method="POST">
            <div class="form-group">
                <label for="email">Mã nhà cung cấp</label>
                <input type="text" name='manhacungcap' class="form-control" placeholder="" id="email">
            </div>
            <div class="form-group">
                <label for="email">Tên công ty</label>
                <input type="text" name="tencongty" class="form-control" placeholder="" id="email">
            </div>
            <div class="form-group">
                <label for="email">Địa chỉ </label>
                <input type="text" name="diachi" class="form-control" placeholder="" id="email">
            </div>
            <div class="form-group">
                <label for="email">Số điện thoại </label>
                <input type="text" name="sdt" class="form-control" placeholder="" id="email">
            </div>
            <div class="form-group">
                <label for="email">Còn giao dịch</label>
                <input type="text" name="congiaodich" class="form-control" placeholder="" id="email">
            </div>
           
            <button type="submit" name="luu" class="btn btn-primary mt-3">Submit</button>
       </form> 
    </div>
</div>