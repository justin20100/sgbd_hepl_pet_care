<?php

namespace SGBD\Routes;

/**
* Cette classe gère et analyse la requête
* actuelle.
*/
class Request
{
    protected $host;
    protected $root;
    protected $uri;

    public function __construct(){
        $this->host = $this->makeHost();
        $this->root = $this->makeRoot();
        $this->uri = $this->makeURI();
    }

    public function getHost(){
        return $this->host;
    }

    public function getRoot(){
        return $this->root;
    }

    public function getUri(){
        return $this->uri;
    }

    public function getBase(){
        return $this->host . $this->root;
    }

    protected function makeHost(){
        $s = 'http';
        $s .= isset($_SERVER['HTTPS']) ? 's' : '';
        $s .= '://';
        $s .= $_SERVER['HTTP_HOST'];
        return $s;
    }

    protected function makeRoot(){
        $s = substr($_SERVER['SCRIPT_NAME'], 0, strrpos($_SERVER['SCRIPT_NAME'], 'index.php'));
        return $this->clearURI($s);
    }

    protected function makeURI(){
        $query = explode('?', $_SERVER['REQUEST_URI']);
        $s = substr($query[0], (strpos($query[0], $this->root) + strlen($this->root)));
        return $this->clearURI($s);
    }

    protected function clearURI($uri){
        $uri = is_string($uri) ? $uri : '';
        $s = trim($uri, '/');
        if(strlen($s)) return '/' . $s . '/';
        return '/';
    }
}
