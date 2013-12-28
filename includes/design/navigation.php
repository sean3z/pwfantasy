<nav class="top-bar" data-topbar>
	<ul class="title-area">
		<li class="name">
			<h1><a href="http://pwfantasy.com"><img src="<?php echo ASSETS_PATH; ?>img/pwfantasylogo.png" style="margin-top: -2px; margin-right: 10px;">PWFantasy</a></h1>
		</li>
	</ul>

	<section class="top-bar-section">
		<!-- Right Nav Section -->
		<ul class="right">
			<?php if (user_is_logged_in()): ?>
				<?php if ($user->notifications > 0): ?>
					<li><a href="user.php?method=notifications" class="button radius alert"><?php echo $user->notifications; ?></a></li>
				<?php endif; ?>
				<li class="has-dropdown">
					<a href="profile.php?userId=<?php echo $user->userId; ?>"><?php echo $user->displayName; ?></a>
					<ul class="dropdown">
						<li><a href="leagues.php?method=myleagues">My Leagues</a></li>
						<li><a href="profile.php?userId=<?php echo $user->userId; ?>">Profile</a></li>
						<li><a href="user.php?method=settings">Settings</a></li>
						<li class="divider"></li>
						<li><a href="user.php?method=logout">Logout</a></li>
					</ul>
				</li>
				<li><img src="<?php echo $user->avatar; ?>" width="45" height="45" alt=""></li>
			<?php else: ?>
				<li><a href="user.php?method=login">Login</a></li>
				<li class="divider"></li>
				<li><a href="user.php?method=register">Register</a></li>
			<?php endif; ?>

		</ul>

		<!-- Left Nav Section -->
<!-- 		<ul class="left">
			<li><a href="#">Left Nav Button</a></li>
		</ul> -->
	</section>
</nav>