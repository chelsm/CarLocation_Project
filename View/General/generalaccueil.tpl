<!doctype html>
<html lang="fr">

<head>
	<meta charset="utf-8">
	<title>ChenWheels</title>
	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
	<link rel="stylesheet" href="View/Design/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="View/Design/css/style.css">
		<script src="https://kit.fontawesome.com/cfa21a103c.js" crossorigin="anonymous"></script>
	
	

    
</head>

<body>
	<header>
		<div class="background-image-container bg-acceuil">
			<div class="background-image-overlay"></div>
				<?php require("Controller/General/generalmenu.php"); generalmenu(); ?>
				<div class="cadre">
					<div class="txt animated pulse ">
						<h1 style ="color : white">Louez plus qu'une voiture</h1>
						<p style ="color : white">Le pouvoir de rouler moins cher </p>
						<div class="box-1">
							<a href="index.php?dossier=General&controller=generalconnexion&function=generalconnexion">
								<div class="btn btn-one">
									<span>Commencez à louer</span>
								</div>
							</a> 
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>

		<div class=" content" style="padding-top :50px">
			<div class="jumbotron jumbotron-fluid  ">
				<div class="row ">
					<div class="col-md box" style="background-image:url(https://cdn.shopify.com/s/files/1/0068/6289/7199/files/banner-v1-1.jpg?v=1564546967)">
				
						<h3>Nos partenaires</h3>
						<a href="https://www.lacentrale.fr/">
							<button type="button" class="btn btn-outline-primary" style="margin-top:20px">Voir</button>
						</a> 
					</div>
					<div class="col-md box"style="background-image:url(https://cdn.shopify.com/s/files/1/0068/6289/7199/files/banner-v1-2.jpg?v=1564546976)">
						
						<h3>Nos partenaires</h3>
						<a href="https://www.occasionsdulion.com/">
							<button type="button" class="btn btn-outline-primary" style="margin-top:20px">Voir</button>
						</a> 
					</div>
						
							
				</div>
			</div>



			<div class="swiper-container">

					<div class="container-title">
						<h1>Nos voitures</h1>
					</div>


				<div class="swiper-wrapper">
					<div class="swiper-slide" style="background-image:url(https://i.pinimg.com/originals/4f/d0/6c/4fd06c6aaa784d433f57a84d262c49d4.png)">
						<div id="carousel-title-car">Range Rover</div>
					</div>
					<div class="swiper-slide" style="background-image:url(https://www.freepnglogos.com/uploads/mercedes-png/mercedes-amg-car-png-image-pngpix-9.png)">
						<div id="carousel-title-car">Mercedes-Benz</div>
					</div>
					<div class="swiper-slide" style="background-image:url(https://pngimg.com/uploads/mini/mini_PNG11788.png)">
						<div id="carousel-title-car">Mini</div>
					</div>
					<div class="swiper-slide" style="background-image:url(https://www.searchpng.com/wp-content/uploads/2019/01/renault-captur-car-png.png)">
						<div id="carousel-title-car">Renault</div>
					</div>
					<div class="swiper-slide" style="background-image:url(View/Design/images/Tesla.png)">
						<div id="carousel-title-car">Tesla</div>
					</div>
				</div>
			</div>
		</div>

	<?php include("View/General/generalfooter.tpl"); ?>



	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script>
		var swiper = new Swiper('.swiper-container', {
		effect: 'coverflow',
		grabCursor: true,
		centeredSlides: true,
		slidesPerView: 'auto',
		coverflowEffect: {
			rotate: 20,
			stretch: 0,
			depth: 200,
			modifier: 1,
			slideShadows: true,
		},
		loop:true,
		});
  	</script>
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>

	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.3/dist/Chart.min.js"></script>
	


</body>



</html>