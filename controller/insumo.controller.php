<?php
require_once 'model/insumo.php';

class InsumoController
{

    private $model;

    public function __CONSTRUCT(){
        $this->model = new Insumo();
    }

    public function Index(){
        require_once 'view/insumo/index.php';
    }

    public function Crud(){
        $ins = new Insumo();

        if(isset($_REQUEST['IdInsumo'])){
            $ins = $this->model->Obtener($_REQUEST['IdInsumo']);
        }

        require_once 'view/header.php';
        require_once 'view/insumo/insumo-editar.php';
        require_once 'view/footer.php';
    }

    public function Guardar(){
        $ins = new Insumo();
        $ins->IdInsumo = $_POST['IdInsumo'];
        $ins->IdTI = $_POST['IdTI'];
        $ins->Nombre = $_POST['Nombre'] ;
        $ins->Cantidad = $_POST['Cantidad'];
        $ins->FechaComp = $_POST['FechaComp'];
        $ins->PrecioUnit = $_POST['PrecioUnit'];
        $ins->Detalle = $_POST['Detalle'];
        $ins->FechaVence = $_POST['FechaVence'];
        $ins->Procedencia = $_POST['Procedencia'];

        if( $ins->IdInsumo > 0 ){
          $result = $this->model->Actualizar($ins);
          echo $result;
          exit();
        }else {
          $result = $this->model->Registrar($ins);
          echo $result;
          exit();
        }

    }

    public function Eliminar()
    {
      $result = $this->model->Eliminar($_POST['IdInsumo']);
      echo $result;
       exit();
    }



          public function Listar() {
                $resultSet["data"] = $this->model->Listar();
       			 		echo json_encode($resultSet);
       			 		exit();
          }
}

?>
