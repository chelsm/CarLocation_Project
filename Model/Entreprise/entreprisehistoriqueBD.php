<?php
    function entreprise_afficher_historique_facturation(&$facturationhistoriques) {
        require ("Model/General/generalconnectBD.php");

         $sql = "SELECT F.IdFacturation FROM Facturation AS F WHERE F.IdEntreprise=:identreprise";

        try {
            $commande = $pdo->prepare($sql);
            $commande->bindParam(':identreprise', $_SESSION['profil']['IdEntreprise'], PDO::PARAM_INT);
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

    function entreprise_afficher_historique_lignesfacturation(&$lignesfacturationhistoriques) {
        require ("Model/General/generalconnectBD.php");

         $sql = "SELECT LF.IdFacturation, L.Marque, LF.DateDebut, LF.DateFin, V.Type, V.Prix FROM Loueurs AS L, Facturation AS F, LignesFacturation AS LF, Vehicules AS V 
                 WHERE F.IdEntreprise=:identreprise AND F.IdFacturation=LF.IdFacturation AND V.IdVehicule=LF.IdVehicule AND L.IdLoueur=V.IdLoueur";

        try {
            $commande = $pdo->prepare($sql);
            $commande->bindParam(':identreprise', $_SESSION['profil']['IdEntreprise'], PDO::PARAM_INT);
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
