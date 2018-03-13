<div id="mGuardar" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <br>
        <center>
        <h4 class="modal-title" id="nn"></h4>
        </center>
      </div>
      <div class="modal-body">
              <form id="frm-tipoInsumo" data-locked="false">
                <input type="hidden" id="id" name="IdTI"/>

                      <div class="row">
                        <div class="col col-md-12">
                            <div class="form-group">
                              <label class="col col-md-3">Tipo</label>
                              <div class="col col-md-9">
                              <input type="text" class="form-control" id="Tipo" name="Tipo" placeholder="Ingrese un tipo" data-validacion-tipo="requerido|min:5">
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
