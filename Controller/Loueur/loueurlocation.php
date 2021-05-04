<?php 
    function loueurlocation() {
		$msg = '';
        $vehicules = array();        
        require ("Model/Loueur/loueurlocationBD.php");
        loueur_afficher_voiture($vehicules);
        require ("View/Loueur/loueurlocation.tpl");
    }

    function gestion(){
        $checkbox = isset($_POST['checkbox'])?($_POST['checkbox']):'';
        require ("Model/Loueur/loueurlocationBD.php");
		$msg = '';
        $vehicules = array();
        
        if ($_POST['action'] == 'supprimer' && !supprimer_voitures($checkbox)) {
                $msg = "Aucune voiture choisi";
                require ("View/Loueur/loueurlocation.tpl");
        }
        else if ($_POST['action']== 'disponible' && !disponible_voitures($checkbox)) {
                $msg = "Aucune voiture choisi";
                require ("View/Loueur/loueurlocation.tpl");
        }
        else if ($_POST['action']== 'revision' && !revision_voitures($checkbox)) {
                $msg = "Aucune voiture choisi";
                require ("View/Loueur/loueurlocation.tpl");
        }
        else if (!loueur_afficher_voiture($vehicules)) {
            $msg = "Erreur d'affichage";
            require ("View/Loueur/loueurlocation.tpl");
        }
        else {
            require ("View/Loueur/loueurlocation.tpl");
        }
    }

    function ajoute() {
        $type = isset($_POST['type'])?($_POST['type']):'';
        $prix = isset($_POST['prix'])?($_POST['prix']):'';
        $caracteristique = isset($_POST['caracteristique'])?($_POST['caracteristique']):'';
        $photo = isset($_POST['photo'])?($_POST['photo']):'';
        $msg='';
    
        require ("Model/Loueur/loueurlocationBD.php");
        if (count($_POST) == 0) {
            require ("View/Loueur/loueurajout.tpl");
        }
        else {
            $profil = array();
            if (!ajoute_verification($type, $prix, $caracteristique)) {
                $msg = "Erreur de saisie";
				require ("View/Loueur/loueurajout.tpl");
            }
            else if (!verif_ajoute($type, $prix, $caracteristique)) {
                $msg = "Le voiture existe deja";
				require ("View/Loueur/loueurajout.tpl");
            }
            else if (!insertion_voiture($type, $prix, $caracteristique,$photo)) {
                $msg = "Erreur d'ajout";
                require ("View/Loueur/loueurajout.tpl");
                }
            else {
				require ("View/Loueur/loueurajout.tpl");
                echo ("Ajout de voiture réussi");
            }
        }
    }
    
    function ajoute_verification($type, $prix, $caracteristique) {
		if (!preg_match("/[a-zA-Z\s\d]$/", $type)) {
            return false;
        }
        if (!preg_match("/\d$/",  $prix)) {
            return false;
        }
        if (!preg_match("/[a-zA-Z\d\.]$/", $caracteristique)) {
            return false;
        }   
        return true;
    }
?>