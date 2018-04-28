

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
              <form id="frm-colaborador" method="post">

                <input type="hidden" id="IdCol" value="-1">
                <input type="hidden" id="id">

                      <div class="row">
                        <div class="col col-md-12">
                            <div class="form-group">
                              <label class="col col-md-3">Cedula</label>
                              <div class="col col-md-9">
                              <input type="number" class="form-control" name="Cedula" id="Cedula"  placeholder="Ingrese el número de cédula" name="Cedula" required>
                              </div>
                            </div>
                          </div>
                        </div>

                        <br>

                        <div class="row">
                          <div class="col col-md-12">
                              <div class="form-group">
                                <label class="col col-md-3">Nombre</label>
                                <div class="col col-md-9">
                                <input type="text" class="form-control" id="Nombre" name="Nombre" placeholder="Ingrese nombre"  required>
                              </div>
                              </div>
                            </div>
                          </div>

                          <br>

                          <div class="row">
                            <div class="col col-md-12">
                                <div class="form-group">
                                  <label class="col col-md-3">Apellido 1</label>
                                  <div class="col col-md-9">
                                  <input type="text" class="form-control" id="ap1" name="ap1" placeholder="Ingrese primer apellido"  required>
                                </div>
                                </div>
                              </div>
                            </div>

                            <br>

                            <div class="row">
                              <div class="col col-md-12">
                                  <div class="form-group">
                                    <label class="col col-md-3">Apellido 2</label>
                                    <div class="col col-md-9">
                                    <input type="text" class="form-control" id="ap2" name="ap2" placeholder="Ingrese segundo apellido"  required>
                                  </div>
                                  </div>
                                </div>
                              </div>


                              <br>

                              <div class="row">
                                <div class="col col-md-12">
                                  <div class="form-group">
                                    <label class="col col-md-3">Telefono</label>
                                      <div class="col col-md-9">
                                      <input type="text" class="form-control" id="tel" name="tel" placeholder="Ingrese número de teléfono"  required>
                                    </div>
                                  </div>
                                </div>
                              </div>

                              <br>

                          <div class="row">
                              <div class="col col-md-12">
                                  <div class="form-group">
                                    <label class="col col-md-3">Direccion</label>
                                       <div class="col col-md-9">
                                       <input type="text" class="form-control" id="dir" name="dir" placeholder="Ingrese dirección" required>
                                    </div>
                              </div>
                          </div>
                          </div>

                                                        <br>

                                                    <div class="row">
                                                        <div class="col col-md-12">
                                                            <div class="form-group">
                                                              <label class="col col-md-3">Correo</label>
                                                                 <div class="col col-md-9">
                                                                 <input type="email" id="cor" class="form-control" name="cor" placeholder="Ingrese Correo" required>
                                                              </div>
                                                        </div>
                                                    </div>

             </div>
             <br>
             <div class="row">
               <div class="col col-md-12">
                   <div class="form-group">
                     <label class="col col-md-3">Tipo</label>
                     <div class="col col-md-9">
                       <select id="IdTC" name="IdTC" class="selectpicker" data-live-search="true" title="Seleccione uno">
                          <?php foreach($this->model->Obtenercbo() as $r): ?>
                               <option value="<?php echo $r->IdTipoColaborador?>"> <?php echo $r->Tipo;?> </option>
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
                                                                           <label class="col col-md-3">Fecha de ingreso</label>
                                                                           <div class="col col-md-9">
                                                                             <div class="input-group">
                                                                             <input type="text"   placeholder="Fecha Ingreso" name="FechaIngreso" id="FechaIngreso" class="col col-md-12 fecha" style="height:32px;"><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                                                             </div>
                                                                           </div>
                                                                         </div>
                                                                       </div>
                                                                     </div>

                                                                       <br>

        <div class="row">
             <div class="col col-md-12">
               <div class="form-group">
                   <label class="col col-md-3">Salario base</label>
                    <div class="col col-md-4">
                    <input type="number" id="sal" class="form-control" name="sal" placeholder="Salario Base" required>
                     </div>

                     <label class="col col-md-2">Horas</label>
                      <div class="col col-md-3">
                        <input type="number" id="horas" class="form-control" name="horas" placeholder="Cantidad" required>
                      </div>
               </div>
             </div>
        </div>
     <br>
     <div class="row">
          <div class="col col-md-12">
            <div class="form-group">
                <label class="col col-md-3">Salario bruto</label>
                 <div class="col col-md-4">
                 <label>₡ </label><label id="salB" name="salB"></label>
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
