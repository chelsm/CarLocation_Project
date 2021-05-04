<?php
	// Vérifie si l'email existe déjà 
	function verif_email($email, $utilisateur) {
		require ("Model/General/generalconnectBD.php");
		if ($utilisateur == "loueur"){
			$sql="SELECT * FROM Loueurs WHERE email=:email";
		}
		else {
			$sql="SELECT * FROM Entreprises WHERE email=:email"; 
		}
		try {
			$commande=$pdo->prepare($sql);
			$commande->bindParam(':email', $email, PDO::PARAM_INT); 
			$commande->execute();
			if ($commande->rowCount() > 0) {  //compte le nb d'enregistrement
				return false;
			}
			else {
				return true;
			}
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die(); // On arrête tout.
		}
	}

	function insertion_utilisateur($marque, $motdepasse, $email, $utilisateur){
		require ("Model/General/generalconnectBD.php");
		$encode_motdepasse = sha1($motdepasse);
		if ($utilisateur == "loueur"){
			$sql="INSERT INTO LOUEURS (Marque, MotdePasse, Email) VALUES(:marque, :motdepasse, :email)";
		}
		else {
			$sql="INSERT INTO ENTREPRISES (Marque, MotdePasse, Email) VALUES(:marque, :motdepasse, :email)";
		}
		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':marque', $marque, PDO::PARAM_STR);
			$commande->bindParam(':motdepasse', $encode_motdepasse, PDO::PARAM_STR);
			$commande->bindParam(':email', $email, PDO::PARAM_STR);
			if ($commande->execute()){
				$_SESSION['profil']['Email'] = $email;
				$_SESSION['profil']['Motdepasse'] = $encode_motdepasse;
				$_SESSION['utilisateur'] = $utilisateur;
				return true;
			}
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de insert : " . $e->getMessage() . "\n");
			die();
			return false;
		}
	}
?>