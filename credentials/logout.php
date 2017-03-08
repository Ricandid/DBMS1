<?php 

	session_start();
	unset($_SESSION['username']);

	echo <<<EOD
	<body style = "font-family: ARIAL, sans-serif;">
	<h2>Goodbye</h2>
	<p>You logged out.</p>
	<p><a href="login.php">Login Page</a></p>
	</body>
EOD;
?>