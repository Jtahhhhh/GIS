<?php
    require 'connect.php';

    $sql = 'SELECT b.X_MA, a.X_TEN, a.X_BIENSO FROM xe AS a, chi_tiet_xe AS b WHERE a.X_MA = b.X_MA AND B.TX_MA = "" ';

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
