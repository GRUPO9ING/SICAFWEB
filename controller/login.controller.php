<?php
require_once 'model/login.php';
require_once 'model/usuario.php';

class LoginController
{

    private $model;
    private $modelU;

    public function __CONSTRUCT(){
        $this->model = new login();
        $this->modelU = new Usuario();

    }

    public function Index(){
      require_once 'view/login/login.php';
    }

    public function Autenticar()
    {
      $l = new Login();
      $l->username = $_POST['nombre'];
      $l->pass = $this->modelU->encrypt($_POST['pass']);
      $resultSet["data"] = $this->model->Autenticar($l);
      echo json_encode($resultSet);
      exit();

    }

    public function CreaSesion(){
      session_start();
      $_SESSION['user'] = $_POST['user'];
      $_SESSION['rol'] = $_POST['ROL'];
      echo true;
      exit();
    }
}

?>
