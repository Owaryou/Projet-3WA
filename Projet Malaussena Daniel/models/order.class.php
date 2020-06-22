<?php

class Order
{
    protected $db;

    public function __construct(PDO $db)
    {
        $this->db = $db;
    }

    public function getOrderById($id)
    {
        $req = $this->db->prepare('SELECT * FROM commande WHERE id = :id');
        $req->bindValue(':id', $id, PDO::PARAM_INT);
        $req->execute();

        return $order = $req->fetch();
    }

    public function addOrder($userId)
    {
        $req = $this->db->prepare('INSERT INTO commande (user_id) VALUES (:user_id)');
        $req->bindValue(':user_id', $userId, PDO::PARAM_INT);
        $req->execute();
    }

    public function getLastOrderID($lastOrderId)
    {
        $req = $this->db->prepare('SELECT MAX(id) FROM commande');
        $req->execute();

        return $lastId = $req->fetch();
    }

  

    public function addProductToOrder( $orderId, $productId, $quantity)
    {
        //appel bdd pour recup price via product id
        $req = $this->db->prepare('SELECT price from products where id = :id');
        $req->bindValue(':id', $productId, PDO::PARAM_INT);
        $req->execute();

        $productPrice = $req->fetch();

        $req2 = $this->db->prepare('SELECT quantity from products_order where product_id = :product_id and order_id = :order_id');
        $req2->bindValue(':product_id', $productId);
        $req2->bindValue(':order_id', $orderId[0]);
        $req2->execute();

        $quantityInOrderAlt = $req2->fetch();
        if($quantityInOrderAlt == false){
            
        $req3 = $this->db->prepare('INSERT INTO products_order (product_id, order_id, quantity, cost) VALUES (:product_id, :order_id, :quantity, :cost)');

        $req3->bindValue(':product_id', $productId);
        $req3->bindValue(':order_id', $orderId[0]);
        $req3->bindValue(':quantity', $quantity);
        $req3->bindValue(':cost', $productPrice[0]*$quantity);

        $req3->execute();

        }else{$quantityInOrder = $quantityInOrderAlt[0];

        $req3 = $this->db->prepare('UPDATE products_order SET quantity = :quantity, cost = :cost WHERE product_id = :product_id AND order_id = :order_id');

        $req3->bindValue(':product_id', $productId);
        $req3->bindValue(':order_id', $orderId[0]);
        $req3->bindValue(':quantity', $quantityInOrder + $quantity);
        $req3->bindValue(':cost', ($quantityInOrder + $quantity)*$productPrice[0]);
        

        $req3->execute();
        }
    }
    public function getAllBaby($orderId){

        $req = $this->db->prepare('SELECT id, name, price, quantity, picture, category FROM products FULL JOIN products_order ON id = products_order.product_id WHERE products_order.order_id = :order_id');
        $req->bindValue(':order_id', $orderId);

        $req->execute();

        return $items = $req->fetchAll();

        
    }
    public function getGlobalPrice($orderId){

        $req = $this->db->prepare('SELECT SUM(cost) FROM products_order WHERE order_id = :order_id');
        $req->bindValue(':order_id', $orderId);
        $req->execute();
        return $cost = $req->fetch();
    }
    public function delete($orderId, $productId, $quantity){

        $req = $this->db->prepare('SELECT quantity FROM products_order WHERE order_id = :order_id AND product_id = :product_id');
        $req->bindValue(':order_id', $orderId);
        $req->bindValue(':product_id', $productId);
        $req->execute();

        $quantityInDb = $req->fetch();

        if(($quantityInDb[0] - $quantity) <= 0){
            $req2 = $this->db->prepare('DELETE FROM products_order WHERE order_id = :order_id AND product_id = :product_id');
            $req2->bindValue(':order_id', $orderId);
            $req2->bindValue(':product_id', $productId);
            $req2->execute();
            
            
            
        }else{

            $req3 = $this->db->prepare('SELECT price from products where id = :product_id');
            $req3->bindValue(':product_id', $productId);
            $req3->execute();
            $price = $req3->fetch();
            
            $req2 = $this->db->prepare('UPDATE products_order SET quantity = :quantity, cost = :cost WHERE order_id = :order_id AND product_id = :product_id');
            $req2->bindValue(':order_id', $orderId);
            $req2->bindValue(':product_id', $productId);
            $req2->bindValue(':quantity', $quantityInDb[0] - $quantity);
            $req2->bindValue(':cost', ($quantityInDb[0] - $quantity)*$price[0]);
            $req2->execute();
            
        }
    }
}