<?php
require_once 'model/login.php';

class LoginController
{

    private $model;

    public function __CONSTRUCT(){
        $this->model = new login();
    }

    public function Index(){
      require_once 'view/login/login.php';
    }

    public function Autenticar()
    {
      $l = new Login();
      $l->username = $_POST['nombre'];
      $l->pass = $_POST['pass'];
      $resultSet["data"] = $this->model->Autenticar($l);
      echo json_encode($resultSet);
      exit();

    }

    public function CreaSesion(){
      session_start();
      $_SESSION['user'] = $_POST['user'];
      echo true;
      exit();
    }
}

?>
