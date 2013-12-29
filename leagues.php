<?php 

include 'includes/design/header.php'; 
$method = (isset($_GET['method']) && !empty($_GET['method'])) ? $_GET['method'] : 'leagues';

if ($method == 'create'): 
	include 'methods/Leagues/create.php';
elseif ($method == 'myleagues'):
	include 'methods/Leagues/myleagues.php';
elseif ($method == 'leagues'):
	include 'methods/Leagues/leagues.php'; 
elseif ($method == 'joinleague'):
	include 'methods/Leagues/joinleague.php';
endif; 

include 'includes/design/footer.php';