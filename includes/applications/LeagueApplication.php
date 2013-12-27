<?php

class LeagueApplication {
	public function getLeagues($limit = 100) {
		$leagues = array();
		$query = db_query('SELECT * FROM leagues ORDER BY leagueId LIMIT %d', $limit);
		while($league = $query->fetch_object()) $leagues[] = $league;
		return $leagues;
	}

	public function getLeaguesByUserId($userId) {
		if ((int)$userId > 0) {
			$leagues = array();
			$query = sprintf('SELECT l.* FROM leagueplayers p LEFT JOIN leagues l USING(leagueId) WHERE (p.player1 = %d OR p.player2 = %1$d OR p.player3 = %1$d OR p.player4 = %1$d OR p.player5 = %1$d OR p.player6 = %1$d OR p.player7 = %1$d OR p.player8 = %1$d) OR l.userId = %1$d LIMIT 15', $userId);
			$query = db_query($query);
			while($league = $query->fetch_object()) $leagues[] = $league;
			return $leagues;
		}
		return array();
	}
}