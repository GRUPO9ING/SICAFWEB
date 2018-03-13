<?php
session_start();
class Nomina
{
	private $pdo;
	  public $IdNomina;
    public $IdCon;
		public $Total;
		public $FechaInicio;
		public $FechaFin;
		public $IdColaborador;


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


 public function Listar($f0,$f1,$f2)
 {

	 $Inicio = date('Y-m-d', strtotime($f1));
	 $Fin = date('Y-m-d', strtotime($f2));

	 try
	 {
		 $result = array();
		 $stm = $this->pdo->prepare("CALL LISTARNOMINA(?, ? , ? );");
		 $stm->execute(array($f0,$Inicio,$Fin));
		 return $stm->fetchAll(PDO::FETCH_OBJ);
	 }
	 catch(Exception $e)
	 {
		 die($e->getMessage());
	 }
 }

public function nomiFecha(){
	try
	{
		$result = array();
		$stm = $this->pdo->prepare("CALL NOMINAFECHA();");
		$stm->execute(array());
		return $stm->fetchAll(PDO::FETCH_OBJ);
	}
	catch(Exception $e)
	{
		die($e->getMessage());
	}
}


	public function Eliminar($IdNomina)
	{

		try
		{
			$stm = $this->pdo
			            ->prepare("DELETE FROM plno24 WHERE IdNomina = ?");

			return $stm->execute(array($IdNomina));
		} catch (Exception $e)
		{
			die($e->getMessage());
		}

	}

	public function CalcSalB($IdNomina,$monto,$id)
	{

		try
		{
			$stm = $this->pdo
									->prepare("CALL AlteraSalB(?,?,?)");

			return $stm->execute(array($IdNomina,$monto,$id));
		} catch (Exception $e)
		{
			die($e->getMessage());
		}

	}




	public function QuitarCM($Id1, $Id2)
	{

		try
		{
			$sql = "CALL EliminaConceptoCol(?,?)";
			$stm = $this->pdo->prepare($sql);
			return $stm->execute(array($Id1, $Id2));
		} catch (Exception $e)
		{
			die($e->getMessage());
		}

	}


	public function Actualizar($data)
	{
		try
		{
			$sql = "UPDATE uspr01 SET
			      Cedula       =?,
						Nombre       = ?,
						Apellido1    = ?,
						Apellido2    = ?,
            Telefono     = ?,
						Direccion    = ?,
						Correo       = ?
				    WHERE IdPersona  = ?";

			$this->pdo->prepare($sql)
			     ->execute(
				    array(
				    	          $data->IdNomina,
                        $data->Colaborador,
                        $data->SalarioBase,
                        $data->SalarioBruto,
                        $data->fInicio,
                        $data->fFin,
                        $data->Horas
					)
				);
		} catch (Exception $e)
		{
			die($e->getMessage());
		}
	}

	public function Registrar(Nomina $data)
	{
		$data->FechaInicio = date('Y-m-d', strtotime($data->FechaInicio));
		$data->FechaFin = date('Y-m-d', strtotime($data->FechaFin));

		try
		{
		$sql = "CALL GeneraNominas(?,?)";
    return $this->pdo->prepare($sql)
		     ->execute(
				array(
                    $data->FechaInicio,
                    $data->FechaFin,
                )
			);
		} catch (Exception $e)
		{
			die($e->getMessage());
		}
	}


	public function aprobarPl($id,$op){
		try {
        $stm = $this->pdo->prepare("CALL aprobarplanilla(?,?);");
				return $stm->execute(array($id,$op));
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


	public function Planilla()
  {

		 try
		 {
			 $result = array();
			 $stm = $this->pdo->prepare("CALL plpl();");
			 $stm->execute();
			 return $stm->fetchAll(PDO::FETCH_OBJ);
		 }
		 catch(Exception $e)
		 {
			 die($e->getMessage());
		 }

  }


	public function PLCCP($id,$id2)
	{

	 try
	 {
		 $sql = "CALL llamaconceptocol(?,?)";
		 $stm = $this->pdo->prepare($sql);
		 $stm->execute(array($id,$id2));
		 return $stm->fetchAll(PDO::FETCH_OBJ);
	 }
	 catch(Exception $e)
	 {
		 die($e->getMessage());
	 }
	}

	public function Concep($id5,$id2)
   {
  	 try
  	 {
	     $sql = "CALL ListarTodosConceptos(?,?)";
  		 $stm = $this->pdo->prepare($sql);
  		 $stm->execute(array($id5,$id2));
  		 return $stm->fetchAll(PDO::FETCH_OBJ);
  	 }
  	 catch(Exception $e)
  	 {
  		 die($e->getMessage());
  	 }
   }


	 public function ValConcep($id)
	  {
	 	 try
	 	 {
	 		 $sql = "CALL calculaPorcentajeDD(?)";
	 		 $stm = $this->pdo->prepare($sql);
	 		 $stm->execute(array($id));
	 		 return $stm->fetchAll(PDO::FETCH_OBJ);
	 	 }
	 	 catch(Exception $e)
	 	 {
	 		 die($e->getMessage());
	 	 }
	  }


	 	public function ConCol($id,$id2)
	    {

	   	 try
	   	 {
	   		 $result = array();
	   		 $stm = $this->pdo->prepare("CALL listarCC(?,?)");
	   		 $stm->execute(array($id, $id2));
	   		 return $stm->fetchAll(PDO::FETCH_OBJ);
	   	 }
	   	 catch(Exception $e)
	   	 {
	   		 die($e->getMessage());
	   	 }
	    }


				public function NuevoConcepto(Nomina $data)
				{
					try
					{
					$sql = "CALL insertarCoCol(?,?,?,?)";
			    return $this->pdo->prepare($sql)
					     ->execute(
							array(
			                    $data->IdColaborador,
			                    $data->IdCon,
													$data->Total,
													$data->IdNomina
			                )
						);
					} catch (Exception $e)
					{
						die($e->getMessage());
					}
				}


				public function HorasA($id,$fi,$ff)
					{

					 try
					 {
						 $result = array();
						 $stm = $this->pdo->prepare("CALL HorasAprovechadas(?,?,?)");
						 $stm->execute(array($id,$fi,$ff));
						 return $stm->fetchAll(PDO::FETCH_OBJ);
					 }
					 catch(Exception $e)
					 {
						 die($e->getMessage());
					 }
					}

}
