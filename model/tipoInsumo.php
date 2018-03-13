<?php
class TipoInsumo
{

    private $pdo;
    public $IdTI;
    public $Tipo;


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

			$stm = $this->pdo->prepare("SELECT * FROM inti07");
			$stm->execute();

			return $stm->fetchAll(PDO::FETCH_OBJ);
		}
		catch(Exception $e)
		{
			die($e->getMessage());
		}
	}

	public function Eliminar($IdTI)
	{
		try
		{
			$stm = $this->pdo
			            ->prepare("DELETE FROM inti07 WHERE IdTI = ?");

			return $stm->execute(array($IdTI));
		} catch (Exception $e)
		{
			die($e->getMessage());
		}
	}

	public function Actualizar($data)
	{
		try
		{
			$sql = "UPDATE inti07 SET
			            Tipo         = ?
				    WHERE IdTI   = ?";

			return $this->pdo->prepare($sql)
			     ->execute(
				    array(
				    	          $data->Tipo,
                        $data->IdTI
					)
				);
		} catch (Exception $e)
		{
			die($e->getMessage());
		}
	}

	public function Registrar(TipoInsumo $data)
	{
		try
		{
		$sql = "INSERT INTO inti07 (Tipo)
		        VALUES (?)";

		return $this->pdo->prepare($sql)
		     ->execute(
				array(
					$data->Tipo
                )
			);
		} catch (Exception $e)
		{
			die($e->getMessage());
		}
	}
}

?>
