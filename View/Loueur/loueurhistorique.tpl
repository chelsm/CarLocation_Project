<!doctype html>
<html lang="fr">

<head>
	<meta charset="utf-8">
	<title>ChenWheels</title>
	<link rel="stylesheet" href="View/Design/css/style.css">
	<link rel="stylesheet" href="View/Design/bootstrap/css/bootstrap.min.css">
</head>

<body class ="body-ajoutvoiture">
    <header>
		<div class="background-image-container bg-historique">
			<div class="background-image-overlay"></div>
				<?php require("Controller/General/generalmenu.php"); generalmenu(); ?>
				<div class="cadre">
					<div class="txt animated pulse ">
						<h1 style ="color : black">Louez plus qu'une voiture</h1>
						<p style ="color : black">Le pouvoir de rouler moins cher </p>
					</div>
				</div>
			</div>
		</div>
	</header>

    <div class=" content" style="padding-top :50px">
        <section>
            <div class = "wrapper wrapper-historique">
                <br>
                <center>Historique des véhicules que vous avez loué</center>
                <?php 
                    $facturationhistoriques = $_SESSION['FacturationHistoriques'];
                    $lignesfacturationhistoriques = $_SESSION['LignesFacturationHistoriques'];

                    foreach ($facturationhistoriques as $facturationhistorique) { 
                        echo
                        '<details>',
                            '<summary>Facture #'. $facturationhistorique['IdFacturation'] . ' </summary>';
                            foreach ($lignesfacturationhistoriques as $lignesfacturationhistorique) { 
                                if ($facturationhistorique['IdFacturation'] == $lignesfacturationhistorique['IdFacturation']) {
                                    echo
                                    '<table>',
                                        '<tr style="background-color: rgba(0,0,0,0.5);">',
                                            '<th scope="row"> Marque </th>',
                                            '<td>' . $lignesfacturationhistorique['Marque'] . '</td>',
                                        '</tr>',
                                        '<tr>',
                                            '<th scope="row"> Dates de location </th>',
                                            '<td> Du ' . $lignesfacturationhistorique['DateDebut'] .  ' au '  . $lignesfacturationhistorique['DateFin'] . '</td>',
                                        '</tr>',
                                        '<tr>',
                                            '<th scope="row"> Vehicule </th>',
                                            '<td>' . $lignesfacturationhistorique['Type'] . '</td>', 
                                        '</tr>',
                                        '<tr>',
                                            '<th scope="row">Prix</th>',
                                            '<td>' . $lignesfacturationhistorique['Prix'] . '</td>', 
                                        '</tr>',
                                    '</table>';
                                }
                            }                                    
                        echo                                   
                        '</details>';
                    }
                ?>  
            </div>
        </section>
    </div>

    <?php include("View/General/generalfooter.tpl"); ?>
</body>



<html>