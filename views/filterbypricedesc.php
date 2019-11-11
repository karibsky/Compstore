<?php

$params = $_GET['param2'];

$connect = new mysqli('localhost','root','','compstore');
$connect->set_charset("utf8");

if($connect->connect_error) {
	die('Ошибка подключения');
}

$query = $connect->query("SELECT * FROM products ORDER by price DESC");

?>

<html>
<head>
	<meta charset="utf-8">
	<title><?php echo $params; ?></title>
	<link rel="stylesheet" href="../css/main.css">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body>
	<nav class="navbar navbar-custom" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/">Compstore</a>
			</div>

			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li class="active"><a href="main.php">Главная</a></li>
					<li><a href="/">Каталог</a></li>
					<li><a href="developers.php">Производители</a></li>
					<li><a href="contacts.php">Контакты</a></li>
				</ul> 
			</div>
		</div>
	</nav>
	<div class="filters-content">
		<div class="filter-by-price"> 
			<span class="filter-text" style="color:#FF9900">По убыванию цены<i class="fa fa-arrow-down"></i></span> 
		</div>
		<input type="submit" value="Сбросить фильтры" onclick="location.replace('/')">
	</div>
	<div class="container content">
		<div class="col-md-12 products">
			<div class="row">
				<?php while($query_res = $query->fetch_assoc()) { ?>
					<div class="col-12 col-sm-4 block">
						<div class="product">
							<div class="product-img center-block">
								<img src="<?php echo $query_res['image']; ?>" class="img-responsive">
							</div>
							<p class="product-title"> <?php $query_res['name']; ?>
							<a class="one" href="#<?php echo $query_res['id']?>"> <?php echo $query_res['name'];?> </a>
						</p>
						<p class="product-desc"><?php echo $query_res['characteristics'];?></p>
						<p class="product-price"><?php echo $query_res['price']; echo " Р";?></p>
					</div>
				</div>
			<?php } ?>
		</div>
	</div>
</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
</body>
</html>