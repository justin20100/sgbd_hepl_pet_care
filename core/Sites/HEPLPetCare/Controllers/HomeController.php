<?php

namespace SGBD\Sites\HEPLPetCare\Controllers;

use \SGBD\App;
use \SGBD\Sites\HEPLPetCare\Models\Animal;

/**
* Cette classe gère l'affichage de la 
* page d'accueil
*/
class HomeController
{
    public function show()
    {
        return App::getView('home', [
            'site_name' => 'HEPL Pet Care',
            'rightanimals' => Animal::listHomepageRightAnimals(),
            'leftanimals' => Animal::listHomepageLeftAnimals(),
        ]);
    }
}
