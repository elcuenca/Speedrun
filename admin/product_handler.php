<?php
include("../partials/connect.php");

$sku=$_POST['sku'];
$name=$_POST['product_name'];
$price=$_POST['price'];
$weight=$_POST['weight'];
$size=$_POST['size'];
$dimension=$_POST['dimension'];
$color=$_POST['color'];
$description=$_POST['product_description'];
$category=$_POST['category'];


#For Picture File Input 
$target="uploads/";
$file_path=$target.basename($_FILES['file']['name']);
$file_name=$_FILES['file']['name'];
$file_tmp=$_FILES['file']['tmp_name'];
$file_store="uploads/".$file_name;

move_uploaded_file($file_tmp, $file_store);


$sql="INSERT INTO products_t(SKU_name,name,price,weight,size,dimension,color,picture,description,category_id) VALUES('$sku','$name','$price','$weight','$size','$dimension','$color','$file_path', '$description', '$category')";

$connect->query($sql);

header('location: products_show.php');
?>