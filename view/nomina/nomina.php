<h1 class="page-header">Nomina</h1>

<div class="text-left">
  <button class="btn btn-primary" data-toggle="modal" data-target="#modalNomina" ><span class="fa fa-plus-square-o"></span> Nueva nomina</button>
</div>
<br>

<div class="row" id="cbo">
<center>
    <label>Nominas :</label>
    <select id="Consul" class="selectpicker" data-live-search="true" title="Seleccione uno">
      <option value="1" id="ss">Inicia</option>
      <option value="-1">Por rangos de fecha</option>
      <?php foreach($this->model->nomiFecha() as $r): ?>
              <option value="<?php echo $r->Planilla; ?>">Inicio <?php echo $r->FechaI?> hasta <?php echo $r->FechaF?> </option>
      <?php endforeach; ?>
    </select>
</center>
</div>

<br>


<div id="fec">

  <div class="col col-md-12">
    <div class="form-group">
      <label class="col col-md-2">Fecha inicio</label>
      <div class="col col-md-3">
        <div class="input-group date fj-date">
        <input type="text"  class="col col-md-12 fecha" placeholder="Fecha del trabajo" name="Fechatc" id="FII" style="height:32px;"><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
        </div>
      </div>

      <label class="col col-md-2 col-md-offset-1 ">Fecha fin</label>
      <div class="col col-md-3">
        <div class="input-group date fj-date">
        <input type="text"  class="col col-md-12 fecha" placeholder="Fecha del trabajo" name="Fechatc" id="FFF" style="height:32px;"><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
        </div>
      </div>

    </div>
  </div>

</div>

<br>
<div class="text-center" id="fec1">
  <button class="btn btn-info soa" type="button" id="btnConsultar"><span class="fa fa-spinner soaa" ></span> Consultar</button>
</div>

<br>

<div class="table-responsive">
    <table id="tablaNomina" class="table table-bordered table-hover" cellspacing="0" width="100%">
      <thead>
        <tr>
            <th>IdNomina</th>
            <th>IdColaborador</th>
            <th>Cedula</th>
            <th>Colaborador</th>
            <th>Salario Base</th>
            <th>Salario Bruto</th>
            <th>Fecha Inicio</th>
            <th>Fecha Fin</th>
            <th>Horas</th>
            <th>N° Planilla</th>
            <th>Salario Bruto</th>
            <th></th>
            <th style="width:80px;"></th>
        </tr>
    </thead>
    <tbody>
    </tbody>
</table>
</div>
