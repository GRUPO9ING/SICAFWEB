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




	public function Eliminar($IdNomina)
	{

		try
		{
			$stm = $this->pdo
			            ->prepare("DELETE FROM uspr01 WHERE IdPersona = ?");

			$stm->execute(array($IdNomina));
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
		try
		{
		$sql = "INSERT INTO uspr01 (Cedula,Nombre,Apellido1,Apellido2,Telefono,Direccion,Correo)
		        VALUES (?, ?, ?, ?, ?, ?, ?)";

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
