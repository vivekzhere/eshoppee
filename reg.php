<?php
include("connect.php");
$name=$_POST['fullname'];
$usr=$_POST['username'];
$p0=$_POST['password0'];
$p=$_POST['password1'];
$p2=$_POST['password2'];
$add=$_POST['address'];
$mail=$_POST['mail'];
$ph=$_POST['phone'];
$act=$_GET['act'];
if($act==1||$act==2)
{
	session_start();
	$id=$_SESSION['id'];
	if($_SESSION['check']!=1)
		header('Location:login.php');
	else if($act==2)
	{
		if($p0==""||$p==""||$p2==""||$name==""||$add=="")
		    header('Location:editprof.php?chpas=2');
		else if($p!=$p2)
			header('Location:editprof.php?err=2&chpas=2');
		else
		{
			$result=pg_query($dbconn, "select password from e_customer where c_id='$id';");
			$pc=pg_fetch_row($result);
			if($pc[0]!=$p0)
				header('Location:editprof.php?err=1&chpas=2');
			else
			{
				$result=pg_query($dbconn, "UPDATE e_customer SET c_name='$name',password='$p',address='$add',email='$mail',phone='$ph' WHERE c_id='$id';");
				echo pg_last_error($dbconn);
				header('Location:editprof.php?err=3&chpas=2');
			}
		}
	}
	else
	{
        if($name==""||$add=="")
		    header('Location:editprof.php?chpas=1');
		$result=pg_query($dbconn, "UPDATE e_customer SET c_name='$name',address='$add',email='$mail',phone='$ph' WHERE c_id='$id';");		
		echo pg_last_error($dbconn);
		header('Location:editprof.php?err=3&chpas=1');
	}
}
else
{
	if($name==""||$usr==""||$p==""||$add=="")
		header('Location:register.php');
	else if ($p==$p2)
	{
		$result=pg_query($dbconn, "select c_id from e_customer where c_id='$usr';");
		$row=pg_fetch_row($result);
		if($row[0]==$usr)
			header('Location:register.php?status=3');
		else
		{		
			$result=pg_query($dbconn, "insert into e_customer values ('$name','$usr','$p','$add','$mail','$ph',0)"); 
			echo pg_last_error($dbconn);
			header('Location:register.php?status=1');
		}
	}
	else
		header('Location:register.php?status=2');
}
?>
