<?php
require_once 'model/tipoInsumo.php';

class ControlController
{

    private $model;

    public function __CONSTRUCT(){
        $this->model = new Control();
    }

    public function Index(){
        require_once 'view/tipoInsumo/index.php';
    }

    public function Crud(){
        $tip = new TipoInsumo();

        if(isset($_REQUEST['IdTI'])){
            $tip = $this->model->Obtener($_REQUEST['IdTI']);
        }

        require_once 'view/header.php';
        require_once 'view/tipoInsumo/tipoInsumo-editar.php';
        require_once 'view/footer.php';
    }

    public function Guardar(){
        $tip = new TipoInsumo();

        $tip->IdTI = $_REQUEST['IdTI'];
        $tip->Tipo = $_REQUEST['Tipo'];
        $tip->IdTI > 0
            ? $this->model->Actualizar($tip)
            : $this->model->Registrar($tip);

        header('Location: index.php?c=tipoInsumo');
    }

    public function Eliminar(){
        $this->model->Eliminar($_REQUEST['IdTI']);
        header('Location: index.php?c=tipoInsumo');
    }
}

?>
