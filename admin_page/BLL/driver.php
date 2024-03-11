
<?php 
    require 'connect.php';

  
    $sql = 'SELECT a.TX_sodienthoai,a.TX_email,a.TX_ma,a.TX_ten,b.X_ten, DDG_SAO from tai_xe as a, xe as b, chi_tiet_xe as c, diem_danh_gia as d
    WHERE b.X_MA=c.X_MA and c.TX_MA=a.TX_MA and a.TX_MA=d.TX_MA;';


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
