	</div>
	<div class="medium-3 large-3 column show-for-medium-up">
		<h5>Navigation</h5>
		<ul class="side-nav">
			<li><a href="leagues.php">Leagues</a></li>
			<li><a href="rules.php">Rules</a></li>
			<li><a href="faq.php">FAQ</a></li>
			<li><a href="about.php">About</a></li>
			<li><a href="contact.php">Contact</a></li>
			<li class="divider"></li>
		</ul>
		<?php if (!user_is_logged_in()): ?>
			<a href="user.php?method=register" class="button tiny small-6">Sign Up!</a>
		<?php endif; ?>
	</div>
	<script type="text/javascript" src="<?php echo ASSETS_PATH; ?>js/vendor/jquery.js"></script>
	<script type="text/javascript" src="<?php echo ASSETS_PATH; ?>js/foundation.min.js"></script>

	<!-- menu -->
	<!-- <script src="//cdn.pwfantasy.com/js/menu.js"></script> -->
	<script type="text/javascript">
		$(document).foundation();
	</script>
	</body>
</html>
<?php

ob_flush();
$mysqli->close();