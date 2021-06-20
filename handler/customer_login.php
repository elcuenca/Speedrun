<?php
session_start();


if(isset($_POST['login'])){
	include('../partials/connect.php');

	$email=$_POST['email'];
	$password=$_POST['password'];
	$sql="SELECT * FROM customer_t WHERE username='$email' AND password='$password'";
	$results=$connect->query($sql);
	$final=$results->fetch_assoc();

  $_SESSION['email']=$final['username'];
  $_SESSION['password']=$final['password'];

	if ($email=$final['username'] AND $password=$final['password']){
		header('location: ../cart.php');
	}else{

		echo "<script>alert('Credentials did not match. Please try again. Redirecting you back now...');
    window.location.href='../customer_forms.php';
    </script>";
	}

}


?>
