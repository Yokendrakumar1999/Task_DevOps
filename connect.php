<?php

$host="login.clk6qshkuq1n.us-east-1.rds.amazonaws.com";
$user="admin";
$pass="password";
$db="login";
$conn=new mysqli($host,$user,$pass,$db);
if($conn->connect_error){
    echo "Failed to connect DB".$conn->connect_error;
}
?>
