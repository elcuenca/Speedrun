<?php
include("../partials/connect.php");

$name=$_POST['product_name'];
$price=$_POST['price'];
$color=$_POST['color'];
$description=$_POST['product_description'];
$category=$_POST['category'];


#For Picture File Input 
$target="../uploads/";
$file_path=$target.basename($_FILES['file']['name']);
$file_name=$_FILES['file']['name'];
$file_tmp=$_FILES['file']['tmp_name'];
$file_store="../uploads/".$file_name;

move_uploaded_file($file_tmp, $file_store);


$sql="INSERT INTO products_t(name,price,color,picture,description,category_id) VALUES('$name','$price','$color','$file_path', '$description', '$category')";

$connect->query($sql);
?>