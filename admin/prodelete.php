<?php
include('../partials/connect.php');
$newID=$_GET['delete_id'];

$sql="DELETE from products_t where id='$newID'";

if (mysqli_query($connect,$sql)){
	header ('location: products_show.php');
}else{
	echo "record not deleted";
}

?>