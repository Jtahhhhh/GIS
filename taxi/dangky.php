<?php
require 'connect.php';
session_start();

if(isset($_POST["dangky"])){
    $ten  = $_POST['ten'];
    $sdt = $_POST['sdt'];
    $email = $_POST['email'];
    $username = $_POST['username'];
    
    $tp = $_POST['tp'];
    $quanhuyen = $_POST['qh'];

    $mk = $_POST['psw'];
    $repass = $_POST['psw1'];
    $dtl = 0;


    $check = "select kh_username from khach_hang where kh_username = '".$username."'";
    $rs_check = $conn->query($check);
    if($rs_check->num_rows >0){
      $message = "Tên đăng nhập đã được sử dụng, vui lòng dùng tên khác!";
      echo "<script type='text/javascript'>alert('$message');</script>";
      header('Refresh: 0;url=registration.php');    
    } else if( $repass != $mk){
      $kqdk = "Mật khẩu nhập lại không chính xác";
    } else{

      // Lấy id khách hàng 
      $sql = "select max(KH_MA) as max_id from khach_hang";
      $result = $conn -> query($sql);
      if ($result->num_rows > 0) {
            $row = mysqli_fetch_assoc($result);
            $kh_max_id = $row["max_id"];
      }
      $khid = $kh_max_id+1;

      // Lấy id thành phố
      $sql_tp = "select max(TP_MA) as max_id from thanh_pho";
      $result = $conn -> query($sql_tp);
      if ($result->num_rows > 0) {
            $row = mysqli_fetch_assoc($result);
            $tp_max_id = $row["max_id"];
      }
      $tpid = $tp_max_id+1;

      // Lấy id quận huyện
      $sql_qh = "select max(QH_MA) as max_id from quan_huyen";
      $result = $conn -> query($sql_qh);
      if ($result->num_rows > 0) {
            $row = mysqli_fetch_assoc($result);
            $qh_max_id = $row["max_id"];
      }
      $qhid = $qh_max_id+1;

      
      $sql_tp = "insert into thanh_pho values($tpid, '".$tp."')";
      if($conn->query( $sql_tp ) == TRUE) {
        $sql_qh = "INSERT INTO `quan_huyen`(`QH_MA`, `TP_MA`, `QH_TEN`) VALUES ('".$qhid."','".$tpid."','".$quanhuyen."')";
        if($conn->query($sql_qh) == TRUE){
          $sql = "insert into khach_hang values($khid, '".$$qhid."', '".$ten."', '".$sdt."', '".$email."', '".$username."', '".$mk."', '".$dtl."')";
          if($conn->query($sql) == TRUE){
            $ms = "Đăng ký tài khoản thành công!";
            echo "<script type='text/javascript'>alert('$ms');</script>";
            header('Refresh: 0;url=login.php');
          } else{
            echo "<br>Error: " . $sql . "<br>" . $conn->error;
          }
        } else{
          echo "<br>Error: " . $sql_qh . "<br>" . $conn->error;
        }
      } else{
        echo "<br>Error: " . $sql_tp . "<br>" . $conn->error;
      }



      


    }
  }

?>
<?php ?>