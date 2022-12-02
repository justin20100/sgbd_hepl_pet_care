<?php

namespace SGBD\Sites\HEPLPetCare\Models;

use SGBD\BaseModel;

class Employee extends BaseModel
{
    public function homepageEmployees($connexion)
    {
        return $connexion->prepare('
            SELECT e.`order`,
            e.`src`,
            e.`color`,
            e.`job`,
            u.`firstname`,
            u.`lastname`
            FROM employees e
            JOIN `users` u ON u.`id` = e.`user_id`
            WHERE e.`deleted_at` IS NULL 
            AND u.`deleted_at` IS NULL
            ORDER BY e.`order` ASC
            LIMIT 5;
        ');
    }
}
