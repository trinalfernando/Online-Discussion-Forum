<?php
	function loginform() {
		echo "<form action='/forum/validatelogin.php' method='POST'>
			  <p>Username (Registration Number):</p>
			  <input type='text' id='usernameinput' name='usernameinput' required/>
				<p>Password:</p>
				<input type='password' id='passwordinput' name='passwordinput' required/>
				<input type='submit' value='Login' />
				<button type='button' onclick='location.href=\"/forum/register.html\";'>Click here to sign up</button>
			</form>";
	}

	function logout() {
		echo nl2br("<p>Welcome ".$_SESSION['username']."!\nLooking good today!</p>
				<form action='/forum/logout.php' method='GET'>
				<input type='submit' value='Log Out' /></form>");
	}
?>
