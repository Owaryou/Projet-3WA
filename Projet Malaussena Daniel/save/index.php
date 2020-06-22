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
    <title>Document</title>
</head>
<body>
<?php    
    if(isset($_SESSION['user'])) {
?>
        <h4>Bonjour <?php echo $_SESSION['user']['prenom']?></h4>
        <a href="index.php?action=logout"><button>Se déconnecter</button></a>
        <a href="account.php"><button>Mom compte</button></a>
        <a href="product.php"><button>Liste produit</button></a> <?php
    } else { ?>
<a href="authentification.php"><button>S'enregistrer/ Se connecter</button></a>
<a href="product.php"><button>Liste produit</button></a>
<?php } ?>
</body>
</html>