<?php
session_start();
if($_SESSION['check']!=1)
	header('Location:login.php');
?>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css"/>
<title>e-MART</title>
</head>
<body style="background-image:url(images/body.jpg)" TEXT="#58350D" LINK="#f7f7c0" ALINK="#F5F5DC" VLINK="#f7f7c0">
<div id="header">
<div id="linkbar">
	<table border="0" align="right">
		<tr><td><a id="link1" href="home.php" title="Home">| Home |</td>
		<td><a id="link1" href="sell.php" title="Sell an Item">| Sell |</td>
		<td><a id="link1" href="items.php" title="Buy an Item">| Buy |</td>
		<?php
		$id=$_SESSION['id'];		
		echo "<td><a id=\"link1\" href=\"trans.php?cid=$id\" title=\"View ur Transaction\">| My Transactions |</a></td>";?>
		<td><a id="link1" href="editprof.php?chpas=1" title="Edit Your Profile ">| Edit Profile |</td>
		<td><a id="link1" href="logout.php" title="End Ur Session">| Logout |</td></tr>
	</table>
</div>
</div>
<div id="mainbody">
	<div id="mainform">
	<?php
	include("connect.php");
	$chpas=$_GET['chpas'];
	$err=$_GET['err'];
	$usr=$_SESSION['id'];
	$result=pg_query($dbconn, "select * from e_customer where c_id='$usr' ");
	$row=pg_fetch_array($result);
	echo "<table border=\"0\" align=\"centre\">";
	if($chpas==2)
		echo "<form action=\"reg.php?act=2\" method=\"post\">";
	else
		echo "<form action=\"reg.php?act=1\" method=\"post\">";
	echo "<tr><td><h2>Edit Profile</h2></td></tr>";
	if($err==1)
		echo "<tr><td><h4>Invalid Current Password</h4></td></tr>";
	if($err==2)
		echo "<tr><td><h4>Passwords Dont match</h4></td></tr>";
	if($err==3)
		echo "<tr><td><h4>Update Successful</h4></td></tr>";
	echo "<tr><td>Name</td><td><input type=\"text\" name=\"fullname\" value=\"$row[0]\" /></td></tr>";
	if($chpas==2)
	{
		echo "<tr><td>Current Password</td><td><input type=\"password\" name=\"password0\" /></td></tr>";
		echo "<tr><td>Password</td><td><input type=\"password\" name=\"password1\" /></td></tr>";
		echo "<tr><td>Confirm Password</td><td><input type=\"password\" name=\"password2\" /></td></tr>";
	}
	echo "<tr><td>Address</td><td><input type=\"text\" name=\"address\" value=\"$row[3]\" /></td></tr>";
	echo "<tr><td>Email</td><td><input type=\"text\" name=\"mail\" value=\"$row[4]\" /></td></tr>";
	echo "<tr><td>Phone</td><td><input type=\"text\" name=\"phone\" value=\"$row[5]\" /></td></tr>";
	echo "<tr><td><input type=\"submit\" value=\"Update\"/></td></tr>";
	echo "</form>";
	if($chpas==2)
		echo "<tr><td><p title=\"Dont Change Ur Password\"><a id=\"link1\" href=\"editprof.php?chpas=1\">Dont Change Password</a></p></td></tr>";
	else
		echo "<tr><td><p title=\"Change Ur Password\"><a id=\"link1\" href=\"editprof.php?chpas=2\">Change Password</a></p></td></tr>";		
	echo "</table>";
	?>
	</div>
	
</div>
</body>
</html>
