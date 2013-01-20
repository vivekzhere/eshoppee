<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css"/>
<!--<STYLE TYPE="text/css">
.tealtable, .tealtable TD, .tealtable TH
{
background-color:#DC143C;
color:white;
}
</STYLE>-->
<title>e-MART</title>
</head>
<body style="background-image:url(images/body.jpg)" TEXT="#58350D" LINK="#f7f7c0" ALINK="#F5F5DC" VLINK="#f7f7c0">
<div id="header">

</div>
<div id="mainbody">
<div id="mainlogin">
	<table border="0" align="centre">
		<form action="reg.php" method="post">
		<tr><td>Name</td><td><input type="text" name="fullname" /></td></tr>
		<tr><td>Username</td><td><input type="text" name="username" /></td></tr>
		<tr><td>Password</td><td><input type="password" name="password1" /></td></tr>
		<tr><td>Confirm Password</td><td><input type="password" name="password2" /></td></tr>
		<tr><td>Address</td><td><input type="text" name="address" /></td></tr>
		<tr><td>Email</td><td><input type="text" name="mail" /></td></tr>
		<tr><td>Phone</td><td><input type="text" name="phone" /></td></tr>
		<tr><td><input type="submit" value="Register"/></td></tr>
		</form>
		<tr><td><br /></td></tr>
		<tr><td><?php 
		$status=$_GET['status'];
		if($status==1)
		{
		
			echo "<table border=\"5\" align=\"right\" class=\"tealtable\">";
			echo "<tr><td></td><td><b><font color=\"#f7f7c0\">REGISTRATION COMPLETED...</b></td></tr>";
			echo "</table>";
		}	

		if($status==2)
			echo "Passwords donot match";
		if($status==3)
			echo "Username not available";			
		?></td></tr>
		<tr><td><br /></td></tr>
		<tr><td><p title="Back To Login Page"><a id="link2" href="login.php">Back To Login</a></p></td></tr>
	</table>
</div>

</div>
</body>
</html>
