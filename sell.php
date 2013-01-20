
<?php
session_start();
if($_SESSION['check']!=1)
	header('Location:login.php');
?>
<html>
<head>
<STYLE TYPE="text/css">
.tealtable, .tealtable TD, .tealtable TH
{
background-color:#DC143C;
color:white;
}
</STYLE>
<link rel="stylesheet" type="text/css" href="style.css"/>
<title>e-MART</title>
</head>
<style type="text/css">
</style>
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
	<?php
	include("connect.php");
	$stat=$_GET['stat'];
	$id=$_SESSION['id'];
	echo "<div id=\"searchbar\">";
	echo "<table border=\"0\" align=\"centre\">";
		echo "<form action=\"additem.php\" method=\"post\">";
		echo "<tr><td> Enter Product name </td><td><input type=\"text\" name=\"pdtname\" style=\"width:245px;\"></td></tr>";
		echo "<tr><td>Product Category </td><td>";
		echo "<select name=\"cat\">";
			echo "<option value=\"0\">Any Category</option>";
			$result=pg_query($dbconn,"select * from e_category;");
			while($row=pg_fetch_row($result))
			{
					echo "<option value=\"$row[0]\" title=\"$row[1]\">$row[2]</option>";
			}
			echo "</select></td><td> </td><td> </td><td> </td></tr>";
		echo "<tr><td> Enter Unit Price </td><td><input type=\"text\" name=\"ppu\" style=\"width:245px;\"></td></tr>";
		echo "<tr><td> No. of Units Available </td><td><input type=\"text\" name=\"units\" style=\"width:245px;\"></td></tr>";
		echo "<tr><td>Enter Product Description </td><td><TEXTAREA NAME=\"descrip\" COLS=60 ROWS=6></TEXTAREA></td></tr>";
		echo "<tr><td><br /></td><td></td></tr>";
		echo "<tr><td></td><td> <input type=\"submit\" name=\"accept\" value=\"Place this Item\"/> </td></tr>";
		echo "<tr><td><br/></td></tr>";
		echo "</form>";
		if($stat==1)
		{
			echo "<table border=\"5\" align=\"center\" class=\"tealtable\">";
			echo "<tr><td><b><font color=\"#f7f7c0\">PRODUCT SUCCESSFULLY PLACED...</b></td></tr>";
			echo "</table>";
		}
	echo "</table>";
	echo "</div>";
	?>


</div>
</body>
</html>
