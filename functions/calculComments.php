<?php
    function calculComments($idarticle,$bdd ){
        $sql = $bdd-> prepare('SELECT count(T_COMMENTS_ID_COMMENT) as nbrArt from t_articles_has_t_users Where T_ARTICLES_ID_ARTICLE = ?');
        $sql ->execute([$idarticle]);
        $nbr = $sql -> fetch();
        return $nbr['nbrArt'];
    }