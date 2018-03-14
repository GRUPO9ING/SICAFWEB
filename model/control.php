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


 public function Listar()
 {

	 try
	 {
		 $result = array();

		 $stm = $this->pdo->prepare("CALL LFA80();");
		 $stm->execute();
		 return $stm->fetchAll(PDO::FETCH_OBJ);
	 }
	 catch(Exception $e)
	 {
		 die($e->getMessage());
	 }

 }

 public function vender($idc,$idl,$fecha,$ob,$mon){


	 $F = date('Y-m-d', strtotime($fecha));

	 $stm = $this->pdo->prepare("CALL Vender(?,?,?,?,?);");
	 $stm->execute(array($idc,$F,$idl,$mon,$ob));
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




}
