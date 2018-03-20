<?php
class Login
{
	private $pdo;

    public $username;
    public $pass;

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

	public function Autenticar(Login $log)
	{
	try
	{
		$stm = $this->pdo
							->prepare("CALL verifi(?,?)");
		$stm->execute(array($log->username,$log->pass));
		return $stm->fetchAll(PDO::FETCH_OBJ);
	} catch (Exception $e)
	{
		die($e->getMessage());
	}
	}


}
