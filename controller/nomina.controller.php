<?php
require_once 'model/nomina.php';

class NominaController{

    private $model;

    public function __CONSTRUCT(){
        $this->model = new Nomina();
    }

    public function Index(){
        require_once 'view/nomina/index.php';
    }

    public function IndexPlanilla(){
        require_once 'view/planilla/index.php';
    }

    public function Guardar(){
        $nom = new Persona();

        $nom->IdPersona = $_REQUEST['IdPersona'];
        $nom->Nombre = $_REQUEST['Nombre'];
        $nom->Apellido1 = $_REQUEST['Apellido1'];
        $nom->Apellido2 = $_REQUEST['Apellido2'];
        $nom->Telefono = $_REQUEST['Telefono'];
        $nom->Direccion = $_REQUEST['Direccion'];
        $nom->Correo = $_REQUEST['Correo'];
         $nom->Cedula = $_REQUEST['Cedula'];

        $nom->IdPersona > 0
            ? $this->model->Actualizar($per)
            : $this->model->Registrar($per);

        header('Location: index.php');
    }


        public function Generar(){
            $nom = new Nomina();
            $nom->FechaInicio = $_POST['FechaInicio'];
            $nom->FechaFin = $_POST['FechaFin'];
            $result = $this->model->Registrar($nom);
            echo $result;
            exit();
        }



      public function AprobPl()
      {
          $result = $this->model->aprobarPl($_POST['Idpl'],$_POST['op']);
          echo $result;
          exit();
      }

    public function Eliminar()
    {
        $result = $this->model->Eliminar($_POST['IdNomina']);
        echo $result;
        exit();
    }
    public function CaSalBR()
    {
        $result = $this->model->CalcSalB($_POST['IdNomina'],$_POST['Monto'],$_POST['idpl']);
        echo $result;
        exit();
    }

    public function QuitarC()
    {
        $result = $this->model->QuitarCM($_POST['idN'],$_POST['IdCC']);
        echo $result;
        exit();
    }

    public function Listar(){
      $resultSet["data"] = $this->model->Listar($_POST['cons'],$_POST['f1'],$_POST['f2']);
      echo json_encode($resultSet);
      exit();
    }

      public function Planilla(){
      $resultSet["data"] = $this->model->Planilla();
      echo json_encode($resultSet);
      exit();
    }

    public function CC(){
    $resultSet["data"] = $this->model->PLCCP($_POST['IdCol'], $_POST['i']);
    echo json_encode($resultSet);
    exit();
    }


    public function Concep(){
    $resultSet["data"] = $this->model->Concep($_POST['IdCol'],$_POST['i']);
    echo json_encode($resultSet);
    exit();
    }



    public function ConCol(){
    $resultSet["data"] = $this->model->ConCol($_POST['id'],$_POST['i']);
    echo json_encode($resultSet);
    exit();
    }

    public function NuevoCol(){
        $nom = new Nomina();
        $nom->IdCon = $_POST['IdCon'];
        $nom->IdColaborador = $_POST['IdCol'];
        $nom->IdNomina = $_POST['IdNomina'];
        $nom->Total = $_POST['Total'];
        $result = $this->model->NuevoConcepto($nom);
        echo $result;
        exit();
    }

    public function CalC(){
    $resultSet["data"] = $this->model->ValConcep($_POST['IdCon']);
    echo json_encode($resultSet);
    exit();
    }

    public function cboLlena(){
      $resultSet["data"] = $this->model->nomiFecha();
      echo json_encode($resultSet);
      exit();
    }

    public function HAprov(){
      $resultSet["data"] = $this->model->HorasA($_POST['id'],$_POST['fi'],$_POST['ff']);
      echo json_encode($resultSet);
      exit();
    }

}
