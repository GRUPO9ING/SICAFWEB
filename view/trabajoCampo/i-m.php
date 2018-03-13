
<div id="Ins" class="modal fade" role="dialog">
  <div class="modal-dialog modal-md">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <br>
        <center>
        <h4 class="modal-title">AGREGAR INSUMO</h4>
        </center>
        </div>
      <div class="modal-body">
           <form id="frm-InsumoTC" data-locked="false">

                         <div class="row">
                           <div class="col col-md-12">
                             <label class="col col-md-3 col-sm-6 col-lg-3">Insumo :</label>
                           <div class="col col-md-9 col-sm-6 col-lg-6">
                          <select id="IdInsu" class="selectpicker" data-live-search="true" title="Seleccione uno">
                               <?php foreach($this->modelL->LlenarInsumos() as $r): ?>
                                       <option value="<?php echo $r->IdInsumo; ?>"> <?php echo $r->Nombre?> </option>
                               <?php endforeach; ?>
                           </select>
                           </div>
                         </div>
                       </div>

                        <br>

                        <div class="row">
                          <div class="col col-md-12">
                              <div class="form-group">
                                <label class="col col-md-3">Cantidad :</label>
                                <div class="col col-md-9">
                                <input type="text" class="form-control" id="Cant" name="Cant" placeholder="Ingrese cantidad" data-validacion-tipo="requerido|min:5">
                                </div>
                              </div>
                            </div>
                          </div>

                          <br>
              <div class="modal-footer">
                <button class="btn btn-success">Guardar</button>
              <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
              </div>
          </form>
    </div>
   </div>
  </div>
</div>
