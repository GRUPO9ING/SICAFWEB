
<div id="TC" class="modal fade" role="dialog">
  <div class="modal-dialog modal-lg">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <br>
        <center>
        <h4 class="modal-title">TRABAJO DE CAMPO</h4>
      </center>
        </div>
      <div class="modal-body">
        <form id="frm-tc" data-locked="false">
            <input type="text" id="idTC" class="hidden">

                  <div class="row">
                      <label class="col col-md-3 col-sm-3" id="ColDiv">Colaboradores :</label>
                      <div class="col col-md-3 col-sm-3" style="postion:relative; top:-5px;">
                      <button type="button" id="aaa" class="btn btn-success" data-toggle="modal" data-target="#COLS"> <span class="fa fa-plus"></span> </button>
                      </div>
                  </div>
                  <br>
                  <div class="row">
                    <div class="col col-md-12">


                      <label class="col col-md-3 col-sm-3 col-lg-3">Lote :</label>
                    <div class="col col-md-4 col-sm-4 col-lg-4">
                    <select id="IdLO" class="selectpicker" data-live-search="true" title="Seleccione uno">
                        <?php foreach($this->modelL->LlenarLotes() as $r): ?>
                                <option value="<?php echo $r->IdLote; ?>"> <?php echo $r->Nombre;?> </option>
                        <?php endforeach; ?>
                    </select>
                    </div>
                       <div class="form-group">
                          <label class="col col-md-1 col-sm-2 col-lg-1">Horas</label>
                          <div class="col col-md-3 col-sm-3 col-md-3">
                          <input type="text" class="form-control" id="Hr" placeholder="Horas" title="Cantidad de horas para realizar el trabajo">
                        </div>
                        </div>

                  </div>
                </div>
                <br>
                                          <div class="row">
                                            <div class="col col-md-12 col-sm-12 col-lg-12">


                                              <div class="form-group">
                                                <label class="col col-md-3">Fecha de trabajo</label>
                                                <div class="col col-md-3">
                                                  <div class="input-group date fj-date">
                                                  <input type="text"  class="col col-md-12 fecha" placeholder="Fecha del trabajo" name="Fechatc" id="Fechatc" style="height:32px;"><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                                  </div>
                                                </div>
                                              </div>


                                                 <div class="form-group">
                                                      <label class="col col-md-2 col-sm-2 col-lg-2">¿Que se realizo?</label>
                                                      <div class="col col-md-3 col-sm-3 col-md-3">
                                                      <textarea style="resize:none" class="form-control" id="jus" placeholder="La acción que se realizo" title="La acción que se realizo">
                                                      </textarea>
                                                      </div>
                                                  </div>

                                            </div>
                                          </div>

                <br>
                <div class="text-left">
                  <button type="button" class="btn btn-success" data-toggle="modal" data-target="#Ins"><span class="fa fa-plus"></span> Agregar Insumo</button>
                  </div>
                          <table id="TablaIns" class="table table-bordered table-hover" cellspacing="0" width="100%">
                                  <thead>
                                    <tr>
                                    <th>IdTCL</th>
                                    <th>IdTC</th>
                                    <th>IdInsumo</th>
                                    <th>Insumo</th>
                                    <th>Cantidad</th>
                                    <th>Costo</th>
                                    <th></th>
                                    </tr>
                                  </thead>
                                <tbody>
                                </tbody>
                            </table>
                <br>

                <div class="row">
                  <div class="col col-md-12 col-sm-12 col-lg-12">
                   <label class="col col-md-2 col-sm-2 col-lg-2">Total invertido :</label>
                   <label class="col col-md-2 col-sm-2 col-lg-2" id="invert">0</label>
                  </div>
                </div>
                <br>
    <div class="modal-footer">
            <button class="btn btn-success btnGuardar" id="Enviar">Guardar</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
      </div>
      </form>
    </div>
   </div>
  </div>
</div>
