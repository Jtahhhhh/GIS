<?php

require 'connect.php';
session_start();

$username = mysqli_real_escape_string($conn, $_POST['username']);
$password = mysqli_real_escape_string($conn, $_POST['password']);

$sql = "select * from khach_hang where kh_username = '".strtolower($username)."' and kh_password = '".$password."'";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
  $row = $result->fetch_assoc();
  $_SESSION["id"] = $row["KH_MA"];
  $_SESSION["pw"] = $row["KH_PASSWORD"];
  $_SESSION["khid"] = $row["KH_MA"];
  $_SESSION["name"] = $row["KH_TEN"];
  $_SESSION["sdt"] = $row["KH_SODIENTHOAI"];
  $_SESSION["location"] = $row["QH_MA"];
  $_SESSION["email"] = $row["KH_EMAIL"];
  $_SESSION["diemtl"] = $row["KH_DIEMTICHLUY"];

  $pwss = $_SESSION["pw"];

  $message = "Đăng nhập thành công!.";
  echo "<script type='text/javascript'>alert('$message');</script>";
  header('Refresh: 0;url=index.php');

  // header('Location: index.php');
} else {
  $message = "Tài khoản hoặc mật khẩu không đúng. Vui lòng thử lại!.";
  echo "<script type='text/javascript'>alert('$message');</script>";
  header('Refresh: 0;url=registration.php');
}
$conn->close();

?>
<?php
?>