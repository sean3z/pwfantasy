<?php

class ShowApplication {
	static function getShowNameByShowId($showId) {
		static $shows = array();

		if (!isset($shows[$showId])) {
			$shows[$showId] = db_query('SELECT showName FROM shows WHERE showId = %d', $showId)->fetch_object()->showName;
		}

		return $shows[$showId];
	}

	static function getShowShortNameByShowId($showId) {
		static $shows = array();

		if (!isset($shows[$showId])) {
			$shows[$showId] = db_query('SELECT showShortName FROM shows WHERE showId = %d', $showId)->fetch_object()->showShortName;
		}

		return $shows[$showId];
	}
}