<?php
include('header.php');
?>
<div class="container">
    <div class="row">
        <h1 class="text-center">Thêm đơn hàng</h1>
        <form action="xulythemdonhang.php" method="POST">
            <div class="form-group">
                <label for="email">Mã khách hàng</label>
                <input type="text" name='idkhachhang' class="form-control" placeholder="" id="email">
            </div>
            <div class="form-group">
                <label for="email">Mã nhân viên</label>
                <input type="text" name="idnhanvien" class="form-control" placeholder="" id="email">
            </div>
            <div class="form-group">
                <label for="email">Ngày đặt hàng</label>
                <input type="date" name="ngaydathang" class="form-control" placeholder="" id="email">
            </div>
            <div class="form-group">
                <label for="email">Ngày giao hàng</label>
                <input type="date" name="ngaygiaohang" class="form-control" placeholder="" id="email">
            </div>
            <div class="form-group">
                <label for="email">Ngày yêu cầu chuyển</label>
                <input type="date" name="ngayyeucauchuyen" class="form-control" placeholder="" id="email">
            </div>
            <div class="form-group">
                <label for="email">Mã công ty giao hàng</label>
                <input type="text" name="idcty" class="form-control" placeholder="" id="email">
            </div>
            <div class="form-group">
                <label for="email">Địa chỉ giao hàng</label>
                <input type="text" name="diachigiaohang" class="form-control" placeholder="" id="email">
            </div>
            <button type="submit" name="luu" class="btn btn-primary mt-3">Submit</button>
       </form> 
    </div>
</div>