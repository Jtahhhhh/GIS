<?php
require 'connect.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $inputMail = $_POST["inputMail"];
    $inputPass = $_POST["inputPassword"];
    
    // Sử dụng Prepared Statements để tránh SQL injection
    $sql = "SELECT 
                CASE 
                    WHEN EXISTS (SELECT * FROM quan_ly WHERE QL_username = ? AND QL_PASSWORD = ?) THEN 0 
                    WHEN EXISTS (SELECT * FROM quan_ly WHERE QL_username = ?) THEN 1 
                    ELSE 2 
                END AS CODE";
    
    $stmt = $conn->prepare($sql);
    
    // Sử dụng bind_param để truyền tham số vào truy vấn
    $stmt->bind_param("sss", $inputMail, $inputPass, $inputMail);
    
    // Thực hiện truy vấn
    $stmt->execute();

    // Nhận kết quả truy vấn
    $result = $stmt->get_result();

    // Kiểm tra và xử lý dữ liệu
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        echo json_encode($row);
    } else {
        echo json_encode(["message" => "Không có dữ liệu"]);
    }

    $stmt->close();
}

// Đóng kết nối
$conn->close();
?>
