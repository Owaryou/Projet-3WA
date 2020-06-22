<?php

class UserController
{
    protected $id,$prenom,$nom,$tel,$email,$password,$adresse;

    //*Appelle les seter ($this->setId($id), $this->setPrenom($prenom)...) automatiquement*//    
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

    public function add()
    {
        return true;
    }

    public function setId($id)
    {
        $this->id = (int) $id;
    }

    public function setPrenom($prenom)
    {
        $this->prenom = $prenom;
    }

    public function setNom($nom)
    {
        $this->nom = $nom;
    }

    public function setTel($tel)
    {
        $this->tel = $tel;
    }

    public function setEmail($email)
    {
        $this->email = $email;
    }

    public function setPassword($password)
    {
        $this->password = $password;
    }

    public function setAdresse($adresse)
    {
        $this->adresse = $adresse;
    }
   



    public function id()
    {
        return $this->id;
    }

    public function nom()
    {
        return $this->nom;
    }

    public function prenom()
    {
        return $this->prenom;
    }

    public function tel()
    {
        return $this->tel;
    }

    public function email()
    {
        return $this->email;
    }

    public function password()
    {
        return $this->password;
    }

    public function adresse()
    {
        return $this->adresse;
    }

}