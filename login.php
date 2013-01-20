<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css"/>
<title>e-MART</title>
</head>
<body style="background-image:url(images/body.jpg)" TEXT="#58350D" LINK="#f7f7c0" ALINK="#F5F5DC" VLINK="#f7f7c0">
<div id="header">

</div>
<div id="mainbody">
<div id="mainlogin">
<?php
	$log=$_GET['logcheck'];
	if($log==1)
		echo "Invalid Username or Password";
?>
	<table border="0" align="centre">
		<form action="logcheck.php" method="post">
		<tr><td>Username</td><td><input type="text" name="username" /></td></tr>
		<tr><td>Password</td><td><input type="password" name="password" /></td></tr>
		<tr><td><input type="submit" value="Login"/></td></tr>
		</form>
		<tr><td><a title="New Registration" id="link2" href="register.php">New User? Sign up here.</a></td></tr>
		<tr><td><br/></td></tr><tr><td><br/></td></tr><tr><td><br/></td></tr><tr><td><br/></td></tr><tr><td><br/></td></tr><tr><td><br/></td></tr>
		<tr><td><br/></td></tr><tr><td><br/></td></tr><tr><td><br/></td></tr><tr><td><br/></td></tr><tr><td><br/></td></tr><tr><td><br/></td></tr>
		<tr><td><br/></td></tr><tr><td><br/></td></tr><tr><td><br/></td></tr><tr><td><br/></td></tr>
	</table>
		<table border="0" align="center">
		<tr><td><a id="link2" href="about.php" title="About Site Team">About</a></td>
	</table>
</div>
	<div id="linehr">
	<hr width=100% size="2px" color="#58350D">
	</div>
</div>
</body>
</html>
