<?php
include("../partials/connect.php");

$category=$_POST['category_name'];


$sql="INSERT INTO category_t(category_name) VALUES('$category')";

$connect->query($sql);

header('location: products_show.php');
?>