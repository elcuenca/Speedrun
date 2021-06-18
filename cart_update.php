<?php
	session_start();

	$quantity=$_POST['quantity'];

	if (isset($_POST['update'])){
		foreach ($_SESSION['cart'] as $key => $value) {
			if ($value['item_name']==$_POST['item_name']){
				$_SESSION['cart'][$key]['quantity']=$quantity;
				echo "<script>alert('Item quantity has been updated. Redirecting you back now to your cart.');
				window.location.href='cart.php'
				</script>";
			}
		}
	}
?>