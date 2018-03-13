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
        <form id="frm-lote" data-locked="false" enctype="multipart/form-data">
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
                                <input type="text" class="form-control" id="AreaL" name="AreaL" placeholder="Ingrese el Área del lote" data-validacion-tipo="requerido|min:5">
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

                                    <select name="Estado" id="Estado" class="form-control">
                                        <option value="s">Seleccione</option>
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
            <button class="btn btn-success" >Guardar</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
      </div>
    </form>

    </div>
   </div>
  </div>
</div>
