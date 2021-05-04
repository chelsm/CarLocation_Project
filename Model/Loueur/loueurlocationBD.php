<?php
    function loueur_afficher_voiture(&$vehicules) {
        require ("Model/General/generalconnectBD.php");

        $sql = "SELECT * FROM Vehicules WHERE IdLoueur=:idloueur";

        try {
            $commande = $pdo->prepare($sql);
            $commande->bindParam(':idloueur', $_SESSION['profil']['IdLoueur'], PDO::PARAM_INT);
            $commande->execute();
            while ($vehicule = $commande->fetch(PDO::FETCH_ASSOC)) {
                array_push($vehicules, $vehicule);
            }
            $_SESSION['Vehicules'] = $vehicules;
            return true;
        }
        catch (PDOException $e) {
            echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
            die(); // On arrête tout.
            return false;

        }
    }

    function verif_ajoute($type, $prix, $caracteristique) {
		require ("Model/General/generalconnectBD.php");
			$idloueur=$_SESSION['profil']['IdLoueur'];
			$sql="SELECT * FROM Vehicules WHERE Type=:type AND Caracteristiques=:carac AND Prix=:prix AND IdLoueur=:idloueur";
		try {
			$commande=$pdo->prepare($sql);
			$commande->bindParam(':type', $type, PDO::PARAM_STR); 
			$commande->bindParam(':idloueur',$idloueur,PDO::PARAM_INT);
            $commande->bindParam(':carac', $caracteristique, PDO::PARAM_STR);
            $commande->bindParam(':prix', $prix, PDO::PARAM_INT);
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

	function insertion_voiture($type, $prix, $caracteristique, $photo){
        require ("Model/General/generalconnectBD.php");
		
        $sql="INSERT INTO Vehicules (IdLoueur,Type, Prix, Caracteristiques, Location, Photo) 
              VALUES(:idloueur, :type, :prix, :caracteristiques, 'Disponible', :photo)";
		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':idloueur', $_SESSION['profil']['IdLoueur'], PDO::PARAM_INT);
			$commande->bindParam(':type', $type, PDO::PARAM_STR);
			$commande->bindParam(':prix', $prix, PDO::PARAM_INT);
            $commande->bindParam(':caracteristiques', $caracteristique, PDO::PARAM_STR);
            $commande->bindParam(':photo', $photo, PDO::PARAM_STR);
			if ($commande->execute()){
				return true;
			}
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de insert : " . $e->getMessage() . "\n");
			die();
			return false;
		}
	}

    function supprimer_voitures($checkbox) {
        require ("Model/General/generalconnectBD.php");

        if ($checkbox != '') {
            for ($i = 0; $i < count($checkbox); $i++) {
                $sql = "DELETE FROM Vehicules WHERE IdVehicule=:idvehicule";
    
                try {
                    $commande = $pdo->prepare($sql);
                    $commande->bindParam(':idvehicule', $checkbox[$i], PDO::PARAM_INT);
                    $commande->execute();
                }
                catch (PDOException $e) {
                    echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
                    die(); // On arrête tout.
                    return false;
                }
            }
            return true;
        }
        else {
            return false;
        }    
    }

    function revision_voitures($checkbox) {
        require ("Model/General/generalconnectBD.php");
        
        if ($checkbox != '') {
            for ($i = 0; $i < count($checkbox); $i++) {

                $sql = "UPDATE Vehicules SET Location='En revision' WHERE IdVehicule=:idvehicule ";
				
                try {
                    $commande = $pdo->prepare($sql);
                    $commande->bindParam(':idvehicule', $checkbox[$i], PDO::PARAM_INT);
                    $commande->execute();
                }
                catch (PDOException $e) {
                    echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
                    die(); // On arrête tout.
                    return false;
                }
            }
            return true;
        }
        else {
            return false;
        }    
    }

	function disponible_voitures($checkbox) {
        require ("Model/General/generalconnectBD.php");

        if ($checkbox != '') {
            for ($i = 0; $i < count($checkbox); $i++) {
				
                $sql = "UPDATE Vehicules SET Location='Disponible' WHERE IdVehicule=:idvehicule ";
    
                try {
                    $commande = $pdo->prepare($sql);
                    $commande->bindParam(':idvehicule', $checkbox[$i], PDO::PARAM_INT);
                    $commande->execute();
                }
                catch (PDOException $e) {
                    echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
                    die(); // On arrête tout.
                    return false;
                }
            }
            return true;
        } 
        else {
            return false;
        }    
    }
?>
