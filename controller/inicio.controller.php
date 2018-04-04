<?php
class InicioController
{

    private $model;

    public function __CONSTRUCT(){
        $this->model = new Insumo();
    }

    public function Index(){
        require_once 'view/overall/inicio.php';
    }
}
?>
