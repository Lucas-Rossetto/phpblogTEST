<div class="col-sm-6">

    <section class="blockL blockA">
       <div class="row">
           <div class="col-xs-12">
               <h2>  Derniers articles :  </h2>
               <hr>
               <?php
               $db        = Database::connect();
               $sql2      = $db -> query('SELECT * FROM `article` ORDER BY `title_art` DESC LIMIT 5');
               $articles  = $sql2 -> fetchAll();
               foreach ($articles as $article ){
                   echo '<div class="row">
                              <div class="col-xs-6 limg">
                                     <img  src="./assets/img/post.jpg" class="thumbnail img-responsive">
                              </div>
                              <div class="col-xs-6 aside">
                                    <p>'.$article['title_art'].'</p>
                              </div>
                         </div>'
                   ;
               }
               Database::disconnect();
               ?>
           </div>
       </div>
    </section>

</div>