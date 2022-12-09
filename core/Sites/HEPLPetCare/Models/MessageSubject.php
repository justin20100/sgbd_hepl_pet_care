<?php

namespace SGBD\Sites\HEPLPetCare\Models;

use SGBD\BaseModel;

class MessageSubject extends BaseModel
{
    public function all($connexion)
    {
        return $connexion->prepare('SELECT `id`, `label`
FROM `message_subjects`
ORDER BY `created_at` ASC;
        ');
    }
}
