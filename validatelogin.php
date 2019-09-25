<?php
	session_start();

	include ('dbconn.php');

	$username = $_POST['usernameinput'];
	$password = $_POST['passwordinput'];
	$password = md5($password);


	$result = mysqli_query($con, "SELECT username, password FROM users WHERE username = '".$username."' AND password = '".$password."'");

	$count = mysqli_num_rows($result);

	if (mysqli_num_rows($result) != 0) {
		// if(empty(trim($_POST["username"]))){
    //     $username_err = "Please enter username.";
		// } else{
		// 	$username = trim($_POST["username"]);
		// }
		//
		// // Check if password is empty
		// if(empty(trim($_POST["password"]))){
		// 	$password_err = "Please enter your password.";
		// } else{
		// 	$password = trim($_POST["password"]);
		// }
		$_SESSION['username'] = $username;
		header("Location: ".$_SERVER['HTTP_REFERER']);
	} else {
			if (substr($_SERVER['HTTP_REFERER'], -1) == '/') {
			header("Location: ".$_SERVER['HTTP_REFERER']."?status=login_fail");
		} else {
			header("Location: ".$_SERVER['HTTP_REFERER']."?status=login_fail");
		}
	}
	//	header("Location: ".$_SERVER['HTTP_REFERER']."?status=login_fail");
				//if (substr($_SERVER['HTTP_REFERER'], -1) == '/') {
				//	header("Location: ".$_SERVER['HTTP_REFERER']."login_fail");
				//} else {
				//	header("Location: ".$_SERVER['HTTP_REFERER']."/login_fail");
				//}
?>
