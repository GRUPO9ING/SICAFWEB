  <div id="loteCol" class="modal fade" role="dialog">

    <div class="modal-dialog modal-sm">

      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" id="Nomb"></h4>
        </div>
        <div class="modal-body">
          <form id="Asignar" data-locked="false">
            <input type="hidden" id="idCol" value="">

         <!--  -->
         <div class="row">
           <div class="col col-sm-12 col-md-12 col-lg-12">
             <label class="col col-sm-2 col-md-2 col-lg-2">Lotes</label>
             <div class="col col-sm-10 col-md-10 col-lg-10">

              <select id="cboLot" class="selectpicker" data-live-search="true" title="Seleccione uno">
                <?php foreach($this->model->ColLote() as $r): ?>
                        <option value="<?php echo $r->IdLote?>" > <?php echo $r->Nombre?> </option>
                <?php endforeach; ?>
              </select>

             </div>
          </div>
         </div>
         <!--  -->

        <div class="modal-footer">
          <button class="btn btn-success">Guardar</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
        </div>
      </form>
      </div>

    </div>
</div>
