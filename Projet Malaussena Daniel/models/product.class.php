<?php

class Product
{
    protected $db;

    public function __construct(PDO $db)
    {
        $this->db = $db;
    }

    public function getAllNems()
    {
        $req = $this->db->prepare('SELECT * FROM products WHERE category = "nems" ');
        $req->execute();
        
        return $products = $req->fetchAll();
    }

    public function getAllSushis()
    {
        $req = $this->db->prepare('SELECT * FROM products WHERE category = "sushis" ');
        $req->execute();
        
        return $products = $req->fetchAll();
    }

    public function getAllPlats()
    {
        $req = $this->db->prepare('SELECT * FROM products WHERE category = "plats" ');
        $req->execute();
        
        return $products = $req->fetchAll();
    }

    public function getProductById($id)
    {
        $req = $this->db->prepare('SELECT * FROM products WHERE id = :id');
        $req->bindValue(':id', $id, PDO::PARAM_INT);
        $req->execute();

        return $id = $req->fetch();
    }

    
}