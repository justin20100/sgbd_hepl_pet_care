<?php

namespace SGBD\Sites\HEPLPetCare\Models;

use SGBD\BaseModel;

class Post extends BaseModel
{
    public function homePagePosts($connexion)
    {
        return $connexion->prepare('
            SELECT 
            p.`src`,
            p.`title`,
            p.`slug`,
            p.`location`,
            p.`published_at`,
            u.`firstname`,
            u.`lastname`
            FROM posts p
            JOIN users u ON u.`id` = p.`user_id`
            WHERE p.`deleted_at` IS NULL
            ORDER BY p.`created_at`
            LIMIT 3;
        ');
    }
}
