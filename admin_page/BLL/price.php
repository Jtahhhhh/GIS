<?php 
    require 'connect.php';

  
    $sql = 'SELECT * from chi_tiet_bang_gia';


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
