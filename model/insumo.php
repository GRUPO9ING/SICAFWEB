<?php
class Insumo
{

    private $pdo;

    public $IdInsumo;
    public $IdTI;
    public $Nombre;
    public $Cantidad;
    public $FechaComp;
    public $PrecioUnit;
    public $Detalle;
    public $FechaVence;
    public $Procedencia;

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

			$stm = $this->pdo->prepare("CALL listar();");
			$stm->execute();

			return $stm->fetchAll(PDO::FETCH_OBJ);
		}
		catch(Exception $e)
		{
			die($e->getMessage());
		}
	}

	public function Obtener($IdInsumo)
	{
		try
		{
			$stm = $this->pdo
			          ->prepare("SELECT * FROM inin08 WHERE IdInsumo = ?");


			$stm->execute(array($IdInsumo));
			return $stm->fetch(PDO::FETCH_OBJ);
		} catch (Exception $e)
		{
			die($e->getMessage());
		}
	}

	public function Eliminar($IdInsumo)
	{
		try
		{
			$stm = $this->pdo
			            ->prepare("DELETE FROM inin08 WHERE IdInsumo = ?");

			$stm->execute(array($IdInsumo));
		} catch (Exception $e)
		{
			die($e->getMessage());
		}
	}

	public function Actualizar($data)
	{
		try
		{
			$sql = "UPDATE inin08 SET
			            IdTI         = ?,
						Nombre       = ?,
						Cantidad     = ?,
						FechaComp    = ?,
						PrecioUnit   = ?,
						Detalle      = ?,
						FechaVence   = ?,
						Procedencia  = ?
				    WHERE IdInsumo   = ?";

			return $this->pdo->prepare($sql)
			     ->execute(
				    array(
				    	          $data->IdTI,
                        $data->Nombre,
                        $data->Cantidad,
                        $data->FechaComp,
                        $data->PrecioUnit,
                        $data->Detalle,
                        $data->FechaVence,
                        $data->Procedencia,
                        $data->IdInsumo
					)
				);
		} catch (Exception $e)
		{
			die($e->getMessage());
		}
	}

	public function Registrar(Insumo $data)
	{
		try
		{
		$sql = "call IIN007 (?, ?, ?, ?, ?, ?, ?, ?)";

		return $this->pdo->prepare($sql)->execute(
				array(
					          $data->IdTI,
                    $data->Nombre,
                    $data->Cantidad,
                    $data->FechaComp,
                    $data->PrecioUnit,
                    $data->Detalle,
                    $data->FechaVence,
                    $data->Procedencia
                )
			);
		} catch (Exception $e)
		{
			die($e->getMessage());
		}
	}


   	public function Obtenercbo()

	{
	 try
		{
			$result = array();

			$stm = $this->pdo->prepare("SELECT * FROM inti07");
			$stm->execute();

			return $stm->fetchAll(PDO::FETCH_OBJ);
		}
		catch(Exception $e)
		{
			die($e->getMessage());
		}
	}



		public function CargaTI($IdTI)
	{
		try
		{
			$stm = $this->pdo
			          ->prepare("SELECT Tipo FROM inti07 WHERE IdTI = ?");


			$stm->execute(array($IdTI));
			return $stm->fetch(PDO::FETCH_OBJ);
		} catch (Exception $e)
		{
			die($e->getMessage());
		}
	}

}


?>
