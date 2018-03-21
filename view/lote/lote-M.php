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
        <form id="frm-lote" method="post">
                    <input type="hidden" name="IdLote" id="IdLote"/>

                      <div class="row">
                        <div class="col col-md-12">
                            <div class="form-group">
                              <label class="col col-md-3">Nombre</label>
                              <div class="col col-md-9">
                              <input type="text" class="form-control" id="Nombre" name="Nombre" placeholder="Ingrese un nombre" data-validacion-tipo="requerido|min:5">
                            </div>
                            </div>
                          </div>
                        </div>
                        <br>
                        <div class="row">
                          <div class="col col-md-12">
                              <div class="form-group">
                                <label class="col col-md-3">Área</label>
                                <div class="col col-md-9">
                                <input type="text" class="form-control" id="AreaL" name="AreaL" placeholder="M²" data-validacion-tipo="requerido|min:5">
                              </div>
                              </div>
                            </div>
                          </div>
                            <br>
                          <div class="row">
                            <div class="col col-md-12">
                                <div class="form-group">
                                  <label class="col col-md-3">Estado</label>
                                  <div class="col col-md-9">

                                    <select id="Estado" name="Estado" class="selectpicker" data-live-search="true" title="Seleccione uno">
                                        <option value="Habilitado">Habilitado</option>
                                        <option value="Deshabilitado">Deshabilitado</option>
                                    </select>

                                </div>
                                </div>
                              </div>
                            </div>
                        <br>


                                                <div class="row">
                                                  <div class="col col-md-12">
                                                      <div class="form-group">
                                                        <label class="col col-md-3">Produccion</label>
                                                        <div class="col col-md-9">
                                                        <input type="text" class="form-control" id="Produccion" name="Produccion" placeholder="Ingrese lo producido" data-validacion-tipo="requerido|min:5">
                                                      </div>
                                                      </div>
                                                    </div>
                                                  </div>
                                                  <br>
      <div class="modal-footer">
            <button class="btn btn-success" id="Enviar">Guardar</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
      </div>
    </form>

    </div>
   </div>
  </div>
</div>
