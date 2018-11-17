<div class="pc row">
    <div class="col-sm-8 col-sm-push-2 form">
        <h1><strong>Ajouter un utilisateur</strong></h1>
        <br>
        <div class="text-danger"><?php echo $userError;?></div>
        <form class="form" action="#" role="form" method="post">
            <div class="form-group">
                <label for="name">Nom
                    <input style="width: 100%;" type="text" class="form-control" id="name" name="name" value="<?php echo $name;?>">
                    <div class="text-danger"><?php echo $nameError;?></div>
            </div>
            <div class="form-group">
                <label for="password">Mot de passe
                    <input type="text" class="form-control" id="pseudo" name="password">
                    <div class="text-danger"><?php echo $mdpError;?></div>
            </div>
            </div>
            <div class="form-actions">
                <input type="submit" name ="updateUser" class="btn btn-success" value="Modifier">
                <a class="btn btn-primary" href="index.php"><div class="glyphicon glyphicon-arrow-left"></div> Retour</a>
            </div>
        </form>
    </div>
</div>
