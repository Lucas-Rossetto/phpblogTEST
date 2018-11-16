<?php
    if(!empty($_POST)){
        if(!empty($_POST['title']) && !empty($_POST['content'])){
            $title = $_POST['title'];
            $content = $_POST['content'];
            $image = $_POST['image'];
            $author = ($_POST['author']);
            $pdo = Database::connect();
            $req = $pdo -> prepare('INSERT into article(title_art,content_art ,image_art,author_art) VALUES(?,?,?,?)');
            $req -> execute([$title ,$content, $image]);
            $id_article = $pdo -> lastInsertId();
            $_SESSION['flash']['success'] = 'Article ajouté';
            echo "<script>redirection(\"index.php?page=view&id=$id_article\")</script>";
            Database::disconnect();
            exit();
        }else{
            $_SESSION['flash']['danger'] = 'Veuillez vérifier les données saisies';
        }
    getErrors();
    }
    include ('./include/forms/formArticle.php');