    <?php
    if(!empty($_POST) && !empty($_POST['username']) && !empty($_POST['password'])){

        $password = $_POST['password'];
        $mdp = sha1($password);
        $connexion = Database::connect();
        $req = $connexion ->prepare('SELECT * FROM user WHERE username = :username AND password = :password');
        $req->execute(['username' => $_POST['username'],'password' => $mdp]);
        $user = $req->fetch();

        if($user){
            $_SESSION['auth'] = $user;
            echo header('Location: index.php?page=moncompte');
        }else{
            $_SESSION['flash']['danger'] = "Veuillez vérifier les coordonnées saisie !";
        }
    }

    include ('./include/forms/formLogin.php');

