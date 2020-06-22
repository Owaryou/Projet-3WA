<?php
session_start();
require 'library/database.class.php';
require 'models/user.class.php';

$db = DB::getMysqlConnexionWithPDO();
$user = new User($db);

if(isset($_GET['action'])){

    session_destroy();
    header('Location: index.php');
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="src/css/flexslider.css" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
    <script src="src/js/jquery.flexslider.js"></script>
    <script src="src/js/form.js"></script>
    <script type="text/javascript" charset="utf-8">
$(window).load(function() {
  $('.flexslider').flexslider({
    animation: "slide"
  });
});
    </script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" />
    <link rel="stylesheet" href="src/css/style.css" />
    <title>Projet 3WAcademy</title>
</head>
<body>
    <header>
        <div>
            <a href="index.php"><img src="src/img/logo.jpg" alt="logo"></img></a>
                    <?php if(isset($_SESSION['user'])) { ?>
                        <nav>
                            <a href="panier.php"><h1>Mon Panier</h1><i class="fas fa-shopping-cart"></i></a>
                            <a href="index.php?action=logout"><h1>Se déconnecter</h1><i class="far fa-user-circle"></i></a>
                        </nav>
                    <?php } else { ?>
                        <nav>
                            <a href="authentification.php"><h1>S'enregistrer/ Se connecter</h1><i class="far fa-user-circle"></i></a>
                        </nav>
                    <?php } ?>
        </div>
        <nav class="presentation">
            <a href="product.php#nems"><h1>Nems</h1></a>
            <a href="product.php#plats"><h1>Plats</h1></a>
            <a href="product.php#sushis"><h1>Sushis</h1></a>
            <?php
                if(isset($_SESSION['user'])) {
            ?>
                    <a href="account.php"><h1><?php echo $_SESSION['user']['nom']?> <?php echo $_SESSION['user']['prenom']?></h1></a>
            <?php } ?>
        </nav>
    </header>