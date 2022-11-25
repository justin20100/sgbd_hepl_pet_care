<?php

namespace SGBD\Sites\HEPLPetCare\Models;

use SGBD\BaseModel;

class Animal extends BaseModel
{
    public function homepageAnimals($connexion)
    {
        return $connexion->prepare('SELECT a.`name`,
            ap.`src`,
            ap.`alt`,
            b.`name` AS `breed`,
            s.`name` AS `species`,
            s.`color`
            FROM `animals` a
            JOIN `animal_pictures` ap ON a.`animal_picture_id` = ap.`id`
            JOIN `breeds` b ON a.`breed_id` = b.`id`
            JOIN `species` s ON b.`species_id` = s.`id`
            WHERE a.`deleted_at` IS NULL
            AND NOT EXISTS(SELECT * FROM `adoptions` ad WHERE ad.`animal_id` = a.`id`)
            ORDER BY RAND()
            LIMIT 4;');
    }
}
