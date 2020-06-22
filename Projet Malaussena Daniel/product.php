<?php
include "header.php";
require 'models/product.class.php';
require 'models/order.class.php';
require 'controllers/ProductsController.php';

$productsManager = new Product($db);
$orderManager = new Order($db);

$productsNems = $productsManager->getAllNems();
$productsSushis = $productsManager->getAllSushis();
$productsPlats = $productsManager->getAllPlats();
?>

<main class="container">
  <?php if(isset($_GET['add'])) 
            {
              if(!isset($_SESSION['user']['id']))
                {
                  $message = "Veuillez vous connecter pour passer une commande";
                }
                else
            {
            if(!isset($_SESSION['orderId']))
            {
              $orderManager->addOrder($_SESSION['user']['id']);
              $orderId = $orderManager->getLastOrderId($_SESSION['user']['id']);              
              $_SESSION['orderId'] = $orderId[0];
              
            }
            else
            {
              
              // if(!isset($_GET['id']))
              // {
              //   //to do
              //   $orderManager->addProduct($_SESSION['orderId'],$product['id'],$product['price']);
              //   $_SESSION['nbProduct'] += 1;
              // }
              // else
              // {
                
                $orderManager->addProductToOrder($_SESSION['orderId'],$_GET['id'], $_GET['add']);

              //}
            }
          }
// appel bdd
//header('Location: product.php');
        }
         ?>
  <?php if (isset($_GET['id'])) { 
        $productById = $productsManager->getProductById($_GET['id']) ?>
        <section>
        <section id="product-selection">
          <section id="product-detail">
              <div id="product-name">
                <h1> <?= $productById['name'] ?> </h1>
              </div>
          </section>
          <section id="product-quantity">                
            <img src="src/img/<?= $productById['category'] ?>/<?= $productById['picture'] ?>" alt="<?= $productById['name'] ?>" />
            <div class="price">     
            <form method="get" action="product.php">
            <input type="hidden" name="id" value="<?php echo $_GET['id'] ?>">
            <select name="add" id="id_select">
              <option value="1">1 pièce</option>
              <option value="2">2 pièces</option>
              <option value="3">3 pièces</option>
              <option value="4">4 pièces</option>
            </select>
              <button type="submit" class="btndetail">Ajouter au panier</button>
            </form>
            </div>
          </section>
          <section id="product-description">        
            <p> <?= $productById['description'] ?> </p>
          </section>
          </section>
  <?php } ?>
  <section class="list">
    <?php if(isset($message)) echo "<h2 id='erreurcommande'> $message </h2>" ?>
	  <h2 id="nems">Nems</h2>
    <section>
      <?php foreach($productsNems as $product) { ?>
        <article>
          <h3><?= $product['name'] ?></h3>
          <img src="src/img/<?= $product['category'] ?>/<?= $product['picture'] ?>" alt="<?= $product['name'] ?>" />
          <p>à partir de</p>
          <p><strong><?= number_format($product['price'], 2, ',', ' ') ?>€</strong><p>
          <a class="btn" href="product.php?id=<?= $product['id'] ?>">Voir ce produit</a>
          </form>
        </article>
      <?php } ?>
    </section>
  </section>
  <section class="list">
    <h2 id="plats">Plats</h2>
    <section>
      <?php foreach($productsPlats as $product) { ?>
        <article>
          <h3> <?= $product['name'] ?> </h3>
          <img src="src/img/<?= $product['category'] ?>/<?= $product['picture'] ?>" alt="<?= $product['name'] ?>" />
          <p>à partir de</p>
          <p><strong><?= number_format($product['price'], 2, ',', ' ') ?>€</strong><p>
          <a class="btn" href="product.php?id=<?= $product['id'] ?>">Voir ce produit</a>
          </form>
        </article>
      <?php } ?>
    </section>
  </section>
  <section class="list">
    <h2 id="sushis">Sushis</h2>
    <section>
      <?php foreach($productsSushis as $product) { ?>
        <article>
          <h3> <?= $product['name'] ?> </h3>
          <img src="src/img/<?= $product['category'] ?>/<?= $product['picture'] ?>" alt="<?= $product['name'] ?>" />
          <p>à partir de</p>
          <p><strong> <?= number_format($product['price'], 2, ',', ' ') ?>€</strong><p>
          <a class="btn" href="product.php?id=<?= $product['id'] ?>">Voir ce produit</a>
        </form>
      </article>
    <?php } ?>
    </section>
  </section>  
  </main>
  <?php include "footer.php"; ?>