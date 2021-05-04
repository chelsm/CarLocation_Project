<?php

	function connexion_verification_BD($email, $motdepasse, $utilisateur, &$profil) {
		require ("Model/General/generalconnectBD.php");
		$encode_motdepasse = sha1($motdepasse);
		if ($utilisateur == "loueur"){
			$sql="SELECT * FROM Loueurs WHERE email=:email AND motdepasse=:motdepasse";
		}
		else {
			$sql="SELECT * FROM Entreprises WHERE email=:email AND motdepasse=:motdepasse"; 
		}
		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':email', $email, PDO::PARAM_STR);
			$commande->bindParam(':motdepasse', $encode_motdepasse, PDO::PARAM_STR);
			$commande->execute();

			if ($commande->rowCount() > 0) {  //compte le nb d'enregistrement
				$profil = $commande->fetch(PDO::FETCH_ASSOC); // le sql exécuté (id, marque, mdp, email)
				$_SESSION['profil']=$profil;
				$_SESSION['utilisateur'] = $utilisateur;
				return true;
			}
			else return false;
		}

		catch (PDOException $e) {
			echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
			die(); // On arrête tout.
		}
	}
?>


