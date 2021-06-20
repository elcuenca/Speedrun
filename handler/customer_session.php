<?php
if (empty($_SESSION['email'] AND $_SESSION['password'])){
	echo "<script>alert('Please login first before proceeding to checkout.');
	window.location.href='customer_forms.php'</script>";
}



?>