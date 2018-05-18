<?php
class Usuario
{

    private $pdo;
    public $Id;
    public $Nombre;
    public $Apellido1;
    public $Apellido2;
    public $username;
    public $pass;
    public $Rol;
    public $recu;
    public $correo;

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

			$stm = $this->pdo->prepare("CALL dataUsuario();");
			$stm->execute();

			return $stm->fetchAll(PDO::FETCH_OBJ);
		}
		catch(Exception $e)
		{
			die($e->getMessage());
		}
	}

  public function cambiar($user,$pw){
    $recu = md5(microtime());
    try {

      $stm = $this->pdo->prepare("CALL changepw(?,?,?);");
      return $stm->execute(array(
                                 $user,
                                 $pw,
                                 $recu
                                  ));

    }
    catch (Exception $e)
    {
    die($e->getMessage());
    }
  }


  public function insertar($data){
    $data->recu = md5(microtime());
    try {

 			$stm = $this->pdo->prepare("CALL newUser(?,?,?,?,?,?,?,?);");
 			return $stm->execute(array(
                          $data->username,
                          $data->pass,
                          $data->Nombre,
                          $data->Apellido1,
                          $data->Apellido2,
                          $data->Rol,
                          $data->recu,
                          $data->correo));

    }
    catch (Exception $e)
    {
    die($e->getMessage());
    }
  }

  public function encrypt($string)
    {
    $encriptado ='';
    $long = strlen($string);
    for ($x=0; $x <$long ; $x++) {
      /*aca se obtuvo la longitud de la variable y por cada posicion de letra par se cambiara por un valor al de md5*/
      $encriptado .= ($x % 2) != 0 ? md5($string[$x]) : $x;
    }
    return md5($encriptado);
    }

    public function traercodigo($rec){
      try {
     			$stm = $this->pdo->prepare("CALL codigorecuperacion(?);");
     		  $stm->execute(array($rec));
	        return $stm->fetchAll(PDO::FETCH_OBJ);
        }
        catch (Exception $e)
        {
        die($e->getMessage());
        }
    }

}

?>
