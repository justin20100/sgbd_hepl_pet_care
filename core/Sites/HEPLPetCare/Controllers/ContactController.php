<?php

namespace SGBD\Sites\HEPLPetCare\Controllers;

use \SGBD\App;
use SGBD\Sites\HEPLPetCare\Models\Message;

/**
 * Cette classe gère l'affichage de la
 * page d'accueil
 */
class ContactController
{
    public function store()
    {
        // (valider les données du formulaire)
        // sauvegarder les données en base de données
        Message::create($_POST['fullname'],$_POST['email'],$_POST['content']);
        // rediriger vers la page precedente
        header('Location: /#contact');
        exit();
    }
}
