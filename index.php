<?php
require_once 'model/database.php';

require_once "controller/persona.controller.php";
require_once "controller/insumo.controller.php";
require_once "controller/tipoInsumo.controller.php";
require_once "controller/lote.controller.php";
require_once "controller/inicio.controller.php";
require_once "controller/nomina.controller.php";
require_once "controller/cliente.controller.php";
require_once "controller/colaborador.controller.php";
require_once "controller/login.controller.php";
require_once "controller/usuario.controller.php";
require_once "controller/tc.controller.php";
require_once "controller/ventas.controller.php";
require_once "controller/control.controller.php";


if(isset($_REQUEST['c']))
{
    $controller = $_REQUEST['c'];
}
else {
    $controller = 'inicio';
}

// Todo esta lógica hara el papel de un FrontController
if(!isset($_REQUEST['c']))
{
    $controller = ucwords($controller) . 'Controller';
    $controller = new $controller;
    $controller->Index();
}
else
{
    // Obtenemos el controlador que queremos cargar
    $controller = strtolower($_REQUEST['c']);
    $accion = isset($_REQUEST['a']) ? $_REQUEST['a'] : 'Index';
    $controller = ucwords($controller) . 'Controller';
    $controller = new $controller;

    if(!isset($_SESSION['user']))
    {
      $controller = strtolower('Login');
      $controller = ucwords($controller) . 'Controller';
      $controller = new $controller;
      call_user_func( array( $controller, $accion ) );
    }
    else
    {
      // Llama la accion
        call_user_func( array( $controller, $accion ) );
    }

}
