<?php
require_once 'model/clientes.php';

class ClienteController{

    private $model;
    public function __CONSTRUCT(){
        $this->model = new Cliente();
    }

    public function Index(){
        require_once 'view/cliente/index.php';
    }


    public function Guardar()
    {
          $result = $this->model->guardar($_POST['id']);
          echo $result;
          exit();
    }


}
