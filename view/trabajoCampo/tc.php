<h1 class="page-header">Trabajo de Campo</h1>
<div class="text-left">
    <a class="btn btn-primary" data-toggle="modal" data-target="#TC" id="creatc"><span class="fa fa-plus-square-o"></span> Nuevo</a>
</div>
<br>
<div class="row">
  <div class="col col-md-12">
    <div class="form-group">
      <label class="col col-md-2">Fecha inicio</label>
      <div class="col col-md-3">
        <div class="input-group date fj-date">
        <input type="text"  class="col col-md-12 fecha" placeholder="Fecha del trabajo" name="Fechatc" id="FI" style="height:32px;"><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
        </div>
      </div>

      <label class="col col-md-2 col-md-offset-1 ">Fecha fin</label>
      <div class="col col-md-3">
        <div class="input-group date fj-date">
        <input type="text"  class="col col-md-12 fecha" placeholder="Fecha del trabajo" name="Fechatc" id="FF" style="height:32px;"><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
        </div>
      </div>

    </div>
  </div>
</div>
<br>
<div class="text-center">
  <button class="btn btn-info soa" type="button" id="btnConsultar"><span class="fa fa-spinner soaa" ></span> Consultar</button>
</div>

<div class="table-responsive">

  <table id="TablatrC" class="table table-hover " cellspacing="0" width :"100%";>
      <thead>
          <tr>
              <th>IdTc</th>
              <th>Fecha</th>
              <th>Invertido</th>
              <th>idlote</th>
              <th>Lote</th>
              <th></th>
          </tr>
      </thead>
       <tbody>
       </tbody>
   </table>

</div>
