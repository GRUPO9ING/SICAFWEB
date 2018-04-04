<?php
require_once 'model/colaborador.php';

class ColaboradorController{

    private $model;
    public function __CONSTRUCT(){
        $this->model = new Colaborador();
    }

    public function Index(){
        require_once 'view/colaborador/index.php';
    }

    public function IndexT(){
        require_once 'view/tipo/index.php';
    }

    public function IndexH(){
        require_once 'view/colaborador/indexH.php';
    }

    public function Listar() {

          $resultSet["data"] = $this->model->Listar();

 			 		echo json_encode($resultSet);

 			 		exit();

    }


    public function ListarTipo() {

          $resultSet["data"] = $this->model->ListarTipo();
 			 		echo json_encode($resultSet);
 			 		exit();

    }

    public function CBOA() {

          $resultSet["data"] = $this->model->CBO($_POST['id']);

 			 		echo json_encode($resultSet);

 			 		exit();

    }


    /*public function Guardar(){
        $per = new Persona();

        $per->IdPersona = $_REQUEST['IdPersona'];
        $per->Nombre = $_REQUEST['Nombre'];
        $per->Apellido1 = $_REQUEST['Apellido1'];
        $per->Apellido2 = $_REQUEST['Apellido2'];
        $per->Telefono = $_REQUEST['Telefono'];
        $per->Direccion = $_REQUEST['Direccion'];
        $per->Correo = $_REQUEST['Correo'];
         $per->Cedula = $_REQUEST['Cedula'];

        $per->IdPersona > 0
            ? $this->model->Actualizar($per)
            : $this->model->Registrar($per);

        header('Location: index.php?c=persona');
    }*/

    public function Guardar()
    {
      $col = new Colaborador();
      $col->IdPersona = $_POST['IdPersona'];
      $col->IdTipoColaborador = $_POST['IdTipoColaborador'];
      $col->FechaIngreso = $_POST['FechaIngreso'];
      $col->FechaBaja = $_POST['FechaBaja'];
      $col->SalarioBase = $_POST['SalarioBase'];
      $col->SalarioBruto = $_POST['SalarioBruto'];
      $col->Horas = $_POST['Horas'];
      $col->IdColaborador = $_POST['IdColaborador'];
      if($_POST['IdColaborador'] > 0)
      {
        $result = $this->model->Actualizar($col);
      }
      else
      {
        $result = $this->model->Registrar($col);
      }
      echo $result;
       exit();
    }

    public function Eliminar()
    {
      $result = $this->model->Eliminar($_POST['IdColaborador']);
      echo $result;
       exit();
    }


        public function Desplegar() {
              $resultSet["data"] = $this->model->CedDespl($_POST['Cedula']);
     			 		echo json_encode($resultSet);
     			 		exit();

        }


        public function Maximo() {

              $resultSet["data"] = $this->model->MaximoId();
              echo json_encode($resultSet);

              exit();

        }

        public function ListarHE() {
              $resultSet["data"] = $this->model->ListarHoras();
              echo json_encode($resultSet);

              exit();

        }

        public function AplicarHE(){
          $result = $this->model->AplicarHoras($_POST['idP'],$_POST['fecha'],$_POST['idCol']);
          echo $result;
          exit();
        }

                public function NuevaHE(){
                  if($_POST['id'] > 0){
                    $result = $this->model->EditarHE($_POST['id'],$_POST['cant'],$_POST['idCol'],$_POST['fecha']);
                  }else {
                    $result = $this->model->NuevaHE($_POST['cant'],$_POST['idCol'],$_POST['fecha']);
                  }
                    echo $result;
                    exit();
                }


        public function AsignarColALote(){
          $result = $this->model->AsignarCol($_POST['IdLote'],$_POST['IdCol']);
          echo $result;
          exit();
        }

        public function IngresarTipo(){
          $result = $this->model->guardarTipo($_POST['id'],$_POST['tipo'],$_POST['detalle']);
          echo $result;
          exit();
        }

        public function EliminaTipo(){
          $result = $this->model->EliminaTipo($_POST['id']);
          echo $result;
          exit();
        }


}
