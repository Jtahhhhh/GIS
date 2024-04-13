<?php 
require 'connect.php';

// Check if id is provided via POST
if(isset($_POST["id"])) {
    $id = $_POST["id"];

    // Query to fetch data based on provided id
    $sql = "SELECT * FROM chuyen_xe WHERE CX_trangThai = 0 AND TX_MA = $id";

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
} else {
    echo json_encode(["message" => "Không có dữ liệu"]);
}
?>
