<?php
    $db_host = '10.58.112.4';
    $db_user = 'root';
    $db_pass = 'admin123';
    $db_name = 'bts';

    $con = mysqli_connect($db_host,$db_user,$db_pass,$db_name);

    if (!$con) {
         echo "<script>alert(\"DB 접속 오류\");</script>";
     }
     else {
         echo "<script>alert(\"DB 접속 성공\");</script>";
     }
?>
