<?php
    function nonabonne_afficher_voiture($vehicules) {
        require ("Model/General/generalconnectBD.php");

        $sql = "SELECT * FROM Vehicules";

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
?>
