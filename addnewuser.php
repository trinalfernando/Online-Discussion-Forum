<?php
	include ('dbconn.php');

	$newuser = $_POST['usernameinput'];
	$newpwd = $_POST['passwordinput'];
	$newmail = $_POST['emailinput'];
	$newpwd = md5($newpwd);


	$insert = mysqli_query($con, "INSERT INTO users (`username`, `password`,`email`) VALUES ('".$newuser."', '".$newpwd."', '".$newmail."');");



	if ($insert) {
		header("Location: /forum/index.php?status=reg_success");
	}
	else{
		echo'registeration failed';
	}



?>
