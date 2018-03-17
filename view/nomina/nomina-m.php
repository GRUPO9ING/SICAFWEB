

<div id="modalNomina" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <br>
        <center>
        <h4 class="modal-title">GENERAR NOMINA</h4>
      </center>
        </div>
      <div class="modal-body">
              <form id="frm-Nomina" data-locked="false">
               <div class="row">
                   <div class="col col-md-12">
                     <div class="form-group">
                         <label class="col col-md-3">Fecha Inicio</label>
                     <div class="col col-md-9">
                   <div class="input-group">
                         <input type="text" placeholder="Fecha Inicio" name="FechaInicio" id="FI" class="col col-md-12 fecha"><span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                   </div>
                    </div>
                </div>
             </div>
          </div>
       <br>
                   <div class="row">
                     <div class="col col-md-12">
                       <div class="form-group">
                           <label class="col col-md-3">Fecha Fin</label>
                       <div class="col col-md-9">
                     <div class="input-group">
                           <input type="text" placeholder="Fecha Fin" name="FechaFin" id="FF" class="col col-md-12 fecha"><span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                     </div>
                      </div>
                  </div>
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
