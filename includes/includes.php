<?php

ob_start();

ini_set('display_errors',1);
error_reporting(E_ALL);

date_default_timezone_set('America/New_York');

if (isset($_GET['destination'])) $_GET['destination'] = urldecode($_GET['destination']);

include 'database.php';
include 'session.php';

foreach (glob('includes/applications/*.php') as $file) include $file;

// define('ASSETS_PATH', '//cdn.pwfantasy.com/');
define('ASSETS_PATH', '/fw/assets/');