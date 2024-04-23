
<?php 
    require 'connect.php';

  
    $sql = 'select * from chuyen_xe as a,khach_hang as b, tai_xe as c, danh_gia as d, trang_thai as e
    where a.KH_MA=b.KH_MA and a.TX_MA=c.TX_MA and a.CX_MA=d.CX_MA and c.TX_ma=e.TX_MA and TT_tinhTrang=0';


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
