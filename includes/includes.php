<?php

ob_start();

ini_set('display_errors',1);
error_reporting(E_ALL);

date_default_timezone_set('America/New_York');

if (isset($_GET['destination'])) $_GET['destination'] = urldecode($_GET['destination']);

include 'database.php';

foreach (glob(pathinfo(__FILE__, PATHINFO_DIRNAME) .'/applications/*.php') as $file) include $file;

include 'session.php';

// define('ASSETS_PATH', '//cdn.pwfantasy.com/');
define('ASSETS_PATH', '/assets/');
define('MYSQL_DATETIME', 'Y-m-d H:i:s');
define('SITE_DATETIME', 'D, M d g:i A');
define('LOGIN_POST_REDIRECT', 'leagues.php?method=myleagues');