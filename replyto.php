<?php
	include ('layout_manager.php');
	include ('content_function.php');
	addview($_GET['cid'], $_GET['scid'], $_GET['tid']);
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
<link href="/forum/css/main.css" type="text/css" rel="stylesheet" />
<body>
	<div class="pane">
		<div class="header"><h1><a href="/forum">SLTC DailyForum</a></h1></div>
		<div class="forumdesc">
			<p>A Forum For Collaborative Teaching and Learning</ br></p>
			<?php
				if (!isset($_SESSION['username'])) {
					echo "<p>Please login first or <a href='/forum/register.html'><strong>Click here</strong></a> to register.</p>";
				}
			?>
		</div>
		<div class="loginpane">
			<?php
				session_start();
				if (isset($_SESSION['username'])) {
					logout();
				} else {
					if (isset($_GET['status'])) {
						if ($_GET['status'] == 'reg-success') {
							echo "<h1 style='color: green;'>New User Registered Successfully!</h1>";
						} else if ($_GET['status'] == 'login-fail') {
							echo "<h1 style='color: red;'>Invalid Username and/or Password!</h1>";
						}
					}
					loginform();
				}
			?>
		</div>
		<?php
			if (isset($_SESSION['username'])) {
				replytopost($_GET['cid'], $_GET['scid'], $_GET['tid']);
			}
		?>
		<div class="content">
			<?php disptopic($_GET['cid'], $_GET['scid'], $_GET['tid']);
			/* to display all replies*/
			?>
		</div>
	</div>
</body>
</html>
