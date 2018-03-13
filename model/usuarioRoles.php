<?php
class UsuarioRoles
{

    private $pdo;
    public $IdUR;
    public $IdUser;
    public $IdRol;

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
			$stm = $this->pdo->prepare("SELECT * FROM sgar06");
			$stm->execute();
			return $stm->fetchAll(PDO::FETCH_OBJ);
		}
		catch(Exception $e)
		{
			die($e->getMessage());
		}

	}


	public function Obtener($IdUR)
	{
		try
		{
			$stm = $this->pdo
			          ->prepare("SELECT * FROM sgar06 WHERE IdUR = ?");


			$stm->execute(array($IdUR));
			return $stm->fetch(PDO::FETCH_OBJ);
		} catch (Exception $e)
		{
			die($e->getMessage());
		}
	}

	public function Eliminar($IdUR)
	{
		try
		{
			$stm = $this->pdo
			            ->prepare("DELETE FROM sgar06 WHERE IdUR = ?");

			$stm->execute(array($IdUR));
		} catch (Exception $e)
		{
			die($e->getMessage());
		}
	}

	public function Actualizar($data)
	{
		try
		{
			$sql = "UPDATE sgar06 SET
			            IdUser      = ?,
						      IdRol  = ?
				    WHERE IdUR  = ?";

			$this->pdo->prepare($sql)
			     ->execute(
				    array(
				    	$data->IdUser,
                        $data->IdRol,
                        $data->IdUR
					)
				);
		} catch (Exception $e)
		{
			die($e->getMessage());
		}
	}

	public function Registrar(UsuarioRoles $data)
	{
		try
		{
		$sql = "call IUR43 (?, ?)";

		$this->pdo->prepare($sql)
		     ->execute(
				array(
					$data->IdUser,
                    $data->IdRol
                )
			);
		} catch (Exception $e)
		{
			die($e->getMessage());
		}
	}


 public function ObtenercboUser()

	{
	 try
		{
			$result = array();

			$stm = $this->pdo->prepare("SELECT * FROM sgus05");
			$stm->execute();

			return $stm->fetchAll(PDO::FETCH_OBJ);
		}
		catch(Exception $e)
		{
			die($e->getMessage());
		}
	}

	public function ObtenercboRoles()

	{
	 try
		{
			$result = array();

			$stm = $this->pdo->prepare("SELECT * FROM sgro04");
			$stm->execute();

			return $stm->fetchAll(PDO::FETCH_OBJ);
		}
		catch(Exception $e)
		{
			die($e->getMessage());
		}
	}



		public function CargaPersona($IdUser)
	 {
		try
		{
			$stm = $this->pdo
			          ->prepare("SELECT userName FROM sgus05 WHERE IdUser = ?");


			$stm->execute(array($IdUser));
			return $stm->fetch(PDO::FETCH_OBJ);
		} catch (Exception $e)
		{
			die($e->getMessage());
		}
	}

	public function CargaTipoColaborador($IdRol)
	 {
		try
		{
			$stm = $this->pdo
			          ->prepare("SELECT Descripcion FROM sgro04 WHERE IdRol = ?");


			$stm->execute(array($IdRol));
			return $stm->fetch(PDO::FETCH_OBJ);
		} catch (Exception $e)
		{
			die($e->getMessage());
		}
	}
}

?>
