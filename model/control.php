<?php
class Control
{
	private $pdo;

    public $IdFac;
    public $FechaV;
    public $IdUser;
    public $IdCliente;
    public $Totalfac;


	public function __CONSTRUCT()
	{
		try
		{
			$this->pdo = Database::StartUp();
		}
		catch(Exception $e)
		{
			die($e->getMessage());
		}
	}



 public function lisCompras($fi,$ff)
 {
	 $FI = date('Y-m-d', strtotime($fi));
	 $FF = date('Y-m-d', strtotime($ff));
	 try
	 {
		 $stm = $this->pdo->prepare("CALL todasVentas(?,?);");
		 $stm->execute(array($FI,$FF));
		 return $stm->fetchAll(PDO::FETCH_OBJ);
	 }
	 catch(Exception $e)
	 {
		 die($e->getMessage());
	 }

 }

 public function vender($idc,$idl,$fecha,$ob,$mon){
	 try {


		 $F = date('Y-m-d', strtotime($fecha));
		 $stm = $this->pdo->prepare("CALL Vender(?,?,?,?,?);");
		 return $stm->execute(array($idc,$F,$idl,$mon,$ob));

	 } catch (Exception $e) {
	 	die($e->getMessage());
	 }
 }

 public function reporte($fi,$ff,$op){
	 try {
		 $FF = date('Y-m-d', strtotime($ff));
		 $FI = date('Y-m-d', strtotime($fi));

     $stm = $this->pdo->prepare("CALL VentasPorLotes(?,?,?)");
		 $stm->execute(array($FI,$FF,$op));
		 return $stm->fetchAll(PDO::FETCH_OBJ);

	 } catch (Exception $e) {
	 	die($e->getMessage());
	 }

 }




	public function Carga()
	{
	try
	{
		$stm = $this->pdo
							->prepare("CALL CargaCol();");


		$stm->execute();
		return $stm->fetchAll(PDO::FETCH_OBJ);
	} catch (Exception $e)
	{
		die($e->getMessage());
	}
	}


	public function Balance($fi,$ff,$op){
 	 try {
 		 $FF = date('Y-m-d', strtotime($ff));
 		 $FI = date('Y-m-d', strtotime($fi));

     $stm = $this->pdo->prepare("CALL Balances(?,?)");
 		 $stm->execute(array($FI,$FF));
		 $stm = $this->pdo->prepare("CALL BBB(?)");
 		 $stm->execute(array($op));
 		 return $stm->fetchAll(PDO::FETCH_OBJ);

 	 } catch (Exception $e) {
 	 	die($e->getMessage());
 	 }

  }


}
