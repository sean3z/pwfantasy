<?php

session_start();

$user = new stdClass();

if (isset($_SESSION['user'])) $user = $_SESSION['user'];
else if (isset($_COOKIE['remember'])) remember_user($user);

// printf('<pre>%s</pre>', print_r($user, 1));

function user_is_logged_in() {
	return isset($_SESSION['user']);
}

function user_login($username, $password) {
	global $user;
	$query = sprintf('SELECT * FROM users WHERE (username = "%s" or email = "%1$s") and password = "%s"', db_escape_string($username), db_escape_string($password));
	$query = db_query($query)->fetch_object();
	// printf('<pre>%s</pre>', print_r($query,1));
	if (isset($query->userId)) {
		$user = $_SESSION['user'] = $query;
		build_user($user);
		return true;
	}
 	return false;
}

function build_user(&$user) {
	$user->notifications = 0;
}

function user_logout(&$user) {
	session_destroy();
	db_query('UPDATE users SET session = NULL WHERE userId = %d', $user->userId);
	unset($_SESSION['user'], $user, $_COOKIE['remember']);
	setcookie('remember', null, time() - 3600);
}

function user_remember(&$user) {
	$hash = md5(sha1(time() . rand(1, 500)));
	setcookie('remember', $hash, time() + 31536000, '/');
	$_COOKIE['remember'] = $hash;
	db_query('UPDATE users SET session = "%s" WHERE userId = %d', $hash, $user->userId);
}

function remember_user(&$user) {
	$query = db_query('SELECT * FROM users WHERE session = "%s"', $_COOKIE['remember'])->fetch_object();
	if (isset($query->userId)) {
		$user = $_SESSION['user'] = $query;
		setcookie('remember', $query->session, time() + 31536000, '/');
		build_user($user);
	}
}

function require_login($destination) {
	header('Location: user.php?method=login&destination='. urlencode($destination));
}