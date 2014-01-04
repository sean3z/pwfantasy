<?php 

class FactionApplication {
	static function getFactionNameByFactionId($factionId) {
		static $factions = array();

		if (!isset($factions[$factionId])) {
			$factions[$factionId] = db_query('SELECT factionName FROM factions WHERE factionId = %d', $factionId)->fetch_object()->factionName;
		}

		return $factions[$factionId];
	}

	static function getFactionShortNameByFactionId($factionId) {
		static $factions = array();

		if (!isset($factions[$factionId])) {
			$factions[$factionId] = db_query('SELECT factionShortName FROM factions WHERE factionId = %d', $factionId)->fetch_object()->factionShortName;
		}

		return $factions[$factionId];
	}
}