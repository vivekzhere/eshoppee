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
	$_SESSION['ordno']=1;
	echo "<div id=\"itemsform\">";
		include("connect.php");
		$pid=$_GET['pid'];
		$id=$_SESSION['id'];
		$result=pg_query($dbconn,"select tr_point,rate,disc_id from e_customer c, e_discount d where c.tr_point between d.point_low and d.point_high and c.c_id='$id';");
		$row=pg_fetch_row($result);
		$rt=(100-$row[1])/100;
		$discid=$row[2];
		$result=pg_query($dbconn,"select * from e_products where p_id='$pid';");
		$row=pg_fetch_row($result);
		$amt=$rt*$row[5];
		/*echo "<table border=\"0\" align=\"centre\">";
		echo "<tr><td>Welcome"."!!! ".$_SESSION['id']."</td></tr>";
		echo "</table>";*/
		echo "<table border=\"5\" align=\"centre\">";
			echo "<tr><td>Id</td><td> $row[0]</td></tr>";
			echo "<tr><td>Name</td><td> $row[1]</td></tr>";
			echo "<tr><td>Description</td><td> $row[3]</td></tr>";
			echo "<tr><td>Unit Price</td><td> $row[5]</td></tr>";
			echo "<tr><td>Price After Discount</td><td> $amt</td></tr>";
			echo "<tr><td>Units Available</td><td> $row[6]</td></tr>";
			echo "<tr><td>Seller</td><td><a id=\"link2\" href=\"trans.php?cid=$row[7]\" title=\"View Profile\">$row[7]</a></td></tr>";
		echo "</table>";
		if($row[7]!=$id)
		{
		echo "<table border=\"0\" align=\"centre\">";
		echo "<form action=\"buy.php?prdt=$pid&mrp=$amt&disid=$discid\" method=\"post\">";
			echo "<tr><td>No. Of Units :</td><td>";
			echo "<select name=\"nofu\">";
			$i=0;
			while($i++<$row[6])
				echo "<option value=\"$i\" title=\"$i\">$i</option>";
			echo "</select></td></tr>";
			echo "<tr><td>Payment Mode :</td><td>";
			echo "<select name=\"paym\">";
			$result=pg_query($dbconn,"select * from e_payment;");
			while($row=pg_fetch_row($result))
				echo "<option value=\"$row[0]\" title=\"$row[1]\">$row[1]</option>";
			echo "</select></td></tr>";
			echo "<tr><td>Shipping Company :</td><td>";
			echo "<select name=\"ship\">";
			$result=pg_query($dbconn,"select * from e_shipping;");
			while($row=pg_fetch_row($result))
				echo "<option value=\"$row[1]\" title=\"$row[2]\">$row[0]</option>";
			echo "</select></td></tr><tr><td></br></td></tr><tr><td></td></tr><tr><td> </td></tr>";
		echo "<tr><td><input type=\"submit\" name=\"accept\" value=\"Place Order\"/> </td></tr>";
		echo "</table>";
		}
	echo "</div>";
	?>
</div>
</body>
</html>
