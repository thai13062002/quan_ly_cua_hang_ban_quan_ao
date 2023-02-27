<?php
include('header.php');
?>
<div class="container">
    <div class="row">
        <h1 class="text-center">Thêm nhân viên</h1>
        <form action="xulythemnhanvien.php" method="POST">
            <div class="form-group">
                <label for="email">Mã nhân viên</label>
                <input type="text" name='manv' class="form-control" placeholder="" id="email">
            </div>
            <div class="form-group">
                <label for="email">Tên nhân viên</label>
                <input type="text" name="tennv" class="form-control" placeholder="" id="email">
            </div>
            <div class="form-group">
                <label for="email">Ngày sinh</label>
                <input type="date" name="ngaysinh" class="form-control" placeholder="" id="email">
            </div>
            <div class="form-group">
                <label for="email">Giới tính</label>
                <input type="text" name="gioitinh" class="form-control" placeholder="" id="email">
            </div>
            <div class="form-group">
                <label for="email">Ngày bắt đầu làm</label>
                <input type="date" name="ngaybatdaulam" class="form-control" placeholder="" id="email">
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
            <div class="form-group">
                <label for="email">Lương cơ bản</label>
                <input type="text" name="luongcb" class="form-control" placeholder="" id="email">
            </div>
            <div class="form-group">
                <label for="email">Chức vụ</label>
                <input type="text" name="chucvu" class="form-control" placeholder="" id="email">
            </div>
            <div class="form-group">
                <label for="email">Tình Trạng</label>
                <input type="text" name="tinhtrang" class="form-control" placeholder="" id="email">
            </div>
            <button type="submit" name="luu" class="btn btn-primary mt-3">Submit</button>
       </form> 
    </div>
</div>