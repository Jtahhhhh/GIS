<?php
require 'connect.php';
session_start();


$idcx = $_POST["idcx"];
$rating = $_POST['rating'];
$message = $_POST["message"];


$sql_check = "select * from danh_gia where CX_MA = '{$idcx}'";
$rs = $conn->query($sql_check);

$row = $rs->fetch_assoc();
$macx = $row["CX_MA"];
if ($macx == $idcx) {

    $sql_update = "UPDATE `danh_gia` SET `DG_SAO`='".$rating."',`DG_NOIDUNG`='".$message."' WHERE CX_MA='{$idcx}' ";           
    if ($conn->query($sql_update) == true) {

      $sql_tx = "select TX_MA from chuyen_xe where cx_ma = '{$idcx}'";
      $result = $conn->query($sql_tx);
      $row = $result->fetch_assoc();
      // Lấy id tài xế
      $idtx = $row["TX_MA"];  
      // Update điểm đánh giá
      $sql_update_ddg = "UPDATE diem_danh_gia ddg
                          set ddg.DDG_SAO = (select AVG(dg.DG_SAO)
                                              from danh_gia dg
                                              join chuyen_xe cx on cx.CX_MA=dg.CX_MA
                                              where cx.TX_MA='{$idtx}'),
                              ddg.DDG_TONGDIEM = (select AVG(dg.DG_SAO)*20
                                              from danh_gia dg
                                              join chuyen_xe cx on cx.CX_MA=dg.CX_MA
                                              where cx.TX_MA='{$idtx}')
                            where ddg.TX_MA ='{$idtx}' ";

      if($conn->query($sql_update_ddg) == TRUE){
        $ms = "Cập nhật đánh giá thành công!";
        echo "<script type='text/javascript'>alert('$ms');</scr>";
        header('Refresh: 0;url=xemdanhgia.php');
      } else{
        echo "Error: " . $sql_update_ddg . "<br>" . $conn->error;
      }
    } else {
      echo "Error: " . $sql . "<br>" . $conn->error;
    }


  } else {

    
    $sql = "insert into DANH_GIA values('" . $idcx . "', '" . $rating . "', '" . $message . "')";
    if ($conn->query($sql) == true) {


      $sql_tx = "select * from chuyen_xe where cx_ma = '{$idcx}'";
      $result = $conn->query($sql_tx);
      $row = $result->fetch_assoc();
      // Lấy id tài xế
      $idtx = $row["TX_MA"];
      // Update điểm đánh giá
      $sql_update_ddg = "UPDATE diem_danh_gia ddg
                          set ddg.DDG_SAO = (select AVG(dg.DG_SAO)
                                              from danh_gia dg
                                              join chuyen_xe cx on cx.CX_MA=dg.CX_MA
                                              where cx.TX_MA='{$idtx}'),
                              ddg.DDG_TONGDIEM = (select AVG(dg.DG_SAO)*20
                                              from danh_gia dg
                                              join chuyen_xe cx on cx.CX_MA=dg.CX_MA
                                              where cx.TX_MA='{$idtx}')
                          where ddg.TX_MA ='{$idtx}' ";

      
      if($sql_update_ddg==true){
        $ms = "Đánh giá chuyến xe thành công!";
      echo "<script type='text/javascript'>alert('$ms');</script>";
      header('Refresh: 0;url=xemdanhgia.php');
      } else{
        echo "Error: " . $sql_update_ddg . "<br>" . $conn->error;
      }  
    } else {
      echo "Error: " . $sql . "<br>" . $conn->error;
    }
  }





$conn->close();


?>