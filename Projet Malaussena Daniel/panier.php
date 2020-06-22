<?php
include "header.php";
require 'models/order.class.php';

$orderManager = new Order($db);
?>

<main class="container">
  <?php 
  
  if(isset($_POST['delete']))
  {
      $orderManager->delete($_POST['orderId'], $_POST['productId'],$_POST['delete']);
      
  }
  
  if(!isset($_SESSION['orderId'][0])){
      echo'<h2 id="erreurpanier">Votre panier est vide</h2>';
  }else{
    $items = $orderManager->getAllBaby($_SESSION['orderId'][0]);
    $globalPrice = $orderManager->getGlobalPrice($_SESSION['orderId'][0]);
    ?>
    <section class="panier">
    <h2>Votre Panier</h2>
    <section id="panier">
    <?php foreach($items as $item){ ?>
      <section id="panier-detail">
        <div id="panier-name">
          <h1> <?php echo $item['name'] ?> </h1>
        </div>
      </section>
      <section id="panier-quantity">
        <img src="src/img/<?= $item['category'] ?>/<?= $item['picture'] ?>" alt="<?= $item['name'] ?>" />
        <p>Quantité : <?php echo $item['quantity'] ?></p>
        <p>Prix à l'unité : <?php echo $item['price'] ?></p>
        <div class="panier-price">
        <form method="post" action="panier.php">
        <select name="delete" id="id_delete">
        <?php
        for($i=0;$i<=$item['quantity'];$i++)
        {
            echo '<option value="'.$i.'">'.$i.'</option>';
        }?>
        </select>
        <input type="hidden" name="orderId" value="<?php echo $_SESSION['orderId'][0] ?>">
        <input type="hidden" name="productId" value="<?php echo $item['id'] ?>">
        <button type="submit" class="btndetail">Supprimer</button>
        </form>
      </div>
      </section>
        <?php
    }
  } 
  
    if(isset($globalPrice)) echo "<h1> Total à payer $globalPrice[0] Euros</h1>"?>
</section>
</main>
<?php include "footer.php"; ?>