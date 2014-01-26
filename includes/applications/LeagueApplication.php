<?php

class LeagueApplication {
	static function getLeaguesBySeason($season, $limit = 50) {
		if ($season < 1) $season = SeasonApplication::getCurrentSeason();
		$leagues = array();
		$query = db_query('SELECT * FROM leagues WHERE season = %d ORDER BY leagueId LIMIT %d', $season, $limit);
		while($league = $query->fetch_object()) $leagues[] = $league;
		return $leagues;
	}

	static function getLeaguesByUserIdSeason($userId, $season =  0) {
		if ($season < 1) $season = SeasonApplication::getCurrentSeason();
		if ((int)$userId > 0) {
			$leagues = array();
			$query = sprintf('SELECT l.* FROM leagueplayers p LEFT JOIN leagues l USING(leagueId) WHERE (p.player1 = %d OR p.player2 = %1$d OR p.player3 = %1$d OR p.player4 = %1$d OR p.player5 = %1$d OR p.player6 = %1$d OR p.player7 = %1$d OR p.player8 = %1$d) AND l.season = %d LIMIT 15', $userId, $season);
			$query = db_query($query);
			while($league = $query->fetch_object()) $leagues[] = $league;
			return $leagues;
		}
		return array();
	}
}