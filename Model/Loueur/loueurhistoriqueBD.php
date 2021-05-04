<?php

    function loueur_afficher_historique_facturation(&$facturationhistoriques) {
        require ("Model/General/generalconnectBD.php");

        $sql = "SELECT DISTINCT F.IdFacturation FROM Facturation AS F,LignesFacturation AS LF, Vehicules AS V 
                WHERE F.IdFacturation=LF.IdFacturation AND LF.IdVehicule=V.IdVehicule AND V.IdLoueur=:idloueur ORDER BY F.IdFacturation";

        try {
            $commande = $pdo->prepare($sql);
            $commande->bindParam(':idloueur', $_SESSION['profil']['IdLoueur'], PDO::PARAM_INT);
            $commande->execute();
            while ($facturationhistorique = $commande->fetch(PDO::FETCH_ASSOC)) {
                array_push($facturationhistoriques, $facturationhistorique);
            }
            $_SESSION['FacturationHistoriques'] = $facturationhistoriques;
            return true;
        }
        catch (PDOException $e) {
            echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
            die();
            return false;
        }
    }

    function loueur_afficher_historique_lignesfacturation(&$lignesfacturationhistoriques) {
        require ("Model/General/generalconnectBD.php");

         $sql = "SELECT LF.IdFacturation, E.Marque, LF.DateDebut, LF.DateFin, V.Type, V.Prix FROM Entreprises AS E, Facturation AS F, LignesFacturation AS LF, Vehicules AS V 
                 WHERE F.IdEntreprise=E.IdEntreprise AND F.IdFacturation=LF.IdFacturation AND V.IdVehicule=LF.IdVehicule AND V.IdLoueur=:idloueur";

        try {
            $commande = $pdo->prepare($sql);
            $commande->bindParam(':idloueur', $_SESSION['profil']['IdLoueur'], PDO::PARAM_INT);
            $commande->execute();
            while ($lignesfacturationhistorique = $commande->fetch(PDO::FETCH_ASSOC)) {
                array_push($lignesfacturationhistoriques, $lignesfacturationhistorique);
            }
            $_SESSION['LignesFacturationHistoriques'] = $lignesfacturationhistoriques;
            return true;
        }
        catch (PDOException $e) {
            echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
            die();
            return false;
        }
    }
?>
