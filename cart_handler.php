<?php
session_start();
if (isset($_SESSION['cart'])){

	#shows an alert if user already chosen the product
	$checker=array_column($_SESSION['cart'], 'item_name');
	if(in_array($_GET['cart_name'], $checker)){
		echo "<script>alert('Product has already been in your cart. You can update the quantity of this product later at checkout. Redirecting you now back to shopping page :)');
		window.location.href='product.php';
		</script>";
	}

	$count=count($_SESSION['cart']);
	$_SESSION['cart'][$count]=array('ietm_id' => $_GET['cart_id'], 'item_name'=>$_GET['cart_name'], 'item_price'=>$_GET['cart_price']);


	#alert when product has been added 
	echo "<script>alert('Product has been added! Redirecting you back to the shop.');
	window.location.href='product.php';
	</script>";

} else {
	$_SESSION['cart'][0]=array('item_id'=>$_GET['cart_id'], 'item_name'=>$_GET['cart_name'], 'item_price'=>$_GET['cart_price']);

	#alert when product has been added 
	echo "<script>alert('Product has been added! REdirecting you back to the shop.');
	window.location.href='product.php';
	</script>";
}


?>