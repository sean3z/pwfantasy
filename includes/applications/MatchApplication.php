<?php

class MatchApplication {
	static function getMatchTypeNameByMatchTypeId($matchTypeId) {
		static $matchTypes = array();

		if (!isset($matchTypes[$matchTypeId])) {
			$matchTypes[$matchTypeId] = db_query('SELECT matchTypeName FROM matchtypes WHERE matchTypeId = %d', $matchTypeId)->fetch_object()->matchTypeName;
		}

		return $matchTypes[$matchTypeId];
	}

	function getMatchSummaryByMatchId($matchId) {
		$match = new stdClass();

		$match->summary = new stdClass();
		$q = db_query('SELECT m.*, s.showShortName, t.matchTypeShortName FROM matches m INNER JOIN shows s ON s.showId = m.showId INNER JOIN matchtypes t ON t.matchTypeId = m.matchTypeId WHERE m.matchId = %d', $matchId)->fetch_object();
		$m = (object)array(
			'matchId' => $q->matchId,
			'matchDate' => date('m/d/Y', strtotime($q->date)),
			'matchShowId' => $q->showId,
			'matchTypeId' => $q->matchTypeId,
			'matchShowShortName' => $q->showShortName,
			'matchTypeShortName' => $q->matchTypeShortName,
			'isDraw' => (($q->isDraw > 0) ? 'Yes' : 'No'),
			'isTitle' => (($q->isTitleMatch > 0) ? 'Yes' : 'No'),
			'matchTitle' => 'Untitled',
		);
		$match->summary = $m;

		$match->participants = new stdClass();
		$q = db_query('SELECT s.*, t.superstarName, t.factionId FROM matchstats s INNER JOIN superstars t ON t.superstarId = s.superstarId WHERE s.match_referee IS NULL AND s.matchId = %d', $matchId);
		while($p = $q->fetch_object()) {
			$k = (($p->match_won > 0) ? 'won' : (($p->match_loss > 0) ? 'loss' : 'draw'));
			$superstar = (object)array(
				'superstarId' => $p->superstarId,
				'superstarName' => $p->superstarName,
				'factionId' => ( ($p->factionId > 0) ? $p->factionId : 0)
			);
			$match->participants->{$k}[] = $superstar;
		}

		if (isset($match->participants->draw)) {
			$match->summary->matchTitle = 'No Contest '. $match->summary->matchTypeShortName;
		} else {
			switch($match->summary->matchTypeId) {
				case 1:
				case 8:
					$match->summary->matchTitle = $match->participants->won[0]->superstarName .' def. '. $match->participants->loss[0]->superstarName;
				break;

				case 2:
					// check if at least two members are in same faction
					$factions = array(); $wonTitle = array();
					foreach($match->participants->won as $k => $superstar) {
						if ($superstar->factionId > 0) $factions[$superstar->factionId][] = $superstar->superstarId;
					}

					foreach($factions as $factionId => $_) {
						if (count($factions[$factionId]) > 1) $wonTitle[] = getFactionShortNameByFactionId($factionId);
					}

					foreach($match->participants->won as $k => $superstar) {
						if ($superstar->factionId > 0 && in_array($superstar->superstarId, $factions[$superstar->factionId])) {
							continue;
						} else {
							$wonTitle[] = $superstar->superstarName;
						}
					}

					$factions = array(); $lossTitle = array();
					foreach($match->participants->loss as $k => $superstar) {
						if ($superstar->factionId > 0) $factions[$superstar->factionId][] = $superstar->superstarId;
					}

					foreach($factions as $factionId => $_) {
						if (count($factions[$factionId]) > 1) $lossTitle[] = getFactionShortNameByFactionId($factionId);
					}

					foreach($match->participants->loss as $k => $superstar) {
						if ($superstar->factionId > 0 && in_array($superstar->superstarId, $factions[$superstar->factionId])) {
							continue;
						} else {
							$lossTitle[] = $superstar->superstarName;
						}
					}

					$wonLast = ''; $lossLast = '';
					if (count($wonTitle) > 1) $wonLast = ' & '. array_pop($wonTitle);
					if (count($lossTitle) > 1) $lossLast = ' & '. array_pop($lossTitle);
					$match->summary->matchTitle = implode(', ', $wonTitle) . $wonLast .' def. '. implode(', ', $lossTitle) . $lossLast;
				break;
			}
		}

		return $match;
	}
}