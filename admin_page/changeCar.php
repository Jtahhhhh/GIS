<?php
  require 'BLL/connect.php';

  $tx = $_POST["taixe"];
  $x = $_POST["xe"];
  $x1 =$_POST["xe2"];

  $sql="UPDATE chi_tiet_xe SET TX_MA = NULL WHERE X_MA = $x;";
  $result = $conn->query($sql);

  $sql="UPDATE chi_tiet_xe SET TX_MA = $tx WHERE X_MA = $x1;";
  $result = $conn->query($sql);

  if ( $result) {
    echo '<script language="javascript">
    alert("Chỉnh sửa thành công thành công!");
    window.history.back();
      </script>';
  } else {
      echo "Thêm thất bại: " . $conn->error;
  }

?>