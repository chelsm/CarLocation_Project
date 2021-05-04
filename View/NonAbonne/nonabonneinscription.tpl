<!doctype html>
<html lang="fr">

<head>
	<meta charset="utf-8">
	<title>ChenWheels</title>
	<link rel="stylesheet" href="View/Design/css/style.css">
	<link rel="stylesheet" href="View/Design/bootstrap/css/bootstrap.min.css">
</head>

<body class="body-connexion">
	<div class="section-background section-background-color">
		<?php require("Controller/General/generalmenu.php"); generalmenu(); ?>
		<div class="cadre">
			<div class="txt animated pulse inscription-content">
				<div class="connexion-right-content">
					<section>
						<table>
							<tr>
								<th id="title-form-insc">S'inscrire</th>
							</tr>
							<td>
								<form action="index.php?dossier=NonAbonne&controller=nonabonneinscription&function=nonabonneinscription" method="POST" class="connexion-form">
									<table class="input-fields">
										<tr>
											<td>Marque : </td>
											<td> <input class="input" type="text" placeholder="Votre marque"
													name="marque" required /> </td>
										</tr>
										<tr>
											<td>Type de compte : </td>
											<td><input type="radio" name="utilisateur"
													value="loueur" /><label>Loueur</label>
												<input class="input" type="radio" name="utilisateur" value="entreprise"
													style="margin-left: 30px;" /><label>Entreprise</label></td>
										</tr>
										<tr>
											<td>E-mail : </td>
											<td> <input class="input" type="email" placeholder="Votre e-mail"
													name="email" required /> </td>
										</tr>
										<tr>
											<td>Mot de passe : </td>
											<td> <input class="input" type="password" placeholder="Votre mot de passe"
													name="motdepasse" required /> </td>
										</tr>
										<tr>
											<td><button type="submit"
													class="btn btn-connexion btn-outline-dark">Inscrire</button></td>
										</tr>
										<!--Nous attribuons une classe spécifique à cette balise pour des raisons ésthétiques-->
									</table>
									<!--Ce tableau est le tableau ou un utilisateur non inscrit rendre ses identifiants-->
									<a href="index.php?dossier=General&controller=generalconnexion&function=generalconnexion" style="color : white ;"> Déjà inscrit ? </a>
								</form>
								<?php echo $msg?>
							</td>
						</table>
					</section>
				</div>

				<div class="inscription-left-content ">
					<img src="View/Design/images/mirror.jpg">
				</div>

			</div>
		</div>

</body>

</html>