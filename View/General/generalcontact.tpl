<!doctype html>
<html lang="fr">

<head>
	<meta charset="utf-8">
	<title>ChenWheels</title>
	<link rel="stylesheet" href="View/Design/css/style.css">
	<link rel="stylesheet" href="View/Design/bootstrap/css/bootstrap.min.css">
</head>

<body class ="body-contact">
    <header>
		<div class="background-image-container bg-contact">
			<div class="background-image-overlay"></div>
				<?php require("Controller/General/generalmenu.php"); generalmenu(); ?>
				<div class="cadre">
					<div class="txt animated pulse ">
						<h1 style ="color : white">Louez plus qu'une voiture</h1>
						<p style ="color : white">Le pouvoir de rouler moins cher </p>
					</div>
				</div>
			</div>
		</div>
	</header>

    <div class=" content">
		<div class="fond">
		
		<div class="cadre content-info">
			
			<div class = "boxL">
				<iframe class ="info-map"src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d10503.430051711131!2d2.2683737!3d48.8418565!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x497f02af0718f372!2sIUT%20de%20Paris%20-%20Site%20Mirabeau%20-%20Universit%C3%A9%20de%20Paris!5e0!3m2!1sfr!2sfr!4v1605283619449!5m2!1sfr!2sfr" width="100%" height="700" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
			</div>
			
			<div class = "boxM"> 
				<div class = "content-boxM"> 
					<h3><i class="fas fa-map-marker-alt"></i> Localisation</h3>
					<p>143 Avenue de Versailles, 75016 Paris</p><br>
					
					<h3><i class="fas fa-phone"></i> Telephone</h3>
					<p> 01 76 53 47 00</p><br>
					
					<h3><i class="fas fa-barcode"></i> Qui nous sommes ?</h3>
					<p>ChenWheels</p>
					<p>Nous sommes une agence de location de voitures en ligne.<br></p>
					Une équipe de trois merveilleux étudiants voulant avoir une bonne note à leur projet.<br><br>
					<h3><i class="far fa-clock"></i> Horaires</h3>
					<p>
						Lundi : 10h - 18h<br>
						Mardi : 10h - 18h <br>
						Mrcredi : 10h - 18h <br>
						Jeudi : 10h - 18h <br>
						Vendredi : 10h - 22h <br>
						Samedi : 10h - 22h<br>
						Dimanche : Fermé <br>
					</p>
				</div>
			</div>
			
			<div class = "boxR"> 
				<div class ="wrapper">
				 <h3> Laisser un message   </h3><br>  
					<div class="contact-form">
						<div class ="input-fields">
							<input type="text" class="input" placeholder ="Nom">
							<input type="email" class="input" placeholder ="Email">
						</div>
						<div class="msg">
							<textarea placeholder ="Messages"></textarea>
							 <button type="submit"class="btn btn-contact btn-outline-dark" style="margin-top : 20px">Envoyer</button>
						</div>
					</div>
				</div>
			</div>
			
		
		</div>
    </div>

    <?php include("View/General/generalfooter.tpl"); ?>
</body>



<html>