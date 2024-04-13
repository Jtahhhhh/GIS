<?php
  require 'BLL/connect.php';

  $idgia = $_POST["idgia"];
  $giatren = $_POST["giatren"];
  $giaduoi = $_POST["giaduoi"];
  $dongia = $_POST["dongia"];

  if(isset($_POST["updatePrice"])){
    $sql = "UPDATE chi_tiet_bang_gia SET 
                                      CTG_DONGIA = '".$dongia."',
                                      CTG_GIACANTREN = '".$giatren."',
                                      CTG_GIACANDUOI = '".$giaduoi."'
                            WHERE CTG_MA= '{$idgia}'";
    if ($conn->query($sql)==true){
      $message = "Đã cập nhật chi tiết giá thành công!";
      echo "<script type='text/javascript'>alert('$message');</script>";
      header('Refresh: 0;url=price.html');
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
  }

  if(isset($_POST["deletePrice"])){
    $sql = "DELETE FROM chi_tiet_bang_gia WHERE CTG_MA='{$idgia}'";
    if ($conn->query($sql)==true){
      $message = "Đã xoá chi tiết bảng giá thành công!";
      echo "<script type='text/javascript'>alert('$message');</script>";
      header('Refresh: 0;url=price.html');
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
  }





?>