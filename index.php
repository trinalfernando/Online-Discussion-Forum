<?php
	include ('layout_manager.php');
	include ('content_function.php');
	include ('mobilever.php');
?>
<html>
<head><title>SLTC | DailyForum</title></head>
<style media="screen">
	html{
		background: url('img/sltclog.jpg') no-repeat center center fixed;
		-webkit-background-size: cover;
		-moz-background-size:cover;
		-o-background-size: cover;
		background-size: cover;
	}
</style>
<link href="css/main.css" type="text/css" rel="stylesheet" />
<body>
	<div class="pane">
		<div class="header"><h1><a href="/forum"><strong>SLTC DailyForum</strong></a></h1></div>
		<div class="forumdesc">
					<p><strong>A Collaborative Platform for Teaching and Learning</strong></p>
		</div>
		<div class="loginpane">
			<?php
					session_start();
					if (isset($_SESSION['username'])) {
						logout();
					} else {
						if (isset($_GET['status'])) {
							if ($_GET['status'] == 'reg_success') {
								echo "<h3 style='color: green;'>New user registered successfully!</h3>";
							} else if ($_GET['status'] == 'login_fail') {
								echo "<h3 style='color: red;'>Invalid username and/or password!</h3>";
							}
						}
						loginform();
					}
			?>
		</div>
		<div class="content">
						<?php dispcategories(); ?>
		</div>
	</div>
</body>
</html>
