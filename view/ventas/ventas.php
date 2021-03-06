
<h1 class="page-header">Ventas</h1>
<div>
    <button class="btn btn-primary ff" id="v"><span class="fa fa-cart-plus"></span> Nueva venta</button>
    <button class="btn btn-primary ff" id="tdv"><span class="fa fa-list-ol"></span> Todas las ventas</button>
      <button class="btn btn-primary ff" id="rpv"><span class="fa fa-print"></span> Reporte de ventas</button>
</div>
<br>

<div id="ff">

    <div class="row">
      <div class="col col-md-12 col-sm-12 col-lg-12">
        <label class="col col-md-2 col-lg-2 col-sm-2 lblve">Vendedor : </label>
        <label class="col col-md-2 col-lg-2 col-sm-2 lblve"><?php echo $_SESSION['user'] ?> </label>
      </div>
    </div>

   <br>

    <div class="row">
      <div class="col col-md-12 col-sm-12 col-lg-12">
        <label class="col col-md-2 col-lg-2 col-sm-2 lblve">Lote : </label>
         <div class="col col-md-3 col-sm-3 col-lg-3">

           <select id="cbolote" class="selectpicker" data-live-search="true" title="Seleccione uno">
             <option value=0 class="hidden">opcion 0</option>
             <?php foreach($this->modelL->LlenarLotes() as $r): ?>
                     <option value="<?php echo $r->IdLote; ?>"> <?php echo $r->Nombre;?> </option>
             <?php endforeach; ?>
           </select>
          </div>
      </div>
    </div>

    <br>

    <div class="row">
      <div class="col col-md-12 col-sm-12 col-lg-12">
        <label class="col col-md-2 col-lg-2 col-sm-2 lblve">Cliente : </label>
         <div class="col col-md-3 col-sm-3 col-lg-3">

           <select id="cbocliente" class="selectpicker ffdd" data-live-search="true" title="Seleccione uno">
             <option value=0 class="hidden">opcion 0</option>
             <?php foreach($this->modelC->cboCliente() as $r): ?>
                     <option value="<?php echo $r->IdCliente; ?>"><?php echo $r->Cedula;?>  -- <?php echo $r->Cliente;?> </option>
             <?php endforeach; ?>

           </select>
          </div>
          <div class="col col-md-3 col-sm-3 col-lg-3">
            <a class="btn btn-success"  data-toggle="modal" data-target="#mcliente"> <span class="fa fa-plus"></span> Agregar</a>
          </div>
      </div>
    </div>

    <br>

    <div class="row">
      <div class="col col-md-12 col-sm-12 col-lg-12">
        <label class="col col-md-2 col-lg-2 col-sm-2 lblve">Monto : </label>
              <div class="form-group col col-md-3 col-sm-3 col-lg-3">
                <input type="text" class="form-control" placeholder="Digite el monto total" id="txtMonto">
              </div>
      </div>
    </div>

    <br>

    <div class="row">
      <div class="col col-md-12 col-sm-12 col-lg-12">
        <label class="col col-md-2 col-lg-2 col-sm-2 lblve">Observación : </label>
            <div class="form-group col col-md-5 col-sm-5 col-lg-5">
              <textarea class="form-control a" rows="5" placeholder="Motivo de la venta" id="txtObser"></textarea>
            </div>
      </div>
    </div>

    <br>

    <div class="row">
      <div class="col col-md-12 col-sm-12 col-lg-12">
        <div class="col col-md-4 col-sm-4 col-lg-4">
           <a class="btn btn-success" id="btnGuardarVentas"> <span class="fa fa-save"></span> Guardar </a>
           <a class="btn btn-danger" id="limpia"> <span class="fa fa-eraser"></span> Limpiar </a>
        </div>
      </div>
    </div>

</div>
<!--Fin contenedor ventas-->
<!--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
<div id="vt">

      <div class="row">
        <div class="col col-md-12">
          <div class="form-group">
            <label class="col col-md-2">Fecha inicio</label>
            <div class="col col-md-3">
              <div class="input-group date fj-date">
              <input type="text"  class="col col-md-12 fecha" placeholder="Fecha inicio" name="Fechatc" id="FI" style="height:32px;"><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
              </div>
            </div>

            <label class="col col-md-2 col-md-offset-1 ">Fecha fin</label>
            <div class="col col-md-3">
              <div class="input-group date fj-date">
              <input type="text"  class="col col-md-12 fecha" placeholder="Fecha Fin" name="Fechatc" id="FF" style="height:32px;"><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
              </div>
            </div>

          </div>
        </div>
      </div>
      <br>
      <div class="text-center">
        <button class="btn btn-info soa" type="button" id="btnConsultar"><span class="fa fa-spinner soaa" ></span> Consultar</button>
      </div>
      <br>

    <div class="table-responsive">
        <table id="tablaVentas" class="table table-bordered table-hover" cellspacing="0" width="100%">
    <thead>
            <tr>
                <th>Nº Factura</th>
                <th>Cliente</th>
                <th>Fecha</th>
                <th>Monto</th>
                <th>Lote</th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
            </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
    </div>

</div>
<!--Fin contenedor todas las ventas-->
<!--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->


<div id="rep">

  <div class="row">
    <div class="col col-md-12 col-sm-12 col-lg-12">
      <label class="col col-md-2 col-lg-2 col-sm-2 lblve">Lote : </label>
       <div class="col col-md-3 col-sm-3 col-lg-3">
         <select id="IdLL" class="selectpicker" data-live-search="true" title="Seleccione uno">
           <option value=0>Todos los lotes </option>
           <?php foreach($this->modelL->LlenarLotes() as $r): ?>
                   <option value="<?php echo $r->IdLote; ?>"> <?php echo $r->Nombre;?> </option>
           <?php endforeach; ?>
         </select>
        </div>
    </div>
  </div>

  <br>

  <div class="row">
    <div class="col col-md-12">
      <div class="form-group">
        <label class="col col-md-2">Fecha inicio</label>
        <div class="col col-md-3">
          <div class="input-group date fj-date">
          <input type="text"  class="col col-md-12 fecha" placeholder="Fecha inicio" name="Fechatc" id="FIR" style="height:32px;"><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
          </div>
        </div>

        <label class="col col-md-2 col-md-offset-1 ">Fecha fin</label>
        <div class="col col-md-3">
          <div class="input-group date fj-date">
          <input type="text"  class="col col-md-12 fecha" placeholder="Fecha Fin" name="Fechatc" id="FFR" style="height:32px;"><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
          </div>
        </div>

      </div>
    </div>
  </div>
  <br>
  <div class="text-center">
    <button class="btn btn-info soa" type="button" id="btnConsultarR"><span class="fa fa-spinner soaa" ></span> Consultar</button>
  </div>
<br>

  <div class="row">

    <div class="col col-md-4 col-sm-4 col-lg-2" id="Todos">
    </div>

    <div class="col col-md-4 col-sm-4 col-lg-2" id="Montos">
    </div>

    <div class="col col-md-4 col-sm-4 col-lg-2" id="Anulados">
    </div>
    
  </div>


</div>

<!--Fin contenedor reportes ventas-->
<!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
