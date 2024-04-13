<?php
require 'connect.php';

// Kiểm tra xem biến $ma có tồn tại trong $_POST không trước khi sử dụng nó
$ma = isset($_POST['$ma']) ? $_POST['$ma'] : '';

// Sử dụng câu lệnh chuẩn bị để ngăn chặn lỗ hổng SQL Injection
$sql = "SELECT * FROM chuyen_xe AS a
        INNER JOIN khach_hang AS b ON a.KH_MA = b.KH_MA
        INNER JOIN danh_gia AS c ON a.CX_MA = c.CX_MA
        INNER JOIN tai_xe AS d ON a.TX_MA = d.TX_MA
        WHERE a.CX_MA = ?";
        
// Chuẩn bị câu lệnh
$stmt = $conn->prepare($sql);
$stmt->bind_param('s', $ma); // Liên kết biến $ma với câu lệnh chuẩn bị

// Thực thi truy vấn
$stmt->execute();
$result = $stmt->get_result();

// Kiểm tra kết quả truy vấn
if ($result->num_rows > 0) {
    $data = array();

    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }

    echo json_encode($data);
} else {
    echo json_encode(["message" => "Không có dữ liệu"]);
}

// Đóng kết nối và câu lệnh chuẩn bị
$stmt->close();
$conn->close();
?>
