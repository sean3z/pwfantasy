<?php 
include 'includes/design/header.php';
$method = (isset($_GET['method']) && !empty($_GET['method'])) ? $_GET['method'] : 'default';

switch ($method) {
	case 'login':
		include 'includes/methods/User/login.php';
	break;

	case 'register':
		include 'includes/methods/User/register.php';
	break;

	case 'logout':
		user_logout($user);
		header('Location: /');
	break;

	case 'forgotpass':
		include 'includes/methods/User/forgotpass.php';
	break;

	case 'settings':
		include 'includes/methods/User/settings.php';
	break;

	default:
		if (user_is_logged_in()) include 'includes/methods/User/settings.php';
		else include 'includes/methods/User/register.php';
}

include 'includes/design/footer.php';