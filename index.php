<?php
session_start();
if($_SESSION['check']==1)
	header('Location:home.php');
else
	header('Location:login.php');
?>
