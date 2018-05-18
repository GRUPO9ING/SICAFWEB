<?php
require_once 'model/usuario.php';

class UsuarioController
{

    private $model;
    public function __CONSTRUCT(){
        $this->model = new Usuario();
    }

    public function Index(){
     require_once 'view/usuarios/index.php';
    }

    public function Listar()
    {
        $resultSet["data"] = $this->model->Listar();
        echo json_encode($resultSet);
        exit();
    }

    public function Guardar()
    {

        $ug = new Usuario();
        $ug->Id = $_POST['Id'];
        $ug->Nombre = $_POST['nom'];
        $ug->Apellido1 = $_POST['ap1'];
        $ug->Apellido2 = $_POST['ap2'];
        $ug->username = $_POST['user'];
        $ug->correo = $_POST['correo'];
        $ug->pass = $this->model->encrypt($_POST['pass']);
        $ug->Rol = $_POST['rol'];
        $result = $this->model->insertar($ug);
        echo $result;
        exit();
    }

    public function cambiar(){
        $pw = $this->model->encrypt($_POST['newpw']);
        $result = $this->model->cambiar($_POST['usuario'],$pw);
        echo $result;
        exit();
    }


    public function TraerCodigo(){
      $user = $_POST['username'];
      $resultSet["data"] = $this->model->traercodigo($user);
      echo json_encode ($resultSet);
      exit();
    }



}
