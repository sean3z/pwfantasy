<?php

session_start();

$user = new stdClass();

if (isset($_SESSION['user'])) $user = $_SESSION['user'];
else if (isset($_COOKIE['SESSION'])) remember_user($user);

// printf('<pre>%s</pre>', print_r($user, 1));

function user_is_logged_in() {
	return isset($_SESSION['user']);
}

function user_login($username, $password) {
	global $user;
	$username = UserApplication::sanitize($username);
	$query = sprintf('SELECT userId FROM users WHERE (username = "%s" or email = "%1$s") and password = "%s"', db_escape_string($username), db_escape_string($password));
	$query = db_query($query)->fetch_object();
	// printf('<pre>%s</pre>', print_r($query,1));
	if (isset($query->userId)) {
		$user = $_SESSION['user'] = UserApplication::getUserByUserId($query->userId);
		return true;
	}
 	return false;
}

function user_register($registrant) {
	$registrant->username = UserApplication::sanitize($registrant->username);
	return UserApplication::createUser((array)$registrant);
}

function user_logout(&$user) {
	session_destroy();
	UserApplication::updateUserSession($user->userId, NULL);
	unset($_SESSION['user'], $user, $_COOKIE['SESSION']);
	setcookie('SESSION', NULL, time() - 3600);
}

function user_remember(&$user) {
	$hash = md5(sha1(time() . rand(1, 500)));
	setcookie('SESSION', $hash, time() + 31536000, '/');
	$_COOKIE['SESSION'] = $hash;
	UserApplication::updateUserSession($user->userId, $hash);
}

function remember_user(&$user) {
	$query = db_query('SELECT userId FROM users WHERE session = "%s"', $_COOKIE['SESSION'])->fetch_object();
	if (isset($query->userId)) {
		$user = $_SESSION['user'] = UserApplication::getUserByUserId($query->userId);
		setcookie('SESSION', $query->session, time() + 31536000, '/');
	}
}

function require_login($destination) {
	if (user_is_logged_in()) return true;
	else header('Location: user.php?method=login&destination='. urlencode($destination));
}

function user_doesnt_exist($username, $email) {
	$query = db_query('SELECT userId FROM users WHERE username = "%s" or email = "%s"', UserApplication::sanitize($username), $email)->fetch_object();
	if (isset($query->userId)) return false; // user does exist!
	return true;
}