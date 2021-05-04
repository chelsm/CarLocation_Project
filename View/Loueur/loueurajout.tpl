<!doctype html>
<html lang="fr">

<head>
	<meta charset="utf-8">
	<title>ChenWheels</title>
	<link rel="stylesheet" href="View/Design/css/style.css">
	<link rel="stylesheet" href="View/Design/bootstrap/css/bootstrap.min.css">
</head>

<body class ="body-ajoutvoiture" style ="background-color :#191919!important; color : white">
    <header>
		<div class="background-image-container bg-ajoutvoiture">
			<div class="background-image-overlay"></div>
				<?php require("Controller/General/generalmenu.php"); generalmenu(); ?>
				<div class="cadre">
					<div class="txt animated pulse ">
						<h1 color ="black ; font-weight: bold;">Louez plus qu'une voiture</h1>
						<p color ="black ; font-weight: bold;">Le pouvoir de rouler moins cher </p>
					</div>
				</div>
			</div>
		</div>
	</header>

	<div class=" content" style="padding-top :50px ; background-color = #302E27 ">
   		<section>
			<div clas = "wrapper">
				<form action="index.php?dossier=Loueur&controller=loueurlocation&function=ajoute" method="POST" class="ajoutervoiture-form">
					<center style="font-weight: bold ; "> <br>Ajouter une voiture en location</center>
					<div class="input-fieldscar addcar">
					
							
					
                            <label for="Type">Type : </label>
                            <input class=" champ" type="text" placeholder="Votre type" name="type" required /> 
                      
						
							<label for="Type">Prix/Jour : </label>
                            <input class=" champ" type="text" placeholder="Le prix" name="prix" required />
                   
							<label for="Type">Caractéristiques : </label>
                            <input class=" champ" type="text" placeholder="Caracteristique de voiture" name="caracteristique" required /> 
                    
							<label for="Type">Nom de la photo : </label>	
                            <input class=" champ" type="text" placeholder="Photo de voiture"name="photo" required />

							
					</div>

					<?php echo $msg ?>

					<div id="file-upload-form" class="uploader"style="margin-bottom:50px">
					  <input id="file-upload" type="file" name="fileUpload" accept="image/*" />

					  <label for="file-upload" id="file-drag">
						<img id="file-image" src="#" alt="Preview" class="hidden">
						<div id="start">
						  <i class="fa fa-download" aria-hidden="true"></i>
						  <div>Selectionner une image ou déposer ici</div>
						  <div id="notimage" class="hidden">Choisir une image</div>
						  <span id="file-upload-btn" class="btn btn-primary">Choisir une image</span>
						</div>
						<div id="response" class="hidden">
						  <div id="messages"></div>
						  <progress class="progress" id="file-progress" value="0">
							<span>0</span>%
						  </progress>
						</div>
					  </label>
					</div>
					<button type="submit" class="btn btn-outline-warning" style="float : right; margin: 50px 50px 50px 0px">Poster</button>
	            </form>
			</div>
		</section>
	</div>
    <?php include("View/General/generalfooter.tpl"); ?>

     <script src="js/upload.js"></script>
</body>



<html>