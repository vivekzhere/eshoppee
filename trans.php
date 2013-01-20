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
echo "<div id=\"itemsform\">";
	include("connect.php");
	$cid=$_GET['cid'];
	$id=$_SESSION['id'];
	if($cid!=$id)
	{
		$result=pg_query($dbconn,"select * from e_customer where c_id='$cid';");
		$row=pg_fetch_row($result);
		echo "<table border=\"0\" align=\"centre\">";
		echo "<tr><td>PROFILE</td></tr>";
		echo "</table>";
		echo "<table border=\"5\" align=\"centre\">";
			echo "<tr><td>Name</td><td> $row[0]</td></tr>";
			echo "<tr><td>Username</td><td> $row[1]</td></tr>";
			echo "<tr><td>Shipping Address</td><td> $row[3]</td></tr>";
			echo "<tr><td>Email Address</td><td> $row[4]</td></tr>";
			echo "<tr><td>Phone No</td><td> $row[5]</td></tr>";
			echo "<tr><td>Transaction Points</td><td> $row[6]</td></tr>";
		echo "</table>";
	}
	else
	{
		$result=pg_query($dbconn,"select a.o_id,a.p_id,a.s_id,b.no,b.t_amt,a.date,c.p_name from e_order a,e_orderdetail b,e_products c where a.o_id=b.o_id and a.b_id='$cid' and a.p_id=c.p_id order by a.o_id;");
		echo "<table border=\"0\" align=\"centre\">";
		echo "<tr><td>BUY HISTORY</td></tr>";
		echo "</table>";
		echo "<table border=\"5\" align=\"centre\">";
			echo "<tr><th>Order Id</th><th>Product</th><th>Seller Id</th><th>Units Purchased</th><th>Total Amount</th><th>Date</th></tr>";
			while($row=pg_fetch_row($result))
				echo "<tr><td>$row[0]</td><td>$row[6]</td><td><a id=\"link2\" href=\"trans.php?cid=$row[2]\" title=\"View Profile\">$row[2]</a></td><td>$row[3]</td><td>$row[4]</td><td>$row[5]</td></tr>";
		echo "</table>";
	}
	
	echo "<br/><br/>";
	$result=pg_query($dbconn,"select a.o_id,a.p_id,a.b_id,b.no,b.t_amt,a.date,c.p_name from e_order a,e_orderdetail b,e_products c where a.o_id=b.o_id and a.s_id='$cid' and a.p_id=c.p_id order by a.o_id;");
	echo "<table border=\"0\" align=\"centre\">";
	echo "<tr><td>SELL HISTORY</td></tr>";
	echo "</table>";
	echo "<table border=\"5\" align=\"centre\">";
		echo "<tr><th>Order Id</th><th>Product</th><th>Buyer Id</th><th>Units Purchased</th><th>Total Amount</th><th>Date</th></tr>";
		while($row=pg_fetch_row($result))
			echo "<tr><td>$row[0]</td><td>$row[6]</td><td><a id=\"link2\" href=\"trans.php?cid=$row[2]\" title=\"View Profile\">$row[2]</a></td><td>$row[3]</td><td>$row[4]</td><td>$row[5]</td></tr>";
	echo "</table>";
	
	echo "<br/><br/>";
	echo "<table border=\"0\" align=\"centre\">";
	echo "<tr><td>FOR SALE</td></tr>";
	echo "</table>";
	$result=pg_query($dbconn,"select p_id,p_name,u_price,name,p.descrip from e_products p,e_category c where p.s_id='$cid' and p.n_units>0 and p.cat_id=c.cat_id order by p.p_id;");
	echo "<table border=\"2px\" align=\"justify\" border-collapse=\"collapse\">
		<tr><th>Id</th><th>Name</th><th>Category</th><th>Price</th><th>Description</th></tr>";
	while($row=pg_fetch_row($result))
		echo "<tr><td>$row[0]</td><td><a id=\"link2\" href=\"order.php?pid=$row[0]\">$row[1]</a></td><td>$row[3]</td><td>$row[2]</td><td>$row[4]</td></tr>";	
	echo "</table>";	
echo "</div>";
?>


</div>
</body>
</html>
