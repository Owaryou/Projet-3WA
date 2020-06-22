<?php

class OrderController
{
    protected $id, $user_id, $total;

    public function ___construct($valeurs =[])
    {
        if(!empty($valeur)){
            $this->hydrate($valeurs);
        }
    }

    public function hydrate($donnees)
    {
        foreach($donnees as $attribut => $valeur)
        {
            $methode = 'set'.ucfirst($attribut);

            if (is_callable([$this,$methode]))
            {
                $this->$methode($valeurs);
            }
        }
    }

    public function add()
    {
        return true;
    }

    public function setId($id)
    {
        $this->id = (int) $id;
    }

    public function setUserId($user_id)
    {
        $this->user_id = (int) $user_id;
    }

    public function setTotal($total)
    {
        $this->total = $total;
    }

    public function id()
    {
        return $this->id;
    }

    public function user_id()
    {
        return $this->user_id;
    }

    public function total()
    {
        return $this->total;
    }
    
}