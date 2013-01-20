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
	include("connect.php");
	$id=$_SESSION['id'];
	$srch=$_GET['srch'];
	$cat=$_POST['cat'];
	$pricefrm=$_POST['pricefrm'];
	$priceto=$_POST['priceto'];
	$unitsfrm=$_POST['unitsfrm'];
	$unitsto=$_POST['unitsto'];
	echo "<div id=\"searchbar\">";
	echo "<table border=\"0\" align=\"centre\">";
		echo "<form action=\"items.php?srch=1\" method=\"post\">";
		echo "<tr><td>Category :</td><td>";
		echo "<select name=\"cat\">";
			echo "<option value=\"0\">Any Category</option>";
			$result=pg_query($dbconn,"select * from e_category;");
			while($row=pg_fetch_row($result))
			{
				if($srch==1&&$cat==$row[0])
					echo "<option value=\"$row[0]\" title=\"$row[1]\" selected=\"selected\">$row[2]</option>";
				else
					echo "<option value=\"$row[0]\" title=\"$row[1]\">$row[2]</option>";
			}
			echo "</select></td><td> </td><td> </td><td> </td></tr>";

		echo "<tr><td>Price Range : From</td><td><input type=\"text\" name=\"pricefrm\" value=\"$pricefrm\"/></td>";
		echo "<td>To</td><td><input type=\"text\" name=\"priceto\" value=\"$priceto\"/></td><td> </td><td> </td><td> </td></tr>";
		echo "<tr><td>No. of Units : From</td><td><input type=\"text\" name=\"unitsfrm\" value=\"$unitsfrm\"/></td>";
		echo "<td>To</td><td><input type=\"text\" name=\"unitsto\" value=\"$unitsto\"/></td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td>";

		/*echo "<td>Price :</td><td>";
		echo "<select name=\"price\">";
			echo "<option value=\"0\">&#062;0</option>";
			echo "<option value=\"1\">&#060;100</option>";
			echo "<option value=\"2\">100-200</option>";
			echo "<option value=\"2\">&#062;200</option>";			
		echo "</select></td><td> </td><td> </td><td> </td>";
		echo "<td>Available Units :</td><td>";
		echo "<select name=\"units\">";
			echo "<option value=\"0\">&#062;0</option>";
			echo "<option value=\"1\">&#060;10</option>";
			echo "<option value=\"2\">10-20</option>";
			echo "<option value=\"2\">&#062;20</option>";			
		echo "</select></td><td> </td><td> </td><td> </td>";*/
		
		echo "<td> <input type=\"submit\" name=\"accept\" value=\"Search\"/> </td></tr>";
		echo "</form>";
	echo "</table>";
	echo "</div>";	
	
	if($srch==1)
	{
		if($pricefrm=="")
		{
			$result=pg_query($dbconn,"select min(u_price) from e_products;");
			$row=pg_fetch_row($result);
			$pricefrm=$row[0];
		}
		if($priceto=="")
		{
			$result=pg_query($dbconn,"select max(u_price) from e_products;");
			$row=pg_fetch_row($result);
			$priceto=$row[0];
		}
		if($unitsfrm=="")
		{
			$result=pg_query($dbconn,"select min(n_units) from e_products;");
			$row=pg_fetch_row($result);
			$unitsfrm=$row[0];					
		}
		if($unitsto=="")
		{
			$result=pg_query($dbconn,"select max(n_units) from e_products;");
			$row=pg_fetch_row($result);
			$unitsto=$row[0];
		}
		if($unitsfrm==0)
				$unitsfrm=1;
		if($cat=="0")
			$result=pg_query($dbconn,"select p_id,p_name,u_price,name,p.descrip from e_products p,e_category c where u_price between '$pricefrm' and '$priceto' and n_units>0 and n_units between '$unitsfrm' and '$unitsto' and p.cat_id=c.cat_id order by p.p_id;");
		else
			$result=pg_query($dbconn,"select p_id,p_name,u_price,name,p.descrip from e_products p,e_category c where p.cat_id='$cat' and u_price between '$pricefrm' and '$priceto' and n_units>0 and  n_units between '$unitsfrm' and '$unitsto' and p.cat_id=c.cat_id;");
		echo "<div id=\"searchcontent\">
		<table border=\"2px\" align=\"justify\" border-collapse=\"collapse\">
		<tr><th width=\"10%\">Id</th>
		<th width=\"20%\">Name</th>
		<th width=\"20%\">Category</th>
		<th width=\"10%\">Price</th>
		<th width=\"40%\">Description</th></tr>";
		while($row=pg_fetch_row($result))
			echo "<tr><td>$row[0]</td><td><a id=\"link2\" href=\"order.php?pid=$row[0]\">$row[1]</a></td><td>$row[3]</td><td>$row[2]</td><td>$row[4]</td></tr>";	
		echo "</table>
		</div>";
	}
	?>
</div>
</body>
</html>
