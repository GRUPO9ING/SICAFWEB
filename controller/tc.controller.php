<?php
require_once 'model/colaborador.php';
require_once 'model/lote.php';

class TcController{

    private $modelC;
    private $modelL;

    public function __CONSTRUCT(){
        $this->modelC = new Colaborador();
        $this->modelL = new Lote();
    }

    public function Index(){
        require_once 'view/trabajoCampo/index.php';
    }

    public function ListarCols(){
      $resultSet["data"] = $this->modelC->ListarCoTRC($_POST['IdTC']);
      echo json_encode($resultSet);
      exit();
    }

    public function ListarIns(){
      $resultSet["data"] = $this->modelL->ListarInTC($_POST['Id']);
      echo json_encode($resultSet);
      exit();
    }

    public function ListarTRC(){
      $resultSet["data"] = $this->modelL->ListarTC($_POST['FI'],$_POST['FF']);
      echo json_encode($resultSet);
      exit();
    }

    public function CreaTdCampo()
    {
      $fecha = $fecha = strftime( "%Y-%m-%d", time() );
      $resultSet["data"] = $this->modelL->TrabajoCampo($fecha);
      echo json_encode($resultSet);
       exit();
    }

    public function inColTc()
    {
      $result = $this->modelL->colTrabajo($_POST['idCol']);
      echo $result;
       exit();
    }

    public function ELiColTc()
    {
      $result = $this->modelL->ElicolTrabajo($_POST['idCol'],$_POST['idTc']);
      echo $result;
       exit();
    }

    public function InINTC()
    {
      $resultSet["data"] = $this->modelL->InsertaInsumoTc($_POST['IdInsumo'],$_POST['IDTC'],$_POST['Cantidad']);
      echo json_encode($resultSet);
       exit();
    }

    public function InsertarTRC()
    {
      $result = $this->modelL->InsertarTC($_POST['IdLote'],$_POST['IDTC'],$_POST['Fecha'],$_POST['Horas'],$_POST['Jus']);
      echo $result;
       exit();
    }

    public function ListarColcolTRC()
    {
          $resultSet["data"] = $this->modelL->ListaColsTRC($_POST['IDTC']);
          echo json_encode($resultSet);
           exit();
   }

   public function QuitarIns()
   {
     $result = $this->modelL->quitarInsumo($_POST['id']);
     echo $result;
     exit();
   }

}
