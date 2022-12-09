<?php

namespace SGBD\Sites\HEPLPetCare\Models;

use SGBD\BaseModel;

class Message extends BaseModel
{
    public static function create($fullname, $email, $content)
    {
        $connexion = self::getInstance()->getConnection();

        $query = $connexion->prepare('
        INSERT INTO `messages` (`fullname`,`email`,`content`) VALUES (:fullname,:email,:content);
        ');

        $query->bindParam(':fullname', $fullname);
        $query->bindParam(':email', $email);
        $query->bindParam(':content', $content);

        $query->execute();
    }
}
