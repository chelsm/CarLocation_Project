<!doctype html>
<html lang="fr">

<head>
	<meta charset="utf-8">
	<title>ChenWheels</title>
	<link rel="stylesheet" href="View/Design/css/style.css">
	<link rel="stylesheet" href="View/Design/bootstrap/css/bootstrap.min.css">
</head>

<body class ="body-location">
    <header>
		<div class="background-image-container bg-location">
			<div class="background-image-overlay"></div>
                <?php require("Controller/General/generalmenu.php"); generalmenu(); ?>
                <div class="cadre">
                    <div class="txt animated pulse ">
                        <h1 style ="color : white">Louez plus qu'une voiture</h1>
                        <p style ="color : white">Le pouvoir de rouler moins cher </p>
                    </div>
                </div>
            </div>
		</div>
	</header>

    <div class=" content" style="padding-top :50px">
        <form action ='index.php?dossier=Entreprise&controller=entrepriselocation&function=entrepriselocation2' method = 'POST'>
            <?php 
                $vehicules = $_SESSION['Vehicules'];

                foreach ($vehicules as $vehicule) {
                    echo '<div class = "container">',

                        '<div class = " box boxL">',
                            "<img src = View/Design/images/", $vehicule['Photo'] . "  > ",
                        '</div>',

                        '<div class = " box boxR">',

                            '<div class ="boxR-prix">',
                                '<p class="prix-bloc"> '. $vehicule['Prix'] . " euros/jour" .'</p>',
                            '</div>',

                        '<table>',
                            '<tr><th> Modèle </th> <th> Caracteristiques </th><th> Ajouter </th></tr>',
                                    '<tr>',
                                        '<td>' . $vehicule['Type'] . '</td>',
                                        '<td>' . $vehicule['Caracteristiques'] . '</td>',
                                        '<td>' . "<input type='checkbox' value='".$vehicule['IdVehicule']."' name='checkbox[]'>". '</td>',
                                    '</tr>',    
                            '</table>',
                        '</div>',

                    '</div>';
                }

            ?>        
            <button type="submit"class="btn btn-connexion btn-outline-dark" style="float : right; margin: 0px 50px 50px 0px">Confirmer</button>
        </form>
        <?php echo $msg ?>
    </div>









			
	<?php include("View/General/generalfooter.tpl"); ?>





    
</body>
</html>