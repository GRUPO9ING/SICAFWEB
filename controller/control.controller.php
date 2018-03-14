<?php
require_once 'model/control.php';
require_once 'model/lote.php';
class ControlController
{

    private $model;

    public function __CONSTRUCT(){
        $this->modelL = new Lote();
        $this->model = new Control();
    }

    public function Index(){
        require_once 'view/tipoInsumo/index.php';
    }

    public function IndexB(){
        require_once 'view/planilla/indexB.php';
    }

    public function balance(){
      $resultSet["data"] = $this->model->Balance($_POST['fi'],$_POST['ff'],$_POST['op']);
      echo json_encode($resultSet);
      exit();
    }

}

?>
