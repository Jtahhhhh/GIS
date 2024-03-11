<?php 
    require 'connect.php';

    // $sql = 'SELECT CX_toaDoKTx AS latitude, CX_toaDoKTy AS longitude, NULL AS TX_username
    // FROM chuyen_xe 
    // WHERE chuyen_xe.CX_trangThai = 0';

    $sql = 'SELECT * from tai_xe';

    // $sql = $sql1 . ' UNION ' . $sql2;

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
