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
			<div class="txt animated pulse connexion-content">
				<div class="connexion-left-content">
					<img
						src="https://images.unsplash.com/photo-1589750602846-60028879da9b?ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80">
				</div>
				<div class="connexion-right-content">
					<section>
						<table>
							<tr>
								<th id="title-form">Se connecter</th>
							</tr>
							<td>
								<form action="index.php?dossier=General&controller=generalconnexion&function=generalconnexion" method="POST"
									class="connexion-form">
									<table class="input-fields">
										<tr>
											<td>Type de compte : </td>
											<td><input type="radio" name="utilisateur"
													value="loueur"><label>Loueur</label>
												<input type="radio" name="utilisateur" value="entreprise"
													style="margin-left: 30px;" /><label>Entreprise</label></td>
										</tr>
										<tr>
											<td>E-mail : </td>
											<td> <input class="input" type="email" placeholder="exemple@gmail.com"
													name="email" /> </td>
										</tr>
										<tr>
											<td>Mot de passe : </td>
											<td> <input class="input" type="password" placeholder="Mot de passe"
													name="motdepasse" /> </td>
										</tr>

										<tr>
											<td><button type="submit"
													class="btn btn-connexion btn-outline-dark">Connecter</button></td>
										</tr>


									</table>
									<a href="index.php?dossier=NonAbonne&controller=nonabonneinscription&function=nonabonneinscription" style="color : white"> Pas encore inscrit ? </a>
								</form>
								<?php echo $msg?>
							</td>

						</table>
					</section>
				</div>
			</div>
		</div>

</body>

</html>