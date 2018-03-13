<?php
require_once 'model/usuarioRoles.php';

class UsuarioRolesController
{

    private $model;
    public function __CONSTRUCT(){
        $this->model = new UsuarioRoles();
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

        $ug = new UsuarioRoles();
        $ug->IdUR = $_POST['IdUR'];
        $ug->IdUser = $_POST['IdUser'];
        $ug->IdRol = $_POST['IdRol'];




   if($_POST['IdUR'] > 0)
   {
     $result = $this->model->Actualizar($ug);
     echo $result;
     exit();
    }
     else
      {
      $result = $this->model->Registrar($ug);
      echo $result;
       exit();
      }
    }

    public function Eliminar()
    {
      $result = $this->model->Eliminar($_POST['IdUR']);
      echo $result;
       exit();
    }


}
