<?php

class User
{
    protected $db;

    public function __construct(PDO $db)
    {
        $this->db = $db;
    }

    public function add(UserController $user)
    {
        $req = $this->db->prepare('INSERT INTO users(nom, prenom, tel, email, password, adresse) VALUES (:nom, :prenom, :tel, :email, :password, :adresse)');
   
        $req->bindValue(':nom', $user->nom());
        $req->bindValue(':prenom', $user->prenom());
        $req->bindValue(':tel', $user->tel());
        $req->bindValue(':email', $user->email());
        $req->bindValue(':password', $user->password());
        $req->bindValue(':adresse', $user->adresse());

        $req->execute();
    }

    public function getIdByName($name)
    {
        $req = $this->db->prepare('SELECT id from users where nom = :nom');
        $req->bindValue(':nom', $name, PDO::PARAM_STR);
        $req->execute();

        return $id = $req->fetch();
    }

    public function getUserByName($name)
    {
        $req = $this->db->prepare('SELECT id, prenom, nom, tel, email, adresse from users where nom = :nom');
        $req->bindValue(':nom', $name, PDO::PARAM_STR);
        $req->execute();

        return $id = $req->fetch();
    }
    
    public function checkMdp($email,$mdp)
    {
        $req = $this->db->prepare('SELECT password from users where email = :email');
        $req->bindValue(':email', $email, PDO::PARAM_STR);
        $req->execute();

        $data = $req->fetch();
        
        if($data['password'] == $mdp){
            return true;
        }
        else{return false;}
    }

    public function getUserByEmail($email)
    {
        $req = $this->db->prepare('SELECT id, prenom, nom, tel, email, adresse from users where email = :email');
        $req->bindValue(':email', $email, PDO::PARAM_STR);
        $req->execute();

        return $user = $req->fetch();
    }

    public function update($id,$prenom,$nom,$email,$tel,$adresse)
    {
        
        $req = $this->db->prepare('UPDATE users SET prenom = :prenom, nom = :nom, tel = :tel, email = :email, adresse = :adresse where id = :id');

        $req->bindValue(':prenom',$prenom, PDO::PARAM_STR);
        $req->bindValue(':nom',$nom, PDO::PARAM_STR);
        $req->bindValue(':tel',$tel, PDO::PARAM_STR);
        $req->bindValue(':email',$email, PDO::PARAM_STR);
        $req->bindValue(':adresse',$adresse, PDO::PARAM_STR);
        $req->bindValue(':id',(int)$id, PDO::PARAM_INT);

        $req->execute();
    }
}