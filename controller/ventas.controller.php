<?php
require_once  'model/lote.php';
require_once  'model/clientes.php';
require_once  'model/control.php';

class VentasController
{

    private $modelL;
    private $modelC;
    private $modelV;


    public function __CONSTRUCT(){
        $this->modelL = new Lote();
        $this->modelC = new Cliente();
        $this->modelV = new Control();
    }

    public function Index(){
        require_once 'view/ventas/index.php';
    }

    public function cboCliente(){
      $resultSet["data"] = $this->modelC->cboCliente();
      echo json_encode($resultSet);
      exit();
    }

    public function vender(){
      $result= $this->modelV->vender($_POST['idc'],$_POST['idl'],$_POST['fecha'],$_POST['ob'],$_POST['mon']);
      echo $result;
      exit();
    }

    public function ListarCompras(){
      $resultSet["data"] = $this->modelV->lisCompras($_POST['FI'],$_POST['FF']);
      echo json_encode($resultSet);
      exit();
    }


}
?>
