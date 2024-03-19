<?php

require 'connect.php';

if (empty($_POST["TX_TEN"])) {
    // Chuỗi chứa khoảng trắng
    echo '<script language="javascript">
    alert("Chưa nhập tên!");
    history.back();
     </script>';
} 
else if (empty($_POST["TX_SDT"])) {
    // Chuỗi chứa khoảng trắng
    echo '<script language="javascript">
    alert("Chưa nhập số điện thoại!");
    history.back();
     </script>';
} 
// else if (empty($_POST["TX_MAIL"])) {
//     // Chuỗi chứa khoảng trắng
//     echo '<script language="javascript">
//     alert("Chưa nhập Mail!");
//     history.back();
//      </script>';
// } 
else if (empty($_POST["TX_PASSWORD"])) {
    // Chuỗi chứa khoảng trắng
    echo '<script language="javascript">
    alert("Chưa nhập mật khẩu!");
    history.back();
     </script>';
} 
else if (strlen($_POST["TX_PASSWORD"]) > 8) {
    // Chuỗi có nhiều hơn 8 ký tự
    echo '<script language="javascript">
    alert("Mật khẩu phải có ít nhất 8 ký tự!");
    history.back();
    </script>';
}
else{
$TX_USERNAME = $_POST["TX_USERNAME"];
$sql = "SELECT * FROM tai_xe WHERE TX_USERNAME = '$TX_USERNAME'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Nếu email đã tồn tại, thông báo lỗi và reload lại trang
    echo '<script language="javascript">
    alert("USERNAME đã tồn tại!");
    history.back();
     </script>';
    exit();
}
$TX_SDT = $_POST["TX_SDT"];
$sql = "SELECT * FROM tai_xe WHERE TX_SOIENTHOAI = '$TX_SDT'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Nếu email đã tồn tại, thông báo lỗi và reload lại trang
    echo '<script language="javascript">
    alert("SDT đã tồn tại!");
    history.back();
     </script>';
    exit();
}
// Thêm khách hàng vào cơ sở dữ liệu
// Retrieve the maximum TX_MA value
$sql = "SELECT MAX(TX_MA) AS maxid FROM tai_xe";
$result = $conn->query($sql);

if ($result) {
    $row = $result->fetch_assoc();
    // Increment the maximum ID to get the next ID
    $nextid = $row['maxid'] + 1;
} else {
    // Handle errors gracefully
    echo "Error retrieving maximum ID: " . $conn->error;
    exit(); // Exit the script to prevent further execution
}

// Prepare and execute the INSERT statement
$stmt = $conn->prepare("INSERT INTO tai_xe (TX_MA, QH_MA, TX_TEN, TX_SODIENTHOAI, TX_EMAIL, TX_USERNAME, TX_PASSWORD) VALUES (?, ?, ?, ?, ?, ?, ?)");
$stmt->bind_param("sssssss", $nextid, $_POST["loai"], $_POST["TX_TEN"], $_POST["TX_SDT"], $_POST["TX_EMAIL"], $_POST["TX_USERNAME"], $_POST["TX_PASSWORD"]);
$stmt->execute();

// Close prepared statement
$stmt->close();

$sql =("UPDATE tai_xe SET TX_MA = '$nextid' WHERE X_MA =  '$_POST["X_MA"]' ");
$result = $conn->query($sql);


if ($conn->query($sql) === FALSE) {
    // Handle errors gracefully
    echo "Error updating TX_MA: " . $conn->error;
}

// Prepare and execute the INSERT statement for diem_danh_gia table
$sql = "INSERT INTO diem_danh_gia (TX_MA, DDG_SAO, DDG_TONG) VALUES ('$nextid', '5', '100')";
$result = $conn->query($sql);
if ($conn->query($sql) === FALSE) {
    // Handle errors gracefully
    echo "Error inserting into diem_danh_gia: " . $conn->error;
}


if ( $result) {
  echo '<script language="javascript">
  alert("Thêm thành công!");
  window.location.href = "ADMIN_PAGE/driver.html";
    </script>';
} else {
    echo "Thêm nhân viên thất bại: " . $conn->error;
}
}


?>