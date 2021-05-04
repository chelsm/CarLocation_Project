<?php
    
    function generalmenu(){
        if (!empty($_SESSION['utilisateur'])) {
            $utilisateur = $_SESSION['utilisateur'];
        }
        else {
            $utilisateur = '';
        }
        if ($utilisateur == "loueur") {
            return include("View/Loueur/loueurmenu.tpl");
        }
        else if ($utilisateur == "entreprise") {
            return include("View/Entreprise/entreprisemenu.tpl");
        }
        else {
            return include("View/NonAbonne/nonabonnemenu.tpl");
        }
    }

?>