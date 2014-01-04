<?php

class SuperstarApplication {
	static function getSuperstarNameBySuperstarId($superstarId) {
		static $superstars = array();

		if (!isset($superstars[$superstarId])) {
			$superstars[$superstarId] = db_query('SELECT superstarName FROM superstars WHERE superstarId = %d', $superstarId)->fetch_object()->superstarName;
		}

		return $superstars[$superstarId];
	}

	static function getSuperstarShortNameBySuperstarId($superstarId) {
		static $superstars = array();

		if (!isset($superstars[$superstarId])) {
			$superstars[$superstarId] = db_query('SELECT superstarShortName FROM superstars WHERE superstarId = %d', $superstarId)->fetch_object()->superstarShortName;
		}

		return $superstars[$superstarId];
	}
}