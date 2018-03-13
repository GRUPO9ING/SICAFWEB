<?php
require_once 'model/tipoInsumo.php';

class TipoInsumoController
{

    private $model;

    public function __CONSTRUCT(){
        $this->model = new TipoInsumo();
    }

    public function Index(){
        require_once 'view/tipoInsumo/index.php';
    }

    public function Listar() {
         $resultSet["data"] = $this->model->Listar();
         echo json_encode($resultSet);
         exit();
   }

   public function Eliminar() {
        $result = $this->model->Eliminar($_POST['IdTI']);
        echo $result;
        exit();
  }

  public function Guardar() {
       $ti = new TipoInsumo();
       $ti->IdTI = $_POST['IdTI'];
       $ti->Tipo = $_POST['Nombre'];

       if($ti->IdTI > 0){
       $result = $this->model->Actualizar($ti);
       echo $result;
       exit();
     }else {
       $result = $this->model->Registrar($ti);
       echo $result;
       exit();
     }

 }
}

?>
