<?php
class Persona
{
	private $pdo;

    public $IdPersona;
    public $Cedula;
    public $Nombre;
    public $Apellido1;
    public $Apellido2;
    public $Telefono;
    public $Direccion;
    public $Correo;

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
			$stm = $this->pdo->prepare("SELECT * FROM uspr01");
			$stm->execute();
     return $stm->fetchAll(PDO::FETCH_OBJ);
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

	public function Eliminar($IdPersona)
	{

		try
		{
			$stm = $this->pdo
			            ->prepare("DELETE FROM uspr01 WHERE IdPersona = ?");

			return $stm->execute(array($IdPersona));
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

			return $this->pdo->prepare($sql)
			     ->execute(
				    array(
				    	$data->Cedula,
                        $data->Nombre,
                        $data->Apellido1,
                        $data->Apellido2,
                        $data->Telefono,
                        $data->Direccion,
                        $data->Correo,
                        $data->IdPersona
					)
				);
		} catch (Exception $e)
		{
			die($e->getMessage());
		}
	}

	public function Registrar(Persona $data)
	{
		try
		{
		 $sql = "INSERT INTO uspr01 (Cedula,Nombre,Apellido1,Apellido2,Telefono,Direccion,Correo)
		        VALUES (?, ?, ?, ?, ?, ?, ?)";

		return $this->pdo->prepare($sql)
		     ->execute(
				array(
					          $data->Cedula,
                    $data->Nombre,
                    $data->Apellido1,
                    $data->Apellido2,
                    $data->Telefono,
                    $data->Direccion,
                    $data->Correo
                )
			);
		} catch (Exception $e)
		{
			die($e->getMessage());
		}
	}
}
