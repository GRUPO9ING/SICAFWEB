<?php
require_once 'model/persona.php';

class PersonaController{

    private $model;
    public function __CONSTRUCT(){
        $this->model = new Persona();
    }

    public function Index(){
        require_once 'view/persona/index.php';
    }

    public function Listar() {

          $resultSet["data"] = $this->model->Listar();

 			 		echo json_encode($resultSet);

 			 		exit();

    }

    public function Guardar()
    {
      $per = new Persona();
      $per->IdPersona = $_POST['IdPersona'];
      $per->Nombre = $_POST['Nombre'];
      $per->Apellido1 = $_POST['Apellido1'];
      $per->Apellido2 = $_POST['Apellido2'];
      $per->Telefono = $_POST['Telefono'];
      $per->Direccion = $_POST['Direccion'];
      $per->Correo = $_POST['Correo'];
      $per->Cedula = $_POST['Cedula'];

   if($_POST['IdPersona'] > 0)
   {
     $result = $this->model->Actualizar($per);
     echo $result;
     exit();
    }
     else
      {
      $result = $this->model->Registrar($per);
      echo $result;
       exit();
      }
    }

    public function Eliminar()
    {
      $result = $this->model->Eliminar($_POST['IdPersona']);
      echo $result;
       exit();
    }

}
