<nav class="navbar navbar-expand-lg navbar-light bg-light" style="background-color: transparent!important;">
	<a class="navbar-brand logo" href="index.php?dossier=General&controller=generalgestion&function=generalaccueil">
		<img  class ="avec"src ="View/Design/images/Logo.png" style="height : 100px">
	</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto navbar-center ">
			<li color ="black ; font-weight: bold;"><a href="index.php?dossier=Loueur&controller=loueurlocation&function=loueurlocation">Consultation des voitures</a></li>
			<li color ="black ; font-weight: bold;"><a href="index.php?dossier=Loueur&controller=loueurlocation&function=ajoute">Ajouter des Voitures</a></li>
			<li color ="black ; font-weight: bold;"><a href="index.php?dossier=Loueur&controller=loueurhistorique&function=loueurhistorique">Historique</a></li>
			<li color ="black ; font-weight: bold;"><a href="index.php?dossier=General&controller=generalgestion&function=generalcontact">Contact</a></li>		
		</ul>
	</div>
	<form action="index.php?dossier=General&controller=generalconnexion&function=generaldeconnexion" method="POST">
		<button class="button" type="submit">Se déconnecter</button>
	</form>

</nav>