<?php
include "header.php";
require 'controllers/UserController.php';

$userManager = new User($db);

if(isset($_GET['update']))
{
    $userManager->update($_POST['id'],$_POST['prenom'],$_POST['nom'],$_POST['email'],$_POST['tel'],$_POST['adresse']);
    $_SESSION['user'] = $userManager->getUserByName($_POST['nom']);
    header('Location: account.php?message=1');
}
?>
<main class="container">
  <?php if(isset($_GET['message'])){echo "<h2 class='erreurauthentification'>Votre compte a bien été changé !";} ?>
  <h1>Votre compte</h1>
  <form action="account.php?update=true" method="post">
    <fieldset>
        <legend>Données personnel</legend>
        <input type="hidden" name="id" value="<?php echo $_SESSION['user']['id']?>"><br>
        <label for="prenom">Prénom</label>
        <input type="text" name="prenom" id="prenom" value="<?php echo $_SESSION['user']['prenom']?>"><br>
        <label for="nom">Nom</label>
        <input type="text" name="nom" id="nom" value="<?php echo $_SESSION['user']['nom']?>">
        <label for="email">Email</label>
        <input type="email" name="email" id="email" value="<?php echo $_SESSION['user']['email']?>"><br>
        <label for="tel">Téléphone</label>
        <input type="text" name="tel" id="tel" value="<?php echo $_SESSION['user']['tel']?>"><br>
        <label for="adresse">Adresse</label>
        <input type="text" name="adresse" value="<?php echo $_SESSION['user']['adresse']?>"><br>
    </fieldset>
        <p><input type="submit" name="update" value="Sauvegarder"></p>
    </form>
</main>
<?php include "footer.php"; ?>