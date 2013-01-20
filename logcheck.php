<?php
$u=$_POST['username'];
$p=$_POST['password'];
if($u==""||$p=="")
	header('Location:login.php');
else
{
	include("connect.php");
	$result=pg_query($dbconn, "select c_id from e_customer where c_id='$u' and password='$p';");
	$row=pg_fetch_row($result);

	//		
	if($u==$row[0])
	{
		session_start();
		$_SESSION['id']=$row[0];
		$_SESSION['check']=1;
		header("Location: home.php");
		echo "Login sucess";
	}
	else
	{
		$_SESSION['check']=0;
		header("Location: login.php?logcheck=1");
	}
}
?>

