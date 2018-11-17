<div class="pc row" >
    <h1>
        <strong>Gestion des utlisateurs   </strong>
        <a href="index.php?page=addUser" class="btn btn-success btn-lg"><span class="glyphicon glyphicon-plus"></span> Ajouter un utilisateur</a>
    </h1>
    <table class="table table-bordered admin " style="font-family: 'Roboto Condensed'">
        <thead ">
        <tr style="font-weight: bold;">
            <th>ID</th>
            <th>Nom</th>
        </tr>
        </thead>
        <tbody>
        <?php
        $db = Database::connect();
        $statement = $db->query('SELECT * FROM user');

        while($user = $statement->fetch())
        {
            $post  =  '<tr>
                        <td>'. $user['id'] .'</td>
                        <td>'. $user['username'].'</td>
                        <td>
                        <a class="btn btn-primary" href="index.php?page=update_user&amp;id='.$user['id'].'"><span class="glyphicon glyphicon-pencil"></span> Ajouter un rôle</a>
                        <a class="btn btn-danger" href="index.php?page=delete_user&amp;id='.$user['id'].'"><span class="glyphicon glyphicon-remove"></span> Supprimer ce rôle</a>
                        </td> 
                       </tr>';
            echo $post;
        }

        Database::disconnect();
        ?>  </tbody>
    </table>
</div>