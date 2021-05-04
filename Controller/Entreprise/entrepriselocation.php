<?php
    function entrepriselocation1() {
        $vehicules = array();
        $msg = '';
        require ("Model/Entreprise/entrepriselocationBD.php");

        entreprise_afficher_voiture($vehicules);
        require ("View/Entreprise/entrepriselocation1.tpl"); 
    }

    function entrepriselocation2() {
        $checkbox = isset($_POST['checkbox'])?($_POST['checkbox']):'';
        $_SESSION['Checkbox'] = $checkbox;
        $vehicules = array();
        $msg = '';
        require ("Model/Entreprise/entrepriselocationBD.php");
        
        if(!entreprise_afficher_voiture_selectionne($checkbox, $vehicules)) {
            $msg = "Rien a été selectionné";
            require ("View/Entreprise/entrepriselocation1.tpl");
        }
        else {
            require ("View/Entreprise/entrepriselocation2.tpl");
        }
    }

    function entreprisefacture() {
		date_default_timezone_set('Europe/Paris');
		$checkbox = $_SESSION['Checkbox'];
		$MontantTotal = 0;
		$msg='';

		require ("Model/Entreprise/entrepriselocationBD.php");
		$dateDebut = isset($_POST['datedebut'])?($_POST['datedebut']):'';
		$dateFin = isset($_POST['datefin'])?($_POST['datefin']):'';
		$vehicules = $_SESSION['Vehicules'];

		$IdEntreprise = $_SESSION['profil']['IdEntreprise'];
		if (!entreprise_insertion_facturation($IdEntreprise)) {
			$msg = "Erreur d'insertion";
			require ("View/Entreprise/entrepriselocation2.tpl");
		}
		$IdFacturation = $_SESSION['Facturation']['IdFacturation'];
		for ($i = 0; $i < count($checkbox); $i++) {
			$IdVehicule = (int)$checkbox[$i];
			$DateDebutCalcul = new DateTime($dateDebut[$i]);
			$DateFinCalcul = new DateTime($dateFin[$i]);
			$nbJour = $DateDebutCalcul->diff($DateFinCalcul)->days;
			$Montant = entreprise_calculMontant($nbJour, $vehicules[$i]['Prix']);
			$MontantTotal += $Montant;

			if (!entreprise_insertion_lignesfacturation($IdFacturation, $IdVehicule, $dateDebut[$i], $dateFin[$i])) {
				$msg = "Erreur d'insertion";
				require ("View/Entreprise/entrepriselocation2.tpl");
			}
			if (!entreprise_modification_vehicule($IdVehicule)) {
				$msg = "Erreur de modification";
				require ("View/Entreprise/entrepriselocation2.tpl");
			}
        }
        $_SESSION['MontantTotal'] = $MontantTotal;
		if (!entreprise_modification_facturation($IdFacturation, $MontantTotal)) {
			$msg = "Erreur de modification";
			require ("View/Entreprise/entrepriselocation2.tpl");
        }
        else {
            $LignesFacturation = array();
            entreprise_afficher_lignesfacturation($IdFacturation, $LignesFacturation);
            require ("View/Entreprise/entreprisefacture.tpl");
        }
    }

    function entreprise_calculMontant($nbJour, $prix) {
        return ($nbJour * $prix);
    }

    function entreprisepaiement(){
        $msg='';
        require ("Model/Entreprise/entrepriselocationBD.php");
        
        if(!entreprise_paiement()){
            $msg = "Erreur de paiement";
            require ("View/Entreprise/entreprisefacture.tpl");
        }
        else{
            $msg = 'Paiement effectue';
            require ("View/Entreprise/entreprisefacture.tpl");
        }
    }
?>