<?php

namespace SGBD\Sites\HEPLPetCare;

use SGBD\BaseSite;

/**
* Cette classe gère le site d'exemple
* "The Rapture" et hérite des propriétés de
* la classe SGBD\BaseSite;
*/
class Site extends BaseSite
{
    protected $routes = [
        '/' => ['name' => 'home', 'controller' => 'HomeController', 'method' => 'show'],
        '/contact' => ['name' => 'contact', 'controller' => 'ContactController', 'method' => 'store'],
        // Possibilité d'ajouter des variables dans les routes :
        // '/voyages/{name}' => ['name' => voyage, 'controller' => 'TripController', 'method' => 'show']
    ];

    protected function boot(){
        // boot actions if necessary (no current route not yet defined).
    }
}
