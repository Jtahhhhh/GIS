
<?php 
    require 'connect.php';

  
    $sql = 'SELECT * FROM `tai_xe` as a,`xe` as b,`chi_tiet_xe` as c
    Where a.TX_ma=c.TX_ma and b.X_ma = c.X_ma;';
    $result = $conn->query($sql);


  if ($result->num_rows > 0) {
      $data = array();

      while ($row = $result->fetch_assoc()) {
          $data[] = $row;
      }

      echo json_encode($data);
  } else {
      echo json_encode(["message" => "Không có dữ liệu"]);
  }
    
?>
