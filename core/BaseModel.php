<?php

namespace SGBD;

use \SGBD\App;

/**
* Cette classe sert de base à tous
* les modèles.
*/
class BaseModel
{
    public static $instance;

    protected $connexion;

    public function __construct()
    {
        try {
            $this->connexion = new \PDO('mysql:host=' . MYSQL_HOST . ';dbname=' . MYSQL_DBNAME . ';charset=utf8', MYSQL_USER, MYSQL_PASSWORD);
            $this->connexion->setAttribute(\PDO::ATTR_DEFAULT_FETCH_MODE, \PDO::FETCH_OBJ);
            $this->connexion->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
            $this->connexion->setAttribute(\PDO::ATTR_EMULATE_PREPARES, false);
        } catch (\Exception $e) {
            die('Erreur : ' . $e->getMessage());
        }
    }

    public static function __callStatic($name, $args)
    {
        $args = isset($args[0]) ? $args[0] : [];
        if(strpos($name, 'get') === 0){
            $response = self::getInstance()->loadRequest(strtolower(substr($name, 3)), $args);
            if($response) return $response->fetch();
        }
        elseif(strpos($name, 'list') === 0){
            $response = self::getInstance()->loadRequest(strtolower(substr($name, 4)), $args);
            if($response) return $response->fetchAll();
        }
        return false;
    }

    public static function getInstance()
    {
        $class = get_called_class();
        self::$instance = new $class();
        return self::$instance;
    }

    public function loadRequest($search, $replace)
    {
        if(!($path = $this->findFile())) return null;
        return $this->execute(str_replace($search, $replace, file_get_contents($path)));
    }

    public function execute($sql)
    {
        if(strrpos($sql, 'SELECT') === false) return;
        $statement = $this->connexion->prepare($sql);
        $statement->execute();
        return $statement;
    }

    protected function findFile()
    {
        foreach(scandir(SQL_PATH) as $file){
            if (substr($file,0,1) != '_' && substr($file, -3) == 'sql'){
                return realpath(SQL_PATH . $file);
            }
        }
    }
}
