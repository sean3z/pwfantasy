<?php

if (!empty($_POST)) {
	if (isset($_POST['username']) && isset($_POST['password']) && user_login($_POST['username'], $_POST['password'])) {
		if (isset($_POST['remember'])) user_remember($user);
		$destination = (isset($_GET['destination'])) ? $_GET['destination'] : 'leagues.php?method=myleagues';
		header('Location: '. $destination);
	} else {
		echo '<div class="alert-box alert radius">Incorrect username or password. If you\'ve forgotten your user credentials, please use <a href="?method=forgotpass">Forgot Password</a></div>';
	}
}

?>

<div id="fb-root"></div>
<h1>Login</h1>
<div class="content panel">
	<form method="POST" action="?method=<?php echo $method; ?>">
		<div class="row">
			<div class="small-12 medium-8 column" style='padding-right: 10px; border-right: 1px solid #a8a8a8;'>
				<div class="small-12">
					<label>Username <small>(or Email Address)</small></label>
					<input type="text" name="username" value="<?php echo @$_POST['username']; ?>" required />
				</div>
				<div class="small-12">
					<label>Password</label>
					<input type="password" name="password" required />
				</div>
				<div class="row">
					<div class="show-for-medium-up medium-4 column">
						<input type="checkbox" name="remember" checked />&nbsp;<small>Remember&nbsp;Me</small>
					</div>
					<div class="small-12 medium-8 column">
						<div class="right">
							<a href="?method=forgotpass" class="button tiny">Forgot Password</a>&nbsp;
							<input type="submit" class="button tiny" value="Sign in" />
						</div>
					</div>
				</div>
			</div>
			<div class="show-for-medium-up medium-4 column">
				<h6>External Services</h6>
				<script>(function(d, s, id) {
				var js, fjs = d.getElementsByTagName(s)[0];
				if (d.getElementById(id)) return;
				js = d.createElement(s); js.id = id;
				js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=206268974871";
				fjs.parentNode.insertBefore(js, fjs);
				}(document, 'script', 'facebook-jssdk'));</script>
				<div class="fb-login-button" data-width="201" data-height="24" data-max-rows="1" data-show-faces="false">Sign in with Facebook</div>
				<div style="margin-top: 5px;">
					<img src="https://dev.twitter.com/sites/default/files/images_documentation/sign-in-with-twitter-gray.png" />
				</div>
			</div>
		</div>
	</form>
</div>