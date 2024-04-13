<?php

require 'connect.php';

$ma = $_POST["id"];
$ten = $_POST["ten"];
$phone = $_POST["phone"];
$email = $_POST["email"];
$user = $_POST["user"];
$pass = $_POST["pass"];
$qh = $_POST["qh"];

// if (empty($_POST["ten"])) {
//     echo '<script language="javascript">
//     alert("Chưa nhập tên!");
//     history.back();
//      </script>';
// } 
// else if (empty($_POST["phone"])) {
//     echo '<script language="javascript">
//     alert("Chưa nhập số điện thoại!");
//     history.back();
//      </script>';
// } 
// else if (empty($_POST["email"])) {
//     echo '<script language="javascript">
//     alert("Chưa nhập Mail!");
//     history.back();
//      </script>';
// } 
// else if (empty($_POST["pass"])) {
//     echo '<script language="javascript">
//     alert("Chưa nhập mật khẩu!");
//     history.back();
//      </script>';
// } 
// else if (empty($_POST["user"])) {
//     echo '<script language="javascript">
//     alert("Chưa nhập mật khẩu!");
//     history.back();
//      </script>';
// }
// else if (strlen($_POST["pass"]) < 5) {
//     echo '<script language="javascript">
//     alert("Mật khẩu phải có ít nhất 5 ký tự!");
//     history.back();
//     </script>';
// }
// else 
if(isset($_POST["updateEMP"])){
        $sql = "UPDATE quan_ly SET 
                            QH_MA = '".$qh."',
                            QL_TEN = '".$ten."',
                            QL_SODIENTHOAI = '".$phone."',
                            QL_EMAIL = '".$email."',
                            QL_USERNAME = '".$user."',
                            QL_PASSWORD = '".$pass."'
                            WHERE QL_MA= '{$ma}'";
        if ($conn->query($sql)==true){
          $message = "Đã cập nhật thông tin nhân viên thành công!";
          echo "<script type='text/javascript'>alert('$message');</script>";
          header('Location: /GIS/admin_page/emp.html');
          exit;
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
} else if(isset($_POST["deleteEMP"])){
        $sql = "DELETE FROM quan_ly WHERE QL_MA='{$ma}'";
        if ($conn->query($sql)==true){
          $message = "Đã xoá nhân viên thành công!";
          echo "<script type='text/javascript'>alert('$message');</script>";
          header('Location: /GIS/admin_page/emp.html');
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
}else {
    echo "Fail :((";
}

// Đóng kết nối
$conn->close();

?>
