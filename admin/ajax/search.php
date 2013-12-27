<?php

include '../../includes/database.php';
header('Content-Type: application/json; charset=utf-8');

$output = array();
if (isset($_GET['method'])) {
	switch($_GET['method']) {
		case 'SuperstarByName':
			$query = db_query('SELECT superstarId, superstarName, GetPointsBySuperstarIdSeason(superstarId, GetCurrentSeason()) as points FROM superstars WHERE superstarName LIKE ("%%%s%%") OR superstarSlug LIKE ("%%%1$s%%")', $_POST['superstar']);
			while($talent = $query->fetch_object()) $output[] = $talent;
		break;
	}
}
die(json_encode($output));

?>