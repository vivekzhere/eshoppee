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
<style type="text/css">
</style>
<body style="background-image:url(images/body.jpg)" TEXT="#58350D" LINK="#f7f7c0" ALINK="#F5F5DC" VLINK="#f7f7c0">
<div id="header">
<div id="linkbar">
	<table border="0" align="right">
		<tr><td><a id="link1" href="home.php" title="Home">| Home |</a></td>
		<td><a id="link1" href="sell.php" title="Sell an Item">| Sell |</a></td>
		<td><a id="link1" href="items.php" title="Buy an Item">| Buy |</a></td>
		<?php
		$id=$_SESSION['id'];		
		echo "<td><a id=\"link1\" href=\"trans.php?cid=$id\" title=\"View ur Transaction\">| My Transactions |</a></td>";?>
		<td><a id="link1" href="editprof.php?chpas=1" title="Edit Your Profile ">| Edit Profile |</a></td>
		<td><a id="link1" href="logout.php" title="End Ur Session">| Logout |</a></td></tr>
	</table>
</div>
</div>
<div id="mainbody">
<?php
echo "<div id=\"homeform\">";
include("connect.php");
$id=$_SESSION['id'];
$result=pg_query($dbconn,"select * from e_customer where c_id='$id';");
$row=pg_fetch_row($result);
echo "<table border=\"0\" align=\"centre\">";
echo "<tr><td>Welcome"."!!! ".$_SESSION['id']."</td></tr>";
echo "</table>";
echo "<table border=\"5\" align=\"centre\">";
        echo "<tr><td>Name</td><td>: $row[0]</td></tr>";
	echo "<tr><td>Shipping Address</td><td>: $row[3]</td></tr>";
	echo "<tr><td>Email Address</td><td>: $row[4]</td></tr>";
	echo "<tr><td>Phone No</td><td>: $row[5]</td></tr>";
	echo "<tr><td>Transaction Points</td><td>: $row[6]</td></tr>";
	echo "</table>";
echo "</div>";
?>

</div>
</body>
</html>
