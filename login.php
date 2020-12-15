<?php
    include "conn.php";
    
    $user = $_POST['username'];
    $pass = $_POST['password'];

    $q = $connect->query(" select * from login where username ='".$user."' and password = '".$pass."'");
    $result = array();

    while($fetchData = $q->fetch_assoc()){
        $result[] = $fetchData;
    }
    echo json_encode($result);
?>