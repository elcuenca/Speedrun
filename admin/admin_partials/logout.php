<?php
session_start();
session_destroy();


#Redirecting user back to login page 
header('location: ../admin_login.php');

?>