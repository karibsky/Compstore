<?php 

$connect = new mysqli('localhost','root','','compstore');

$connect->set_charset("utf8");

if($connect->connect_error) {
	die('Ошибка подключения');
}

$query = $connect->query('SELECT * FROM products');

?>

<html>
<head>
	<title>Каталог</title>
	<link rel="stylesheet" href="css/main.css">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<link rel="stylesheet" href="https://opensource.keycdn.com/fontawesome/4.7.0/font-awesome.min.css">
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
				<a class="navbar-brand">Compstore</a>
			</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li class="active"><a href="views/main.php">Главная</a></li>
					<li><a href="/">Каталог</a></li>
					<li><a href="views/developers.php">Производители</a></li>
					<li><a href="views/contacts.php">Контакты</a></li>
				</ul> 
			</div>
		</div>
	</nav>
	<div class="filters-content">
		<div class="filter-by-price"> 
			<span class="filter-text" name="byasc">По возрастанию цены<i class="fa fa-arrow-up"></i></span>
		</div>
		<div class="filter-by-price">
			<span class="filter-text" name="bydesc">По убыванию цены<i class="fa fa-arrow-down"></i></span> 
		</div>
		<div class="filter-by-developer">
			<select>
				<option selected="selected">Производитель</option>
				<option>Intel</option>
				<option>Amd</option>
				<option>Kingston</option>
				<option>Gigabyte</option>
				<option>Asus</option>
				<option>MSI</option>
			</select>
		</div>
		<div class="filter-by-type">
			<select>
				<option selected="selected">Тип</option>
				<option>Материнская плата</option>
				<option>Процессор</option>
				<option>Оперативная память</option>
				<option>Видеокарта</option>
				<option>Блок питания</option>
				<option>SSD</option>
			</select>
		</div>
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
							<a class="one"> <?php echo $query_res['name'];?> </a>
						</p>
						<p class="product-desc"><?php echo $query_res['characteristics'];?></p>
						<p class="product-price"><?php echo $query_res['price']; echo " Р";?></p>
					</div>
				</div>
			<?php } ?>
		</div>
	</div>
</div>
<script src="http://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('.filter-by-developer select').on('change', function() {
			var developerValue = $(this).val();
			$.ajax({
				url: "views/filterbydeveloper.php",
				type: "get",
				dataType: 'text',
				contentType: "application/json",
				cache: false,
				data: {param2 : developerValue},
				success: function(data){
					$("body").html(data);
					addEventListener("popstate",function(e){
						location.href = '/';
					},false);
				}
			}); 
		});
		$('.filter-by-type select').on('change', function() {
			var typeValue = $(this).val();
			$.ajax({
				url: "views/filterbytype.php",
				type: "get",
				dataType: 'text',
				contentType: "application/json",
				cache: false,
				data: {param2 : typeValue},
				success: function(data){
					$("body").html(data);
					addEventListener("popstate",function(e){
						location.href = '/';
					},false);
				}
			}); 
		});
		$('.filter-by-price span[name="byasc"]').on('click',function() {
			var priceValueAsc = $(this).val();
			$.ajax({
				url: "views/filterbypriceasc.php",
				type: "get",
				dataType: 'text',
				contentType: "application/json",
				cache: false,
				data: {param2 : priceValueAsc},
				success: function(data){
					$("body").html(data);
					addEventListener("popstate",function(e){
						location.href = '/';
					},false);
				}
			}); 
		});
		$('.filter-by-price span[name="bydesc"]').on('click',function() {
			var priceValueDesc = $(this).val();
			$.ajax({
				url: "views/filterbypricedesc.php",
				type: "get",
				dataType: 'text',
				contentType: "application/json",
				cache: false,
				data: {param2 : priceValueDesc},
				success: function(data){
					$("body").html(data);
					addEventListener("popstate",function(e){
						location.href = '/';
					},false);
				}
			}); 
		});
	});
</script>
</body>
</html>
