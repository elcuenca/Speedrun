<?php
session_start();

include("../partials/connect.php");

$total=$_POST['total'];
$phone_number=$_POST['phone'];
$address=$_POST['address'];
$customerID=$_SESSION['customer_id'];
$payment=$_POST['mode_of_payment'];

$sql="INSERT INTO orders_t(customer_id,address,phone_number,total_amount, pay_method) VALUES ('$customerID', '$address', '$phone_number', '$total', '$payment' )";
$connect->query($sql);


#query for the next table order_details_t
$sql2="Select id from orders_t order by id DESC limit 1";
$result=$connect->query($sql2);
$final=$result->fetch_assoc();
$orderID=$final['id'];

foreach ($_SESSION['cart'] as $key => $value){
	$productID==$value['item_id'];
	$quantity=$value['quantity'];

	$sql3="INSERT INTO order_details_t(order_id, product_id, quantity) VALUES ('$orderID', '$productID', '$quantity')";
	$connect->query($sql3);
}


if ($payment=="paypal"){
	$_SESSION['total']=$total;
	header('location: paypal.php');

}else{
	echo "<script> alert('Order has been placed. Thank you for shopping!');
	window.location.href='../index.php'</script>";
}



?>