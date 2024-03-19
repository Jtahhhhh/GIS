
<?php 
    require 'connect.php';

  
    $sql = 'select * from xe as a,chi_tiet_xe as b
    WHERE a.X_MA=B.X_MA ;';


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
