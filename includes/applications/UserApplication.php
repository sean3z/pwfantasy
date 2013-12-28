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
		$userId = db_insert('users', (array)$user, true);
		// insert welcome message notification
		return $userId;
	}

	static function getUserBySession($hash) {

	}

	static function updateUserSession($userId, $hash) {
		// http://php.net/is_null#83588
		if ($hash === NULL) db_query('UPDATE users SET session = NULL WHERE userId = %d', $userId);
		else db_query('UPDATE users SET session = "%s" WHERE userId = %d', $hash, $userId);
	}

	static function getDisplayNameByUserId($userId) {
		static $users = array();

		if (!isset($users[$userId])) {
			$query = db_query('SELECT displayName FROM users WHERE userId = %d', $userId)->fetch_object();
			if (isset($query->displayName)) $users[$userId] = $query->displayName;
		} 

		return $users[$userId];
	}
}