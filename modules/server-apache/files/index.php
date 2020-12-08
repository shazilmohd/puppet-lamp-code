<?php
//include auth.php file on all secure pages
include("auth.php");
?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Welcome Home</title>
<link rel="stylesheet" href="./style.css" type="text/css" />
</head>
<body>
<div class="logo-wrap">
	<img src="./QBlogo.svg" alt=""/>
</div>
<div class="form">
<p>Welcome <?php echo $_SESSION['username']; ?>!</p>
<p>This is secure area.</p>
<a href="logout.php">Logout</a>
</div>
</body>
</html>
