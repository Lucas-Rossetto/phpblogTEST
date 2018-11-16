<?php
function pagination($perpage){
    $db = Database::connect();
    $sql = $db -> query('SELECT count(id_art) as nbrArt FROM article');
    $data = $sql -> fetch();
    $nbrArt = $data['nbrArt'];
    isset($_GET['p']) ? $pagec = $_GET['p'] : $pagec = 1;
    $nbPage = ceil($nbrArt/ $perpage);
    $index = ($pagec - 1 ) * $perpage;
    $query ="SELECT * FROM article ORDER by title_art DESC LIMIT $index,$perpage";
    $sql = $db -> query($query);
    while($row = $sql -> fetch()){
    $post = '<section class="post row">
                <div class="col-sm-6">
                    <a href="index.php?page=view&amp;id='.$row['id_art'].'">
                        <img src="./assets/img/post.jpg" alt="Post" class ="thumbnail img-responsive"/>
                    </a>
                </div>
                <div class="col-sm-6">
                    <h3> '. findCategories($row['id_art'], $db) .'</h3>
                    <h2> '. $row['title_art'] . '</h2>
                        <h4><span class="fc"><i class="fa fa-user-circle-o" aria-hidden="true"></i> '.findAuthor($row['id_art'],$db).'</span>
                            <span class="fc"><i class="fa fa-commenting-o" aria-hidden="true"></i> '.calculComments($row['id_art'],$db).' comments</span>
                        </h4>
                    <div class="article"> '. returnXWords(html_entity_decode($row['content_art']),225) . '</div>
                        <br>
                    <div class="link"><a href="index.php?page=view&amp;id='.$row['id_art'].'"> READ MORE >></a></div>
                </div>
              </section>';
    echo $post;
    Database::disconnect();
    }
    $pagination = "<div class=\"pagination\">";
    for ($i = 1 ; $i <= $nbPage ; $i++){
    $pagination .="<a href=\"index.php?p=$i\"> $i /</a>";
    }
    $pagination .= "</div>";
    echo $pagination;
}
//
