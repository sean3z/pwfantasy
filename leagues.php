<?php 
include 'includes/design/header.php'; 
$method = (isset($_GET['method']) && !empty($_GET['method'])) ? $_GET['method'] : 'default';

switch ($method) {
	case 'create':
		include 'includes/methods/Leagues/create.php';
	break;

	case 'myleagues':
		include 'includes/methods/Leagues/myleagues.php';
	break;

	case 'joinleague':
		include 'includes/methods/Leagues/joinleague.php';
	break;

	default:
		include 'includes/methods/Leagues/leagues.php'; 
}

include 'includes/design/footer.php';