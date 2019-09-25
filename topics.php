<?php
	include ('layout_manager.php');
	include ('content_function.php');
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
							echo "<h1 style='color: green;'>new user registered successfully!</h1>";
						} else if ($_GET['status'] == 'login-fail') {
							echo "<h1 style='color: red;'>invalid username and/or password!</h1>";
						}
					}
					loginform();
				}
			?>
		</div>
		<?php
			if (isset($_SESSION['username'])) {
				echo "<div class='content'><p><a href='/forum/newtopic.php?cid=".$_GET['cid']."&scid=".$_GET['scid']."'>
					  Add new topic</a></p></div>";
			}
		?>
		<div class="content">
			<?php disptopics($_GET['cid'], $_GET['scid']); ?>
		</div>
	</div>
</body>
</html>
