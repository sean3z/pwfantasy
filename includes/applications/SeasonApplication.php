<?php

class SeasonApplication {
	static function getCurrentSeason() {
		static $season = 0; // if we can't find the season, return season 0

		if ($season < 1) {
			$query = db_query('SELECT GetCurrentSeason() as season')->fetch_object();
			if (isset($query->season)) $season = $query->season;
		}

		return $season; 
	}
}