<?php
session_start();

include("connect.php");
$name=$_POST['pdtname'];
$cat=$_POST['cat'];
$p=$_POST['ppu'];
$u=$_POST['units'];
$d=$_POST['descrip'];
$sid=$_SESSION['id'];
if($name==""||$p==""|$u==""||$cat=="")
	header('Location:sell.php?stat=0');
else
{
	$result=pg_query($dbconn,"select max(p_id) from e_products;");
	$row=pg_fetch_row($result);
	if($row[0]=="")
		$id='PRO0001';
	else
		$id=++$row[0];
	$result=pg_query($dbconn, "insert into e_products values ('$id','$name','NULL','$d','$cat','$p','$u','$sid')"); 
	echo pg_last_error($dbconn);
	header('Location:sell.php?stat=1');
	
}
?>

