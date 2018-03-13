

<div id="mHoras" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <br>
        <center>
        <h4 class="modal-title" id="nn" style="color : #426ef4;"></h4>
      </center>
        </div>
      <div class="modal-body">
              <form id="frm-horas" data-locked="false">
            <input type="text" class="hidden" id="idHe">
              <div class="row">
               <div class="col col-md-12">
                   <div class="form-group">
                     <label class="col col-md-3">Colaborador</label>
                     <div class="col col-md-9">
                     <select class="form-control" name="IdTC" id="IdTC">
                       <option> SELECCIONE</option>
                       <?php foreach($this->model->ObcboCol() as $r): ?>
                               <option value="<?php echo $r->IdColaborador?>"> <?php echo $r->Col?> </option>
                       <?php endforeach; ?>
                     </select>
                   </div>
                   </div>
                 </div>
               </div>
               <br>

               <div class="row">
                 <div class="col col-md-12">
                     <div class="form-group">
                       <label class="col col-md-3">Cantidad de horas</label>
                       <div class="col col-md-3">
                       <input class="form-control" type="number" id="cHoas">
                     </div>
                     </div>
                   </div>
                 </div>
                 <br>

                 <div class="row">
                   <div class="col col-md-12">
                     <div class="form-group">
                         <label class="col col-md-3">Fecha Horas</label>
                     <div class="col col-md-9">
                   <div class="input-group">
                         <input type="text" placeholder="Fecha horas" name="FechaFin" id="FF" class="col col-md-12 fecha" style="height:32px;"><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                   </div>
                    </div>
                </div>
               </div>
            </div>



    <div class="modal-footer">
            <button class="btn btn-success btnHorasG" id="Enviar">Guardar</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
      </div>
    </form>
    </div>
   </div>
  </div>
</div>
