<?php



if(isset($_POST['formulaire'])) {
        $tabErreur = array();
        $nom = $_POST['name'];
        $mdp = $_POST['password'];

        if ($_POST['name'] == "") {
            $tabErreur['name'] = 'Veuillez saisir votre nom';
        }

        if ($_POST['password'] == "") {
            $tabErreur['password'] = 'Veuillez saisir votre mdp ';
        }

        if (empty($tabErreur)) {
            $pdo = Database::connect();
            $sql = $pdo->prepare('INSERT into user (username,password) VALUES(?,?)');
            $mdpr = $_POST['password'];
            $sql->execute(array($nom,$mdp));
            $user_id = $pdo->lastInsertId();
            Database::disconnect();
            echo header('Location: index.php');
            exit();
        }
    } else {
        echo '<h2>Verification failed</h2>';


}

include("./include/forms/formInscription.php");














