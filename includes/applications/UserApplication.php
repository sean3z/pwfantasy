<?php

class UserApplication {
	// requires $user->userId
	static function getUserByUserId($userId) {
		$user = db_query('SELECT * FROM users WHERE userId = %d', $userId)->fetch_object();
		$user->notifications = 0;
		return $user;
	}

	// required all non-null fields
	static function register($user) {
		return db_insert('users', (array)$user, true);
	}

	static function getUserBySession($hash) {

	}

	static function updateUserSession($userId, $hash) {
		// http://php.net/is_null#83588
		if ($hash === NULL) db_query('UPDATE users SET session = NULL WHERE userId = %d', $userId);
		else db_query('UPDATE users SET session = "%s" WHERE userId = %d', $hash, $userId);
	}
}