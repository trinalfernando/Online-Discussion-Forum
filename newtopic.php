<?php
	include ('layout_manager.php');
	include ('content_function.php');
	include ('dbconn.php');

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
			<p>A Forum For Collaborative Teaching and Learning</p>
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

		<div class="content">
			<?php
				if (isset($_SESSION['username'])) {
					echo "<form action='/forum/addnewtopic.php?cid=".$_GET['cid']."&scid=".$_GET['scid']."'
						  method='POST'>
						  <p>Title: </p>
						  <input type='text' id='topic' name='topic' size='100' />
						  <p>Content: </p>
						  <textarea id='content' name='content'></textarea><br />
						  <input type='submit' value='Add New Post' /></form>";
				} else {
					echo "<p>Please login first or <a href='/forum/register.html'><strong>Click here</strong></a> to register.</p>";
				}
			?>
		</div>
	</div>
</body>
</html>
