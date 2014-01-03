<?php

if (!empty($_POST)) {
	if (isset($_POST['username']) && isset($_POST['password']) && isset($_POST['confirmation']) && isset($_POST['email']) 
	&& ($_POST['password'] == $_POST['confirmation'])
	&& filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)
	&& strlen($_POST['username']) > 3
	&& strlen($_POST['password'])> 4) {
		if (user_doesnt_exist($_POST['username'], $_POST['email'])) {
			$user = (object)array(
				'username' => $_POST['username'], 
				'password' => $_POST['password'], 
				'email' => $_POST['email'], 
				'registerDate' => date(MYSQL_DATETIME, time()),
				'displayName' => $_POST['username'],
				'avatar' => 'http://www.gravatar.com/avatar/'. md5(strtolower(trim($_POST['email']))) .'.jpg?s=45&d=mm'
			);

			$user->userId = user_register($user);
			user_remember($user);
			$user->notifications = 1;

			$_SESSION['user'] = $user;
			$_SESSION['new_user'] = $_SESSION['display_welcome'] = true;
			header('Location: /');
		} else {
			echo '<div class="alert-box alert radius">The Username or Email provided already exists. If you\'ve forgotten your user credentials, please use <a href="?method=forgotpass">Forgot Password</a></div>';
		}
	} else {
		echo '<div class="alert-box alert radius">Please double check the information provided below.</div>';
	}
}
?>

<h1>User Registration</h1>
<div class="content panel">
	<form method="POST" action="?method=<?php echo $method; ?>">
		<div class="row">
			<div class="small-12 medium-8 column">
				<div class="small-12">
					<label>Username <small>(At least 4 characters; no spaces)</small></label>
					<input type="text" name="username" value="<?php echo @$_POST['username']; ?>" required />
				</div>
				<div class="small-12">
					<label>Password <small>(At least 5 characters)</small></label>
					<input type="password" name="password" required />
				</div>
				<div class="small-12">
					<label>Confirm Password</label>
					<input type="password" data-equalto="password" name="confirmation" required />
				</div>
				<div class="small-12">
					<label>E-mail Address</label>
					<input type="email" name="email" value="<?php echo @$_POST['email']; ?>" required />
				</div>
				<div class="small-12">
					<input type="submit" class="button right tiny" value="Sign up!" />
				</div>
			</div>
			<div class="medium-4 show-for-medium-up column">
				<h4>Go Pro!</h4>
				<p>
					Sign up for Pro Membership today ($5.00/month) and recieve the following: 
					<ul>
						<li>Join Unlimited Leagues</li>
						<li>Exclusive Features</li>
						<li>League History</li>
						<li>Bonus Points</li>
						<li><a href="#">Read More!</a></li>
					</ul>
					<a href="?method=gopro" class="right button alert tiny">Go Pro!</a>
				</p>
			</div>
		</div>
	</form>
</div>