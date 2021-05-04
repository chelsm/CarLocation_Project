<?php

	function generalconnexion() {

		if (empty($_SESSION['profil']['email']) && empty($_SESSION['profil']['motdepasse'])){
			$email = isset($_POST['email'])?($_POST['email']):'';
			$motdepasse = isset($_POST['motdepasse'])?($_POST['motdepasse']):'';
			$utilisateur = isset($_POST['utilisateur'])?($_POST['utilisateur']):'';
		}
		else {
			$email = $_SESSION['profil']['Email'];
			$motdepasse = $_SESSION['profil']['MotdePasse'];
			$utilisateur = $_SESSION['utilisateur'];
		}
		$msg='';

		require ("Model/General/generalconnexionBD.php");

		if (count($_POST) == 0) {
			require ("View/General/generalconnexion.tpl");
		}
		else {
			if (!connexion_verification($email, $motdepasse)) {
				$msg = "Erreur de saisie connexion";
				require ("View/General/generalconnexion.tpl");
			}
			else if (!connexion_verification_BD($email, $motdepasse, $utilisateur, $profil)) {
				$msg ="erreur de saisie connexion";
				require ("View/General/generalconnexion.tpl");
			}
			else {
				$msg = "Bonjour ".$_SESSION['profil']['Marque']; 
				require ("View/General/generalconnexion.tpl");
			}
		}
	}

	function connexion_verification($email, $motdepasse) {
		if (!preg_match("/^[a-zA-Z\d\.]+@[a-zA-Z\d\.]+\.[a-zA-Z\d\.]{2,}+$/", $email)) {
			return false;
		}
		if (!preg_match("/^[a-zA-Z\d\.]{8,20}+$/", $motdepasse)) {
			return false;
		}	
		return true;
	}

	function generaldeconnexion() {
		session_unset();
		require ("View/General/generalaccueil.tpl");
	}
?>