<?php
    function entreprise_afficher_voiture($vehicules) {
        require ("Model/General/generalconnectBD.php");

        $sql = "SELECT * FROM Vehicules WHERE Location='Disponible'";

        try {
            $commande = $pdo->prepare($sql);
            $commande->execute();
            while ($vehicule = $commande->fetch(PDO::FETCH_ASSOC)) {
                array_push($vehicules, $vehicule);
            }
			$_SESSION['Vehicules'] = $vehicules;
        }
        catch (PDOException $e) {
            echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
            die(); // On arrête tout.
        }
    }

    function entreprise_afficher_voiture_selectionne($checkbox, &$vehicules) {
        require ("Model/General/generalconnectBD.php");

        if ($checkbox != '') {
            for ($i = 0; $i < count($checkbox); $i++) {
                $sql = "SELECT * FROM Vehicules WHERE IdVehicule=:idvehicule";
    
                try {
                    $commande = $pdo->prepare($sql);
                    $commande->bindParam(':idvehicule', $checkbox[$i], PDO::PARAM_INT);
                    $commande->execute();
                    while ($vehicule = $commande->fetch(PDO::FETCH_ASSOC)) {
                        array_push($vehicules, $vehicule);
                    }
                    $_SESSION['Vehicules'] = $vehicules;
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

    function entreprise_insertion_facturation($IdEntreprise) {
		require ("Model/General/generalconnectBD.php");
		$sql="INSERT INTO Facturation (IdEntreprise, MontantTotal, Reglement) VALUES(:identreprise, 0, 'Non')";

		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':identreprise', $IdEntreprise, PDO::PARAM_INT);
			if ($commande->execute()){
				$IdFacturation = $pdo->lastInsertId();
				$_SESSION['Facturation']['IdFacturation'] = $IdFacturation;
				return true;
			}
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de insert : " . $e->getMessage() . "\n");
			die();
			return false;
		}
	}

	function entreprise_insertion_lignesfacturation($IdFacturation, $IdVehicule, $dateDebut, $dateFin) {
		require ("Model/General/generalconnectBD.php");

		$sql="INSERT INTO LignesFacturation (IdFacturation, IdVehicule, DateDebut, DateFin) VALUES(:idfacturation, :idvehicule, :datedebut, :datefin)";

		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':idfacturation', $IdFacturation, PDO::PARAM_INT);
			$commande->bindParam(':idvehicule', $IdVehicule, PDO::PARAM_INT);
			$commande->bindParam(':datedebut', $dateDebut, PDO::PARAM_STR);
			$commande->bindParam(':datefin', $dateFin, PDO::PARAM_STR);
			if ($commande->execute()) {
				return true;
			}
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de insert : " . $e->getMessage() . "\n");
			die();
			return false;
		}				
	}

	function entreprise_modification_vehicule($IdVehicule) {
		require ("Model/General/generalconnectBD.php");

		$sql = "UPDATE Vehicules SET Location='Indisponible' WHERE IdVehicule=:idvehicule";

		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':idvehicule', $IdVehicule, PDO::PARAM_INT);
			if ($commande->execute()) {
				return true;
			}
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de insert : " . $e->getMessage() . "\n");
			die();
			return false;
		}	
	}

	function entreprise_modification_facturation($IdFacturation, $MontantTotal) {
		require ("Model/General/generalconnectBD.php");

		$sql = "UPDATE Facturation SET MontantTotal=:montanttotal WHERE IdFacturation=:idfacturation";

		try {
			$commande = $pdo->prepare($sql);
			$commande->bindParam(':idfacturation', $IdFacturation, PDO::PARAM_INT);
			$commande->bindParam(':montanttotal', $MontantTotal, PDO::PARAM_INT);
			if ($commande->execute()) {
				return true;
			}
		}
		catch (PDOException $e) {
			echo utf8_encode("Echec de insert : " . $e->getMessage() . "\n");
			die();
			return false;
		}		
	}

	function entreprise_afficher_lignesfacturation($IdFacturation, &$LignesFacturation) {
        require ("Model/General/generalconnectBD.php");
        
		$sql = "SELECT V.Type, LF.DateDebut, LF.DateFin, V.Prix FROM LignesFacturation AS LF, Vehicules AS V WHERE LF.IdFacturation=:idfacturation AND LF.IdVehicule=V.IdVehicule";
		
        try {
            $commande = $pdo->prepare($sql);
            $commande->bindParam(':idfacturation', $IdFacturation, PDO::PARAM_INT);
            $commande->execute();
            while ($LigneFacturation = $commande->fetch(PDO::FETCH_ASSOC)) {
                array_push($LignesFacturation, $LigneFacturation);
			}
			$_SESSION['LignesFacturation'] = $LignesFacturation;
        }
        catch (PDOException $e) {
            echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
            die(); // On arrête tout.
        }
	}

	function entreprise_paiement() {
        require ("Model/General/generalconnectBD.php");

        $sql = "UPDATE Facturation SET Reglement='Oui' WHERE IdFacturation=:idfacturation ";
				
        try {
            $commande = $pdo->prepare($sql);
            $commande->bindParam(':idfacturation',$_SESSION['Facturation']['IdFacturation'] , PDO::PARAM_INT);
			$commande->execute();
			return true;
        }
        catch (PDOException $e) {
            echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
            die(); // On arrête tout.
            return false;
        }
    }
?>
