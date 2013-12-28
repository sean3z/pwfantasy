<?php

class SeasonApplication {
	static function getCurrentSeason() {
		$query = db_query('SELECT season FROM seasons WHERE startDate <= "%s" AND endDate >= "%1$s" LIMIT 1', date('Y-m-d H:i:s', time()))->fetch_object();
		if (isset($query->season)) return $query->season;
		return 1; // if we can't find the season, return season 1
	}
}