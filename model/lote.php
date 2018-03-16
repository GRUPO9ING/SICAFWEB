<?php
class Lote
{

    private $pdo;

    public $IdLote;
    public $Nombre;
    public $AreaL;
    public $Estado;
    public $Produccion;

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
			$stm = $this->pdo->prepare("SELECT * FROM selo09");
			$stm->execute();

			return $stm->fetchAll(PDO::FETCH_OBJ);
		}
		catch(Exception $e)
		{
			die($e->getMessage());
		}
	}

	public function Obtener($IdLote)
	{
		try
		{
			$stm = $this->pdo
			          ->prepare("SELECT * FROM selo09 WHERE IdLote = ?");


			$stm->execute(array($IdLote));
			return $stm->fetch(PDO::FETCH_OBJ);
		} catch (Exception $e)
		{
			die($e->getMessage());
		}
	}

	public function Eliminar($IdLote)
	{
		try
		{
			$stm = $this->pdo
			            ->prepare("DELETE FROM selo09 WHERE IdLote = ?");

			return $stm->execute(array($IdLote));
		} catch (Exception $e)
		{
			die($e->getMessage());
		}
	}

	public function Actualizar($data)
	{
		try
		{
			$sql = "UPDATE selo09 SET
						Nombre       = ?,
						AreaL        = ?,
						Estado       = ?,
						Produccion   = ?
				    WHERE IdLote     = ?";

			 return $this->pdo->prepare($sql)->execute(
				    array(
                        $data->Nombre,
                        $data->AreaL,
                        $data->Estado,
                        $data->Produccion,
                        $data->IdLote
					)
				);
		} catch (Exception $e)
		{
			die($e->getMessage());
		}
	}

	public function Registrar(Lote $data)
	{
		try
		{
		$sql = "INSERT INTO selo09 (Nombre,AreaL,Estado,Produccion)
		        VALUES (?, ?, ?, ?)";

		 return $this->pdo->prepare($sql)->execute(
				array(
                    $data->Nombre,
                    $data->AreaL,
                    $data->Estado,
                    $data->Produccion
                )
			);
		} catch (Exception $e)
		{
			die($e->getMessage());
		}
	}

  public function TrabajoCampo($fecha)
	{
    $fecha = date('Y-m-d', strtotime($fecha));
		try
		{
        $sql = "CALL CreaTC(?)";
        $stm = $this->pdo->prepare($sql);
        $stm->execute(array($fecha));
        return $stm->fetchAll(PDO::FETCH_OBJ);
      } catch (Exception $e)
      {
        die($e->getMessage());
      }

	}

  public function colTrabajo($idCol){
    try
 		{
         $sql = "CALL InTCO(?)";
         $stm = $this->pdo->prepare($sql);
         $stm->execute(array($idCol));
         return $stm->fetchAll(PDO::FETCH_OBJ);
       } catch (Exception $e)
       {
         die($e->getMessage());
       }
  }

  public function ElicolTrabajo($idCol,$id){
    try
 		{
         $sql = "CALL DlTCO(?,?)";
         return $this->pdo->prepare($sql)->execute(array($idCol,$id));
       } catch (Exception $e)
       {
         die($e->getMessage());
       }
  }

    public function LlenarLotes()	{
  	 try
  		{
  			$stm = $this->pdo->prepare("CALL ListaHabilitadoLote()");
  			$stm->execute();

  			return $stm->fetchAll(PDO::FETCH_OBJ);
  		}
  		catch(Exception $e)
  		{
  			die($e->getMessage());
  		}
  	}

    public function InsertaInsumoTc($insu,$idtc,$cant){
      try
   		{
           $sql = "CALL InTCLO(?,?,?)";
           $stm = $this->pdo->prepare($sql);
           $stm->execute(array($insu,$idtc,$cant));
           return $stm->fetchAll(PDO::FETCH_OBJ);
         } catch (Exception $e)
         {
           die($e->getMessage());
         }
    }

    public function LlenarInsumos(){
      try
   		{
           $sql = "SELECT IdInsumo,Nombre,Cantidad FROM inin08";
           $stm = $this->pdo->prepare($sql);
           $stm->execute();
           return $stm->fetchAll(PDO::FETCH_OBJ);
         } catch (Exception $e)
         {
           die($e->getMessage());
         }
    }


    	public function ListarInTC($id)
    	{
    		try
    		{
    			$result = array();
    			$stm = $this->pdo->prepare("CALL Insum(?)");
    			$stm->execute(array($id));
    			return $stm->fetchAll(PDO::FETCH_OBJ);
    		}
    		catch(Exception $e)
    		{
    			die($e->getMessage());
    		}
    	}

      public function actualiza($id){
        try {
          $stm = $this->pdo->prepare("CALL TotalInsumoXIDTC(?);");
          $stm->execute(array($id));
          return $stm->fetchAll(PDO::FETCH_OBJ);
        } catch (Exception $e) {
          die($e->getMessage());
        }

      }


      public function ListarTC($fi2,$ff2)
    	{
        $fi = date('Y-m-d', strtotime($fi2));
        $ff = date('Y-m-d', strtotime($ff2));

    		try
    		{
    			$stm = $this->pdo->prepare("CALL selecTC(?,?)");
    			$stm->execute(array($fi,$ff));
    			return $stm->fetchAll(PDO::FETCH_OBJ);
    		}
    		catch(Exception $e)
    		{
    			die($e->getMessage());
    		}

    	}

      public function InsertarTC($idLote,$idTc,$fecha,$horas,$jus)
    	{
        $fecha = date('Y-m-d', strtotime($fecha));
    		try
    		{
    			$result = array();
    			$stm = $this->pdo->prepare("CALL INSERTARTCLO(?,?,?,?,?)");
    			return $stm->execute(array($idLote,$idTc,$fecha,$horas,$jus));
    		}
    		catch(Exception $e)
    		{
    			die($e->getMessage());
    		}
    	}

      public function ListaColsTRC($idTc)
    	{
        try
    		{
    			$result = array();
    			$stm = $this->pdo->prepare("CALL ColColTC(?)");
    			$stm->execute(array($idTc));
    			return $stm->fetchAll(PDO::FETCH_OBJ);
    		}
    		catch(Exception $e)
    		{
    			die($e->getMessage());
    		}
      }



            public function quitarInsumo($id)
            {

                  try
                  {
                   $stm = $this->pdo->prepare("CALL RevertirRestaInsumo(?)");

                  return $stm->execute(array($id));

                  }
                   catch (Exception $e)
                   {
                   die($e->getMessage());
                   }

            }


}
