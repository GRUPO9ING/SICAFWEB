
<div id="mTipo" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <br>
        <center>
          <h4 class="modal-title"> Tipo colaborador</h4>
      </center>
        </div>
      <div class="modal-body">
        <form id="frm-tipocol" method="post">
        <input type="hidden" id="id" value="">
          <div class="row">
            <div class="col col-md-12">
                <div class="form-group">
                  <label class="col col-md-3">Tipo</label>
                  <div class="col col-md-9">
                  <input type="text" class="form-control" name="tipo" id="tipo"  placeholder="Ingrese el tipo" name="tipo" required>
                  </div>
                </div>
              </div>
            </div>

            <br>

            <div class="row">
              <div class="col col-md-12">
                  <div class="form-group">
                    <label class="col col-md-3">Detalle</label>
                    <div class="col col-md-9">
                    <input type="text" class="form-control" id="Detalle" name="Detalle" placeholder="Detalle"  required>
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
