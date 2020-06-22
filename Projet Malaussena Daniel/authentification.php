<?php
include "header.php";
require 'controllers/UserController.php';

$userManager = new User($db);

if(isset($_POST['emaillog']) && isset($_POST['mdp'])){
  if($userManager->checkMdp($_POST['emaillog'], $_POST['mdp']))
  {
      $userTemp = $userManager->getUserByEmail($_POST['emaillog']);
      $_SESSION['user'] = $userTemp;
      $_SESSION['nbProducts'] = 0;
      header('Location: index.php');
  }
  else{
    $message="Email ou mot de passe incorrect";
  }
}

if(isset($_POST['email']))
{
    if($_POST['password1'] == $_POST['password2'])
    {
    $user = new UserController(
        [
            'nom' => $_POST['nom'],
            'prenom' => $_POST['prenom'],
            'email' => $_POST['email'],
            'tel' => $_POST['tel'],
            'password' => $_POST['password1'],
            'adresse' => $_POST['adresse']
        ]
        );
    if($user->add())
    {
        $userManager->add($user);
    }
    $userTemp = $userManager->getUserByEmail($_POST['email']);
    $_SESSION['user'] = $userTemp;
    $_SESSION['nbProducts'] = 0;
    header('Location: index.php');
    }else{
        $message="Mot de passe non indentique";
    }
}
?>
<main class="container">
  <?php if(isset($message)) echo "<h2 class='erreurauthentification'> $message </h2>" ?> 
    <h1>Créer un compte</h1>
    <form action="authentification.php" id="inscription" method='post'>
      <fieldset>
        <legend>Contact</legend>
          <label for="nom">Nom</label>
          <input type="text" name="nom" id="nom" value="" placeholder="Nom" onClick="saisie('Nom',this.id)" onMouseOut="retablir('Nom',this.id)" required><br>
          <label for="prenom">Prénom</label>
          <input type="text" name="prenom" id="prenom" value="" placeholder="Prenom" onClick="saisie('Prenom',this.id)" onMouseOut="retablir('Prenom',this.id)" required><br>
          <label for="emailinscription">Email</label>
          <input type="email" name="email" id="emailinscription" value="" placeholder="Email" onClick="saisie('Email',this.id)" onMouseOut="retablir('Email',this.id)" required><br>
          <label for="tel">Téléphone</label>
          <input type="text" name="tel" id="tel" value="" placeholder="Téléphone" onClick="saisie('Téléphone',this.id)" onMouseOut="retablir('Téléphone',this.id)" required><br>
          <label for="adresse">Adresse</label>
          <input type="text" name="adresse" id="adresse" value="" placeholder="Adresse" onClick="saisie('Adresse',this.id)" onMouseOut="retablir('Adresse',this.id)" required><br>
      </fieldset>
      <fieldset>
        <legend>Mot de passe</legend>
          <label for="password1">Mot de passe</label>
          <input type="password" name="password1" id="password1" value="" required></br>
          <label for="password2">Vérification</label>
          <input type="password" name="password2" id="password2" value="" required></br>
      </fieldset>
      <p><input type="submit" name="add" value="S'enregister"></p>
    </form>
    <h1>Se connecter</h1>
    <form action="authentification.php" method="post">
      <fieldset>
        <legend>Connexion</legend>
          <label for="emailconnexion">Email</label>
          <input type="email" name="emaillog" id="emailconnexion" value="" required></br>
          <label for="mdp">Mot de passe</label>
          <input type="text" name ="mdp" id="mdp" value="" required></br>
      </fieldset>
    <p><input type="submit" name="log" value="Se connecter"></p>
    </form>    
</main>
<?php include "footer.php"; ?>