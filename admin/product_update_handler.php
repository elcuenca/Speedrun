<?php
include('../partials/connect.php');
if(isset($_POST['update'])){
	$newID=$_POST['form_id'];
	$newName=$_POST['product_name'];
	$newPrice=$_POST['price'];
	$newColor=$_POST['color'];
	$newDescription=$_POST['product_description'];
	$newCat=$_POST['category'];

	#For Picture File Input 
	$target="../upl oads/";
	$file_path=$target.basename($_FILES['file']['name']);
	$file_name=$_FILES['file']['name'];
	$file_tmp=$_FILES['file']['tmp_name'];
	$file_store="../uploads/".$file_name;

	move_uploaded_file($file_tmp, $file_store);

	$sql="UPDATE products_t set name='$newName', price='$newPrice', color='$newColor', description='$newDescription', category_id='$newCat', picture='$file_path' where id='$newID'";

	if (mysqli_query($connect,$sql)){
		header('location: products_show.php');
	}else{
		header('location: admin_index.php');

	}
}

?>