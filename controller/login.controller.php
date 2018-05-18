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
      ini_set('session.cookie_lifetime',3600);
      session_start();
      $_SESSION['user'] = $_POST['user'];
      $_SESSION['rol'] = $_POST['ROL'];
      echo true;
      exit();
    }

    public function cerrar(){
      session_destroy();
      require_once 'view/login/login.php';
    }

    public function recuperacion(){
      require_once 'view/recuperacion/formulario.php';
    }

    public function cambiar(){
        $pw = $this->modelU->encrypt($_POST['newpw']);
        $result = $this->modelU->cambiar($_POST['usuario'],$pw);
        echo $result;
        exit();
    }


    public function TraerCodigo(){
      $user = $_POST['username'];
      $resultSet["data"] = $this->modelU->traercodigo($user);
      echo json_encode ($resultSet);
      exit();
    }

    public function usuarios(){
     require_once 'view/recuperacion/index.php';
    }


}

?>
