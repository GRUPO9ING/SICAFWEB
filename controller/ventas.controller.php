<?php
require_once  'model/lote.php';
require_once  'model/clientes.php';
class VentasController
{

    private $modelL;
    private $modelC;


    public function __CONSTRUCT(){
        $this->modelL = new Lote();
        $this->modelC = new Cliente();
    }

    public function Index(){
        require_once 'view/ventas/index.php';
    }

    public function cboCliente(){
      $resultSet["data"] = $this->modelC->cboCliente();
      echo json_encode($resultSet);
      exit();
    }


}
?>
