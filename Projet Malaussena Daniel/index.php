<?php
include "header.php";
require 'models/product.class.php';

$productsManager = new Product($db);
$productsNems = $productsManager->getAllNems();
$productsSushis = $productsManager->getAllSushis();
$productsPlats = $productsManager->getAllPlats();
?>

<main class="container">
    <section class="flexslidercontainer">
        <h1>NEMS</h1>
            <a href="product.php#nems">
                <div class="flexslider">
                    <ul class="slides">
                        <?php foreach($productsNems as $product) { ?>
                        <li>
                            <img src="src/img/<?= $product['category'] ?>/<?= $product['picture'] ?>" alt="<?= $product['name'] ?>"/>
                        </li>
                        <?php } ?>
                    </ul>
                </div>
            </a>
    </section>
    <section class="flexslidercontainer">
        <h1>PLATS</h1>
            <a href="product.php#plats">
                <div class="flexslider">
                    <ul class="slides">
                        <?php foreach($productsPlats as $product) { ?>}
                        <li>
                            <img src="src/img/<?= $product['category'] ?>/<?= $product['picture'] ?>" alt="<?= $product['name'] ?>"/>
                        </li>
                        <?php } ?>
                    </ul>
                </div>
            </a>
    </section>
    <section class="flexslidercontainer">
        <h1>SUSHIS</h1>
            <a href="product.php#sushis">
                <div class="flexslider">
                    <ul class="slides">
                        <?php foreach($productsSushis as $product) { ?>}
                        <li>
                            <img src="src/img/<?= $product['category'] ?>/<?= $product['picture'] ?>" alt="<?= $product['name'] ?>"/>
                        </li>
                        <?php } ?>
                    </ul>
                </div>
            </a>
    </section>
</main>
<?php include "footer.php"; ?>