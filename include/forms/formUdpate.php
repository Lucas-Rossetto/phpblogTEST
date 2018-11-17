<div class="pc row">
    <div class="col-sm-8 col-sm-push-2 form">
        <h1><strong>Modifier un article</strong></h1>
        <br>
        <form class="form" action="#" role="form" method="post">
            <div class="form-group">
                <label for="Titre">Titre
                    <input style="width: 100%;" type="text" class="form-control" id="name" name="title" placeholder="Titre" value="<?php echo $title;?>">
                    <span class="help-inline"><?php echo $titleError;?></span>
            </div>
            <div class="form-group">
                <label for="article">Contenu
                    <textarea type="text" class="form-control" id="article" name="article" placeholder="article"><?php echo $article;?></textarea>
                    <span class="help-inline"><?php echo $articleError;?></span>
            </div>
            <div class="form-actions">
                <input type="submit" name ="update" class="btn btn-success" value="Modifier">
                <a class="btn btn-primary" href="index.php"><span class="glyphicon glyphicon-arrow-left"></span> Retour</a>
            </div>
        </form>
    </div>
</div>
