<?php
include("../partials/connect.php");

$email=$_POST['email'];
$msg=$_POST['msg'];

$sql="INSERT INTO contact_t(email,message) VALUES('$email', '$msg')";

$connect->query($sql);
?>