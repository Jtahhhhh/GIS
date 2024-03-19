<?php

require 'connect.php';

if (empty($_POST["cantren"])) {
    // Chuỗi chứa khoảng trắng
    echo '<script language="javascript">
    alert("Chưa nhập cận trên!");
    history.back();
     </script>';
} 
else if (empty($_POST["canduoi"])) {
    // Chuỗi chứa khoảng trắng
    echo '<script language="javascript">
    alert("Chưa nhập cận dưới!");
    history.back();
     </script>';
} 
else if (empty($_POST["gia"])) {
    // Chuỗi chứa khoảng trắng
    echo '<script language="javascript">
    alert("Chưa nhập giá!");
    history.back();
     </script>';
} 
else if ($_POST["cantren"]<=$_POST["canduoi"]) {
    // Chuỗi chứa khoảng trắng
    echo '<script language="javascript">
    alert("Lỗi nhập liệu!");
    history.back();
     </script>';
} 
else{
$sql = "SELECT * FROM chi_tiet_bang_gia WHERE CTG_GIACANTREN = '$_POST["cantren"]'&& CTG_GIACANDUOI='$_POST["canduoi"]'";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
    // Nếu email đã tồn tại, thông báo lỗi và reload lại trang
    echo '<script language="javascript">
    alert("Khoảng giá đã tồn tại!");
    history.back();
     </script>';
    exit();
}
// Thêm khách hàng vào cơ sở dữ liệu
  $sql = "SELECT MAX(CTG_ma) AS maxid FROM chi_tiet_bang_gia";
  $result = $conn->query($sql);
  $row = $result->fetch_assoc();
  $nextid = $row['maxid'] + 1;  
  $sql = "INSERT INTO `chi_tiet_bang_gia`(`CTG_MA`, `CTG_DONGIA`, `CTG_GIACANTREN`, `CTG_GIACANDUOI`) 
  VALUES ('$nextid ','".$_POST["gia"]."','".$_POST["cantren"]."','".$_POST["canduoi"]."') ";  

 $result = $conn->query($sql);

if ( $result) {
  echo '<script language="javascript">
  alert("Thêm thành công!");
  window.location.href = "driver.html";
    </script>';
} else {
    echo "Thêm thất bại: " . $conn->error;
}
}

// Đóng kết nối

?>