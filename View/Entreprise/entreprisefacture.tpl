<!doctype html>
<html lang="fr">

<head>
	<meta charset="utf-8">
	<title>ChenWheels</title>
	<link rel="stylesheet" href="View/Design/css/style.css">
	<link rel="stylesheet" href="View/Design/bootstrap/css/bootstrap.min.css">
</head>

<body class="body-facturation">
	<header>
		<div class="background-image-container bg-facture">
				<div class="background-image-overlay"></div>
					<?php require("Controller/General/generalmenu.php"); generalmenu(); ?>
				<div class="cadre">
					<div class="txt animated pulse ">
						<h1 style ="color : white">Louez plus qu'une voiture</h1>
						<p style ="color : white ">Le pouvoir de rouler moins cher </p>
					</div>
				</div>
			</div>
		</div>
	</header>
	
	<div class=" content" style="padding-top :50px">
		<div id="facturation">
			<div class="background-facturation"></div>
				<div id="invoice" class="shadow">
					
					<div id="invoice-top">
						<div class="logoChenWheels">
							<img  class ="avec"src ="View/Design/images/LogoNoir.png" style="height : 100px">
						</div>
						<div class="title">
							<?php 
								date_default_timezone_set('Europe/Paris');
								$dateactuelle = date("Y-m-d");
								$LignesFacturation = $_SESSION['LignesFacturation'];
								$IdFacturation = $_SESSION['Facturation']['IdFacturation'];
								$MontantTotal = $_SESSION['MontantTotal'];

								echo 
								'<h1 class = "numfac"> Facture numéro : '.$IdFacturation.'</h1>',
								'<br><br><p class ="info-fac" style="float : right"> Date: '.$dateactuelle.'</p>';
							?>   
						</div>
					</div>
					
					<div id="invoice-mid">
						<div class="info">
							<?php 
								echo
								'<h2 class ="pers-loc">'.$_SESSION['profil']['Marque'].'</h2>',
								'<p class ="info-fac" >'.$_SESSION['profil']['Email'].'</p>';
							?> 
						</div>
					</div>
				
					<div id="invoice-bot">
					
						<div id="table">
							<table>
								<tr class="tabletitle">
									<th class="item"><h2 class ="info-fac-table">Voiture</h2></th>
									<th class="Rate"><h2 class ="info-fac-table" >Date début</h2></th>
									<th class="Rate"><h2 class ="info-fac-table">Date fin</h2></th>
									<th class="Rate"><h2 class ="info-fac-table">Prix/Jour</h2></th>
								</tr>
								
								<?php
									foreach ($LignesFacturation as $LigneFacturation) { ?>
									<tr class="service">
										<?php echo										
										'<td class="tableitem"><p class="itemtext info-fac idvehicule">' . $LigneFacturation['Type'] . '</td>',
										'<td class="tableitem"><p class="itemtext info-fac datedebut">' . $LigneFacturation['DateDebut'] . '</td>',
										'<td class="tableitem"><p class="itemtext info-fac datefin">' . $LigneFacturation['DateFin'] . '</td>',
										'<td class="tableitem"><p class="itemtext info-fac prix">' . $LigneFacturation['Prix'] . ' €</td>';											
									?>
									</tr>
									<?php }
								?>

								<tr class="tabletitle">
									<?php
										echo '<td></td>',
										'<td></td>',
										'<td class="Rate"><h2>Total</h2></td>',
										'<td class="payment"><h2>'.$MontantTotal.' €</h2></td>';
										
									?> 
								</tr>
							</table>
						</div>
					</div> 
				</div>
				<?php echo $msg ?>

				<form action ='index.php?dossier=Entreprise&controller=entrepriselocation&function=entreprisepaiement' method = 'POST'>
					<button type="submit" class="btn btn-facturation btn-outline-dark" style="float : right; margin: 50px 50px 50px 0px">Payer</button>
				</form>
				
			</div>
	
		</div>
	</div>
<?php include("View/General/generalfooter.tpl"); ?>
</body>

</html>