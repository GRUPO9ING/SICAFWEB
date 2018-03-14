<h1 class="page-header">Balance</h1>

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
    <button class="btn btn-info soa" type="button" id="btnConsultarB"><span class="fa fa-spinner soaa" ></span> Consultar</button>
  </div>
<br>

  <div class="row">
    <div class="col col-md-2 col-sm-2 col-lg-2" id="Lotes">

    </div>
    <div class="col col-md-2 col-sm-2 col-lg-2" id="Ventas">


    </div>
    <div class="col col-md-2 col-sm-2 col-lg-2" id="Gastos">


    </div>
    <div class="col col-md-2 col-sm-2 col-lg-2" id="Balance">


    </div>
  </div>


</div>
