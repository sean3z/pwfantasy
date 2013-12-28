<?php

function db_query($query) {
	$args = func_get_args();
	array_shift($args);
	if (isset($args[0]) and is_array($args[0])) $args = $args[0];
	_db_query_callback($args, TRUE);
	$query = preg_replace_callback('/(%d|%s|%%|%f|%b|%n)/', '_db_query_callback', $query);
	return _db_query($query);
}

function db_insert($table, $options, $id = false) {
	array_walk($options, 'db_escape_string');
	$query = '(`'. implode('`,`', array_keys($options)) .'`) VALUES ("'. implode('","', $options) .'")';
	return _db_query('INSERT INTO `'. $table .'` '. $query, $id);
}

function db_connect() {
	$mysqli = new mysqli('localhost', 'sean', 'kId*g0aT', 'fw');
	if ($mysqli->connect_errno) die(sprintf('MySQL Error: %s', $mysqli->connect_error));
	return $mysqli;
}

function _db_query_callback($match, $init = FALSE) {
	static $args = NULL;
	if ($init) {
		$args = $match;
		return;
	}

	if($match[1] === 'null' || $match[1] === 'NULL' || is_null($match[1])){
		return 'NULL';
	}

	switch ($match[1]) {
		case '%d': // We must use type casting to int to convert FALSE/NULL/(TRUE?)
			$value = array_shift($args);
			// Do we need special bigint handling?
			if ($value > PHP_INT_MAX) {
				$precision = ini_get('precision');
				@ini_set('precision', 16);
				$value = sprintf('%.0f', $value);
				@ini_set('precision', $precision);
			}
			else {
				$value = (int) $value;
			}
			// We don't need db_escape_string as numbers are db-safe.
			return $value;
		case '%s':
			return db_escape_string(array_shift($args));
		case '%n':
			// Numeric values have arbitrary precision, so can't be treated as float.
			// is_numeric() allows hex values (0xFF), but they are not valid.
			$value = trim(array_shift($args));
			return is_numeric($value) && !preg_match('/x/i', $value) ? $value : '0';
		case '%%':
			return '%';
		case '%f':
			return (float) array_shift($args);
		case '%b': // binary data
			return db_encode_blob(array_shift($args));
	}
}

function db_escape_string($text) {
	return strtr($text, array("\x00" => '\x00', "\n" => '\n', "\r" => '\r', '\\' => '\\\\', "'" => "\'", '"' => '\"', "\x1a" => '\x1a'));
}

function db_encode_blob($data) {
	return "'". db_escape_string($data) ."'";
}

function _db_query($query, $id = false) {
	global $mysqli;
	if ($result = $mysqli->query($query)) {
		if ($id) $result = $mysqli->insert_id;
		// $mysqli->close();
		return $result;
	} else {
		die(sprintf('MySQL Error: %s', $mysqli->error));
	}
}

$mysqli = db_connect();