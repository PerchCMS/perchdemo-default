<?php include($_SERVER['DOCUMENT_ROOT'].'/perch/runtime.php'); ?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
	<title><?php perch_pages_title(); ?></title>
	<meta name="viewport" content="width=device-width, target-densitydpi=160dpi, initial-scale=1.0" />
	<?php perch_get_css(); ?>
</head>
<body>
	<header class="layout-header">
		<div class="wrapper">
			<div class="company-name">Perch Quill Example</div>
			<img src="<?php perch_path('feathers/quill/img/logo.gif'); ?>" alt="Your Logo Here" class="logo"/>
		</div>
		<nav class="main-nav">
			<?php perch_pages_navigation(array(
			  'from-path' => '/',
			  'levels'    => 1
			)); 
			?>
		</nav>
	</header>
	<div class="wrapper cols1">
		
		<div class="primary-content">
    		<h1><?php perch_content('Main heading'); ?></h1>

    

    		<?php perch_content('Intro'); ?>
    
    	</div>
    	
    </div>	
    <?php perch_get_javascript(); ?>
</body>
</html>