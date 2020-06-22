<?php

class ProductsController
{
    protected $id,$picture,$description,$category,$price,$name;
   
    public function __construct($valeurs = [])
    {
        if(!empty($valeurs)){
            $this->hydrate($valeurs);
        }
    }

    public function hydrate($donnees)
    {
        foreach($donnees as $attribut => $valeur)
        {
            $methode = 'set'.ucfirst($attribut);

            if (is_callable([$this, $methode]))
            {
                $this->$methode($valeur);
            }
        }
    }

    public function setId($id)
    {
        $this->id = (int) $id;
    }

    public function setPicture($picture)
    {
        $this->picture = $picture;
    }

    public function setDescritption($description)
    {
        $this->description = $description;
    }

    public function setCategory($category)
    {
        $this->category = $category;
    }

    public function setPrice($price)
    {
        $this->price = $price;
    }

    public function setName($name)
    {
        $this->name = $name;
    }

    public function id()
    {
        return $this->id;
    }

    public function picture()
    {
        return $this->picture;
    }

    public function description()
    {
        return $this->description;
    }

    public function category()
    {
        return $this->category;
    }

    public function price()
    {
        return $this->price;
    }

    public function name()
    {
        return $this->name;
    }
}