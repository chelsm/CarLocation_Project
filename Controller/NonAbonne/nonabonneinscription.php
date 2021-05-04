<?php 

function nonabonneinscription() {
	$marque = isset($_POST['marque'])?($_POST['marque']):'';
	$utilisateur = isset($_POST['utilisateur'])?($_POST['utilisateur']):'';
	$email = isset($_POST['email'])?($_POST['email']):'';
	$motdepasse = isset($_POST['motdepasse'])?($_POST['motdepasse']):'';
	$msg='';	

	require ("Model/NonAbonne/nonabonneinscriptionBD.php");
	if (count($_POST) == 0) {
		require ("View/NonAbonne/nonabonneinscription.tpl");
	}
	else {
		$profil = array();
		if (!inscription_verification($marque,  $email, $motdepasse)) {
			$msg = "Erreur de saisie inscription";
			require ("View/NonAbonne/nonabonneinscription.tpl");
		}
		else if (!verif_email($email, $utilisateur)) {
			$msg = "Votre email ". $utilisateur. " a déjà été utilisé";
			require ("View/NonAbonne/nonabonneinscription.tpl");
		}
		else if (!insertion_utilisateur($marque, $motdepasse, $email, $utilisateur)) {
			$msg = "Erreur d'inscription";
			require ("View/NonAbonne/nonabonneinscription.tpl");
			}
		else {
			require ("Controller/General/generalconnexion.php");
			generalconnexion();
			echo ("Inscription réussi");
		}
	}		
}
	
function inscription_verification($marque,  $email, $motdepasse) {
	if (!preg_match("/^[a-zA-Z\s]{2,20}+$/", $marque)) {
		return false;
	}
	if (!preg_match("/^[a-zA-Z\d\.]+@[a-zA-Z\d\.]+\.[a-zA-Z\d\.]{2,}+$/", $email)) {
		return false;
	}
	if (!preg_match("/^[a-zA-Z\d\.]{8,20}+$/", $motdepasse)) {
		return false;
	}

	return true;
}
?>

