<?php
class Colaborador
{
	private $pdo;

		public $IdColaborador;
		public $IdTipoColaborador;
		public $IdPersona;
		public $FechaIngreso;
		public $FechaBaja;
    public $Horas;
		public $SalarioBase;
		public $SalarioBruto;

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


	public function ColLote()
	{
		try
		{
			$stm = $this->pdo
								->prepare("CALL ListaHabilitadoLote()");
			$stm->execute();
			return $stm->fetchAll(PDO::FETCH_OBJ);
		} catch (Exception $e)
		{
			die($e->getMessage());
		}

	}


	public function Listar()
	{
		try
		{
			$result = array();

			$stm = $this->pdo->prepare("CALL ListarColaborador()");
			$stm->execute();
     return $stm->fetchAll(PDO::FETCH_OBJ);
		}
		catch(Exception $e)
		{
			die($e->getMessage());
		}
	}


	public function CBO($id)
	{
		try
		{
			$result = array();

			$stm = $this->pdo->prepare("CALL CargaCBOLote(?)");
			$stm->execute(array($id));
		 return $stm->fetchAll(PDO::FETCH_OBJ);
		}
		catch(Exception $e)
		{
			die($e->getMessage());
		}
	}


	public function CedDespl($Cedula)
	{
		try
		{
			$result = array();
			$stm = $this->pdo->prepare("SELECT IdPersona,Nombre,Apellido1,Apellido2,Telefono,Direccion,Correo FROM uspr01
			                           WHERE Cedula = ?");
			$stm->execute(array($Cedula));
      return $stm->fetchAll(PDO::FETCH_ASSOC);
		}
		catch(Exception $e)
		{
			die($e->getMessage());
		}
	}



	public function MaximoId()
	{
		try
		{
			$result = array();
			$stm = $this->pdo->prepare("SELECT MAX(IdPersona)+1 as id FROM uspr01");
			$stm->execute();
      return $stm->fetchAll(PDO::FETCH_ASSOC);
		}
		catch(Exception $e)
		{
			die($e->getMessage());
		}
	}


	public function Obtener($IdPersona)
	{
		try
		{
			$stm = $this->pdo
			          ->prepare("SELECT * FROM uspr01 WHERE IdPersona = ?");


			$stm->execute(array($IdPersona));
			return $stm->fetch(PDO::FETCH_OBJ);
		} catch (Exception $e)
		{
			die($e->getMessage());
		}

 }

	public function Eliminar($IdColaborador)
	{

		try
		{
			$stm = $this->pdo
			            ->prepare("DELETE FROM plco03 WHERE IdColaborador = ?");

			return $stm->execute(array($IdColaborador));
		} catch (Exception $e)
		{
			die($e->getMessage());
		}
	}

	public function Actualizar($data)
	{

		$data->FechaIngreso = date('Y-m-d', strtotime($data->FechaIngreso));

		try
		{
			$sql = "UPDATE plco03 SET
			      IdPersona       =?,
						IdTipoColaborador       = ?,
						FechaBaja    = ?,
						FechaIngreso    = ?,
						SalarioBase = ?,
						SalarioBruto = ?,
						Horas = ?
				    WHERE IdColaborador  = ?";

			return $this->pdo->prepare($sql)
			     ->execute(
				    array(
							$data->IdPersona,
							$data->IdTipoColaborador,
							$data->FechaBaja,
							$data->FechaIngreso,
							$data->SalarioBase,
							$data->SalarioBruto,
							$data->Horas,
							$data->IdColaborador
											)
				);
		} catch (Exception $e)
		{
			die($e->getMessage());
		}
	}

	public function Registrar($data)
	{

       $data->FechaIngreso = date('Y-m-d', strtotime($data->FechaIngreso));

		try
		{
		 $sql = "INSERT INTO plco03 (IdPersona,IdTipoColaborador,FechaBaja,FechaIngreso,SalarioBase,SalarioBruto,Horas)
		        VALUES (?, ?, ?, ?, ?, ?, ?)";

		return $this->pdo->prepare($sql)
		     ->execute(
				array(
					$data->IdPersona,
					$data->IdTipoColaborador,
					$data->FechaBaja,
					$data->FechaIngreso,
					$data->SalarioBase,
					$data->SalarioBruto,
					$data->Horas
                ));
		} catch (Exception $e)
		{
			die($e->getMessage());
		}
	}


	public function Obtenercbo()
	{
		try
		{
			$stm = $this->pdo
			          ->prepare("SELECT IdTipoColaborador, Tipo FROM pltc02");

			$stm->execute();
			return $stm->fetchAll(PDO::FETCH_OBJ);
		} catch (Exception $e)
		{
			die($e->getMessage());
		}

 }


 public function ObcboCol()
 {
	 try
	 {
		 $stm = $this->pdo
							 ->prepare("CALL listarCOLP()");
		 $stm->execute();
		 return $stm->fetchAll(PDO::FETCH_OBJ);
	 } catch (Exception $e)
	 {
		 die($e->getMessage());
	 }

}



 	public function ListarHoras()
 	{
 		try
 		{
 			$result = array();

 			$stm = $this->pdo->prepare("CALL ListarHE()");
 			$stm->execute();
      return $stm->fetchAll(PDO::FETCH_OBJ);
 		}
 		catch(Exception $e)
 		{
 			die($e->getMessage());
 		}
 	}



	 	public function NuevaHE($c,$id,$f)
	 	{

			       $f = date('Y-m-d', strtotime($f));
	 		try
	 		{
	 			$sql = "CALL AgregaHE(?,?,?)";
	 			$stm = $this->pdo->prepare($sql);
	 			return $stm->execute(array($c,
			                $id,
										  $f));
										}
	 		catch(Exception $e)
	 		{
	 			die($e->getMessage());
	 		}
	 	}

		public function EditarHE($idh,$c,$id,$f)
 	 {

 						$f = date('Y-m-d', strtotime($f));
 		 try
 		 {
 			 $sql = "CALL EditarHE(?,?,?,?)";
 			 $stm = $this->pdo->prepare($sql);
 			 return $stm->execute(array($idh,
			               $c,
 										 $id,
 										 $f));
 		 }
 		 catch(Exception $e)
 		 {
 			 die($e->getMessage());
 		 }
 	 }

	public function AplicarHoras($idS,$fecha,$idCol){
		       $fecha = date('Y-m-d', strtotime($fecha));
				try
				{
				 $sql = "CALL AplicarHorasExtras(?,?,?)";

				return $this->pdo->prepare($sql)
				     ->execute(
						array($idS,
						      $fecha,
									$idCol
		                ));
				} catch (Exception $e)
				{
					die($e->getMessage());
				}
	}


	public function ListarCoTRC($id)
	{
		try
		{
			$result = array();

			$stm = $this->pdo->prepare("CALL ListarCOLSTRC(?)");
			$stm->execute(array($id));
		 return $stm->fetchAll(PDO::FETCH_OBJ);
		}
		catch(Exception $e)
		{
			die($e->getMessage());
		}
	}



		public function AsignarCol($IdLote,$IdCol)
		{

			try
			{
			 $sql = "CALL AsignarColALote(?,?)";

			return $this->pdo->prepare($sql)
			     ->execute(
					array(
						$IdLote,
						$IdCol
	                ));
			} catch (Exception $e)
			{
				die($e->getMessage());
			}
		}


}
