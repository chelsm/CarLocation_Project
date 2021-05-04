<?php 
	session_start ();

	if ((count($_GET)!=0) && !(isset($_GET['controller']) && isset ($_GET['function']))) {
		require ('./vue/erreur404.tpl');
	}
	else if (count($_GET)==0) {
			$dossier = "General";
			$controller = "generalgestion";
			$function = "generalaccueil";
	}
	else if (isset($_GET['dossier']) && isset($_GET['controller']) && isset ($_GET['function'])) {
		$dossier = $_GET['dossier'];
		$controller = $_GET['controller'];
		$function =  $_GET['function'];	
	}
	require ('Controller/'.$dossier.'/'.$controller.'.php');
	$function();

?>
