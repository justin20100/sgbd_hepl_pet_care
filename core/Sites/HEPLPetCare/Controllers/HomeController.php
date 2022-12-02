<?php

namespace SGBD\Sites\HEPLPetCare\Controllers;

use \SGBD\App;
use \SGBD\Sites\HEPLPetCare\Models\Animal;
use \SGBD\Sites\HEPLPetCare\Models\Employee;
use \SGBD\Sites\HEPLPetCare\Models\Post;

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
            'employees' => Employee::listHomepageEmployees(),
            'posts' => Post::listHomepagePosts(),
        ]);
    }
}
