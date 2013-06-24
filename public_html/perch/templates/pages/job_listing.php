<?php include($_SERVER['DOCUMENT_ROOT'].'/perch/runtime.php'); ?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
	<title><?php perch_pages_title() ?> - Careers - <?php perch_content('Site title'); ?></title>
	<meta name="viewport" content="width=device-width, target-densitydpi=160dpi, initial-scale=1.0" />
	<?php perch_get_css(); ?>
	<link rel="stylesheet" type="text/css" href="/css/demo.css" />
</head>
<body>
	<header class="layout-header">
		<div class="wrapper">
			<div class="company-name"><?php perch_content('Site title'); ?> - <?php perch_content('Company name'); ?></div>
			<?php perch_content('Logo'); ?>
		</div>
		<nav class="main-nav">
			<?php
				perch_pages_navigation(array(
					'from-path' => '/',
					'levels'    => 1,
					));
			?>
		</nav>
	</header>

	<?php 
		perch_content_create('Job', array(
			'template' => 'job.html',
		));


		perch_content('Job'); 
	?>

	<footer class="layout-footer">
		<div class="wrapper">
			<?php perch_content('Social links'); ?>
			<small>Copyright &copy; <?php echo date("Y"); ?></small>
		</div>
	</footer>
    <?php perch_get_javascript(); ?>
</body>
</html>