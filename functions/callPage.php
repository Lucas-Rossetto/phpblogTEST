<?php
function callPage() {
    if (isset($_GET['page'])) {
        if  ($_GET['page'] == "")
            $page = "accueil";
        else
            $page = $_GET['page'];
    }
    else {
        $page = "accueil";
    }
    $page = "./include/" . $page . ".inc.php";
    $incFiles = glob("./include/*.inc.php");
    if (in_array($page, $incFiles)) {
        include($page);
    }
}