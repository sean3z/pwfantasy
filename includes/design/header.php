<?php include 'includes/includes.php'; ?>
<!DOCTYPE html>
<!--[if IE 9]><html class="lt-ie10" lang="en" > <![endif]-->
<html class="no-js" lang="en" >
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>PWFantasy</title>

	<link href="<?php echo ASSETS_PATH; ?>css/normalize.css" rel="stylesheet">
	<link href="<?php echo ASSETS_PATH; ?>css/foundation.min.css" rel="stylesheet">
	<link href="<?php echo ASSETS_PATH; ?>css/font-awesome.min.css" rel="stylesheet">
	<link href="<?php echo ASSETS_PATH; ?>css/design.r1.css" rel="stylesheet">
	<script type="text/javascript" src="<?php echo ASSETS_PATH; ?>js/modernizr.js"></script>
</head>
<body>

	<header>
		<?php include 'navigation.php'; ?>
	</header>

	<div class="row" style="margin-top: 15px;">
		<div class="small-12 medium-9 large-9 column">

			<?php if (isset($_SESSION['display_welcome'])): ?>
				<div class="alert-box radius success">Welcome to PWFantasy.</div>
			<?php unset($_SESSION['display_welcome']); endif; ?>
