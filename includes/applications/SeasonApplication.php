<?php

class SeasonApplication {
	static function getCurrentSeason() {
		static $season = 0; // if we can't find the season, return season 0

		if ($season < 1) {
			$query = sprintf('SELECT season FROM seasons WHERE startDate <= "%s" AND endDate >= "%1$s" LIMIT 1', date('Y-m-d H:i:s', time()));
			$query = db_query($query)->fetch_object();
			if (isset($query->season)) $season = $query->season;
		}

		return $season; 
	}
}