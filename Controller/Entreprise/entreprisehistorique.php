<?php
    function entreprisehistorique() {

        $utilisateur = $_SESSION['utilisateur'];
        $facturationhistoriques = array();
        $lignesfacturationhistoriques = array();
        $msg = '';
        require ("Model/Entreprise/entreprisehistoriqueBD.php");

        entreprise_afficher_historique_facturation($facturationhistoriques);
        entreprise_afficher_historique_lignesfacturation($lignesfacturationhistoriques);
        require ("View/Entreprise/entreprisehistorique.tpl");      
    }
?>