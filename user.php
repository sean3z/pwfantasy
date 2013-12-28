<?php 
include 'includes/design/header.php';
$method = (isset($_GET['method']) && !empty($_GET['method'])) ? $_GET['method'] : 'register';

if (!empty($_POST)) {
	switch($method) {
		case 'login':
			if (isset($_POST['username']) && isset($_POST['password']) && user_login($_POST['username'], $_POST['password'])) {
				if (isset($_POST['remember'])) user_remember($user);
				$destination = (isset($_GET['destination'])) ? $_GET['destination'] : 'leagues.php?method=myleagues';
				header('Location: '. $destination);
			} else {
				echo '<div class="alert-box alert radius">Incorrect username or password. If you\'ve forgotten your user credentials, please use <a href="?method=forgotpass">Forgot Password</a></div>';
			}
		break;

		case 'register':
			if (isset($_POST['username']) && isset($_POST['password']) && isset($_POST['confirmation']) && isset($_POST['email']) 
			&& ($_POST['password'] == $_POST['confirmation'])
			&& filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)
			&& strlen($_POST['username']) > 3
			&& strlen($_POST['password'] )> 4) {
				if (user_doesnt_exist($_POST['username'], $_POST['email'])) {
					$user = (object)array(
						'username' => $_POST['username'], 
						'password' => $_POST['password'], 
						'email' => $_POST['email'], 
						'registerDate' => date('Y-m-d H:i:s', time()),
						'displayName' => $_POST['username'],
						'avatar' => 'http://www.gravatar.com/avatar/'. md5(strtolower(trim($_POST['email']))) .'.jpg?s=45&d=mm'
					);

					$user->userId = UserApplication::register($user);
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
		break;
	}
}
?>

<?php if ($method == 'login'): ?>
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
<?php elseif ($method == 'register'): ?>
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
							<li>Join Unlimtied Leagues</li>
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
<?php elseif ($method == 'logout'): ?>
	<?php user_logout($user); header('Location: /'); ?>
<?php elseif ($method == 'forgotpass'): ?>
	<h1>Forgot Password</h1>
	<div class="content panel">
	</div>
<?php elseif ($method == 'settings'): ?>
	<h1>User Settings</h1>
	<div class="content panel">
		Under Construction
	</div>
<?php endif; ?>

<?php include 'includes/design/footer.php'; ?>