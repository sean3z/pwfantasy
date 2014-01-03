<?php 
include 'includes/design/header.php';
$method = (isset($_GET['method']) && !empty($_GET['method'])) ? $_GET['method'] : 'register';


if ($method == 'login'): 
	include 'includes/methods/User/login.php';
elseif ($method == 'register'): 
	include 'includes/methods/User/register.php';
elseif ($method == 'logout'):
	user_logout($user); 
	header('Location: /');
elseif ($method == 'forgotpass'):
	include 'includes/methods/User/forgotpass.php';
elseif ($method == 'settings'):
	include 'includes/methods/User/settings.php';
endif;

include 'includes/design/footer.php';