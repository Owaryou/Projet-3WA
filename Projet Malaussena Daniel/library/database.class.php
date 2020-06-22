<?php

class Db
{
    public static function getMysqlConnexionWithPDO()
    {
        $db = new PDO('mysql:host=localhost;dbname=projet', 'root', "");
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        return $db;
    }
}