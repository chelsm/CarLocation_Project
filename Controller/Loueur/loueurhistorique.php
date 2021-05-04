<?php
    function loueurhistorique() {

        $utilisateur = $_SESSION['utilisateur'];
        $facturationhistoriques = array();
        $lignesfacturationhistoriques = array();
        $msg = '';
        require ("Model/Loueur/loueurhistoriqueBD.php");

        loueur_afficher_historique_facturation($facturationhistoriques);
        loueur_afficher_historique_lignesfacturation($lignesfacturationhistoriques);
        require ("View/Loueur/loueurhistorique.tpl");      
    }
?>
