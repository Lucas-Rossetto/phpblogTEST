<?php
    if(isset($_POST['change']) && !empty($_GET['id'])){
            $tabErreur = array();
            $id_user = $_SESSION['auth']['id'];
            $name = $_POST['name'];
            if($_POST['name'] == ""){
                $tabErreur['name'] = 'veuillez saisir votre nom ';
            } else {
                $pdo = Database::connect();
                $req = $pdo -> prepare('SELECT id From user where username = ?');
                $req -> execute([$_POST['name']]);
                $user = $req -> fetch();
                if($user){
                    $tabErreur['name'] = "Ce nom est déja pris ";
                }
                Database::disconnect();
            }

            if(empty($tabErreur)){
                $pdo = Database::connect();
                $sql = $pdo -> prepare('UPDATE user set username = ? WHERE id = ?');
                $sql -> execute(array($pseudo,$id_user));
                Database::disconnect();
                $_SESSION['flash']['success'] = "Votre pseudo bien été modifié";
                echo header('Location: index.php?page=mocompte');
                exit();
            }
        }
        getErrors();

?>
<div class="pc">
    <div class="formSign col-xs-8 row col-xs-push-2">
        <h1 style="text-align: center">Changer Pseudo </h1>
        <?php
        if(isset($_POST['change'])){
            if(!empty($tabErreur)){
                $alert = '<div class ="alert alert-danger "><ul>';
                foreach ($tabErreur as $key => $value) {
                    // $arr[3] sera mis à jour avec chaque valeur de $arr...
                    $alert .= "<li style='display:block;text-align: left'>{$key} : {$value}</li>";
                }
                $alert .= '</ul> </div>';
                echo $alert;
            }
        }

        ?>
        <div class="col-xs-12">
            <form action="#" method="post">
                <div class="form-group">
                    <input class = "form-control" type="text" name="pseudo" id ="pseudo" placeholder=" Votre Pseudo ">
                </div>
                <div class="form-group">
                    <input type="submit" value="Envoyer" name="change" class="btn btn-info btn-lg">
                    <input type="reset" value="Effacer" class="btn btn-warning btn-lg">
                </div>
            </form>
        </div>

    </div>
</div>