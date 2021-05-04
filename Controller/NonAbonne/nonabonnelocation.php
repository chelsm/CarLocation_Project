<?php
    function nonabonnelocation() {

        $vehicules = array();
        require ("Model/NonAbonne/nonabonnelocationBD.php");
        
        nonabonne_afficher_voiture($vehicules);
        require ("View/NonAbonne/nonabonnelocation.tpl");
    }
?>