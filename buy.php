<?php
	session_start();
	if($_SESSION['check']!=1)
		header('Location:login.php');
	if($_SESSION['ordno']!=1)
		header('Location:home.php');
	else
	{
	include("connect.php");
	$nofu=$_POST['nofu'];
	$paym=$_POST['paym'];
	$ship=$_POST['ship'];
	$bid=$_SESSION['id'];
	$prdtid=$_GET['prdt'];
	$disid=$_GET['disid'];
	$mrp=$_GET['mrp'];
	$totamt=$mrp*$nofu;
	$today = getdate();
	$dat=$today['year']."-".$today['mon']."-".$today['mday'];
	$result=pg_query($dbconn,"select * from e_products where p_id='$prdtid';");
	echo pg_last_error($dbconn);
	$row1=pg_fetch_row($result);
	$result=pg_query($dbconn,"select * from e_shipping where ship_id='$ship';");
	echo pg_last_error($dbconn);
	$row2=pg_fetch_row($result);
	$result=pg_query($dbconn,"select * from e_payment where pmt_id='$paym';");
	echo pg_last_error($dbconn);
	$row3=pg_fetch_row($result);
	$result=pg_query($dbconn,"select max(o_id) from e_order;");
	$oid=pg_fetch_row($result);
	if($oid[0]=="")
		$oid[0]='ODR0000';
	$oid[0]++;	
	$result=pg_query($dbconn, "insert into e_order values ('$oid[0]','$prdtid','$paym','$dat','$ship','$row1[7]','$bid','$disid')"); 
	echo pg_last_error($dbconn);
	$result=pg_query($dbconn, "insert into e_orderdetail values ('$oid[0]','$prdtid','$row1[5]','$nofu','$disid','$totamt');"); 
	echo pg_last_error($dbconn);
	$row1[6]=$row1[6]-$nofu;
	$result=pg_query($dbconn, "update e_products set n_units='$row1[6]' where p_id='$prdtid';"); 
	echo pg_last_error($dbconn);
	$result=pg_query($dbconn,"select tr_point from e_customer where c_id='$bid';");
	echo pg_last_error($dbconn);
	$trp=pg_fetch_row($result);
	$trp[0]++;
	$result=pg_query($dbconn, "update e_customer set tr_point='$trp[0]' where c_id='$bid';"); 
	echo pg_last_error($dbconn);
	$result=pg_query($dbconn,"select tr_point from e_customer where c_id='$row1[7]';");
	echo pg_last_error($dbconn);
	$trp=pg_fetch_row($result);
	$trp[0]++;
	$result=pg_query($dbconn, "update e_customer set tr_point='$trp[0]' where c_id='$row1[7]';"); 
	echo pg_last_error($dbconn);
	$_SESSION['ordno']=2;	
	}
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
echo "<table border=\"0\" align=\"centre\">";
	echo "<tr><td></br></td></tr><tr><td><b><font color=\"#DC143C\">ORDER SUCCESSFULLY PLACED...</b></td></tr>
	<tr><td>Product Ordered</td><td>$row1[1]</td></tr>
	<tr><td>Unit Price</td><td>$row1[5]</td></tr>
	<tr><td>Units Ordered</td><td>$nofu</td></tr>
	<tr><td>Price After Discount</td><td>$mrp</td></tr>
	<tr><td>Total Amount</td><td>$totamt</td></tr>
	<tr><td>Paid Using</td><td>$row3[1]</td></tr>
	<tr><td>Shipped By</td><td>$row2[0]</td></tr>
	<tr><td>Contact Shipper</td><td>$row2[2]</td></tr>
	<tr></tr>	";		
echo "</table>";
echo "</div>";
?>
</div>
</body>
</html>


