<?php

namespace SGBD\Sites\HEPLPetCare\Controllers;

use \SGBD\App;

/**
* Cette classe gère l'affichage de la 
* page d'accueil
*/
class HomeController
{
    public function show()
    {
        return App::getView([]);
    }
}
