<?php

require 'connect.php';

if (empty($_POST["QL_TEN"])) {
    echo '<script language="javascript">
    alert("Chưa nhập tên!");
    history.back();
     </script>';
} 
else if (empty($_POST["QL_SDT"])) {
    echo '<script language="javascript">
    alert("Chưa nhập số điện thoại!");
    history.back();
     </script>';
} 
else if (empty($_POST["QL_MAIL"])) {
    echo '<script language="javascript">
    alert("Chưa nhập Mail!");
    history.back();
     </script>';
} 
else if (empty($_POST["QL_PASSWORD"])) {
    echo '<script language="javascript">
    alert("Chưa nhập mật khẩu!");
    history.back();
     </script>';
} 
else if (strlen($_POST["QL_PASSWORD"]) < 8) {
    echo '<script language="javascript">
    alert("Mật khẩu phải có ít nhất 8 ký tự!");
    history.back();
    </script>';
}
else {
    $QL_USERNAME = $_POST["QL_USERNAME"];

    // Check if username already exists
    $check_username_sql = "SELECT * FROM quan_ly WHERE QL_USERNAME = ?";
    $check_username_stmt = $conn->prepare($check_username_sql);
    $check_username_stmt->bind_param("s", $QL_USERNAME);
    $check_username_stmt->execute();
    $check_username_result = $check_username_stmt->get_result();

    if ($check_username_result->num_rows > 0) {
        echo '<script language="javascript">
        alert("USERNAME đã tồn tại!");
        history.back();
         </script>';
        exit();
    }

    // Get the next available ID
    $get_max_id_sql = "SELECT MAX(QL_MA) AS maxid FROM quan_ly";
    $get_max_id_result = $conn->query($get_max_id_sql);
    $row = $get_max_id_result->fetch_assoc();
    $nextid = $row['maxid'] + 1;
     
    // Insert new user
    $insert_sql = "INSERT INTO `quan_ly`(`QL_MA`, `QH_MA`, `QL_TEN`, `QL_SODIENTHOAI`, `QL_EMAIL`, `QL_USERNAME`, `QL_PASSWORD`) VALUES (?, ?, ?, ?, ?, ?, ?)";
    $insert_stmt = $conn->prepare($insert_sql);
    $insert_stmt->bind_param("sssssss", $nextid,$_POST["QH"], $_POST["QL_TEN"], $_POST["QL_SDT"], $_POST["QL_MAIL"], $_POST["QL_USERNAME"], $_POST["QL_PASSWORD"]);
    $insert_result = $insert_stmt->execute();

    if ($insert_result) {
        echo '<script language="javascript">
        alert("Thêm thành công!");
        window.history.back()  ;
        </script>';
    } else {
        echo "Thêm nhân viên thất bại: " . $conn->error;
    }
}

// Đóng kết nối
$conn->close();

?>
