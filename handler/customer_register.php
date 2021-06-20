<?php
include('../partials/connect.php');

$email=$_POST['email'];
$password=$_POST['password']; 
$repassword=$_POST['repassword'];


if ($password==$repassword){
	$sql="INSERT INTO customer_t (username,password) VALUES ('$email', '$password')";
	$connect->query($sql);

	echo "<script>alert('Registration success! Please log-in using your saved credentials. Redirecting you back now.');
		window.location.href= '../customer_forms.php';
		</script>";
} else {

	echo "<script>alert('Passwords did not match. Please try again and make sure that both passwords are similar. Redirecting you back now.');
		window.location.href= '../customer_forms.php';
		</script>";
}


?>