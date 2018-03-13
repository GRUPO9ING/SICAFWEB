

<div id="mGuardar" class="modal fade" role="dialog">
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
              <form id="frm-usuarioRoles" data-locked="false">
                <input type="hidden" id="id" name="IdUR" />

                      <div class="row">
                        <div class="col col-md-12">
                            <div class="form-group">
                              <label class="col col-md-3">Nombre</label>
                              <div class="col col-md-9">
                              <input type="text" class="form-control" name="Nombre" id="nom"  placeholder="Ingrese el nombre"  required>
                              </div>
                            </div>
                          </div>
                        </div>

                        <br>

                         <select name="IdUser">
                           <option> SELECCIONE</option>
                             <?php foreach($this->model->ObtenercboUser() as $r): ?>
                                <option value="<?php echo $r->IdUser; ?>"> <?php echo $r->userName;?> </option>
                              <?php endforeach; ?>
                           </select><br>

                           <br>

                        <select name="IdRol">
                           <option> SELECCIONE</option>
                             <?php foreach($this->model->ObtenercboRol() as $r): ?>
                                <option value="<?php echo $r->IdRol; ?>"> <?php echo $r->Descripcion;?> </option>
                              <?php endforeach; ?>
                           </select><br>

                         

                            </div>
                            <div class="modal-footer">
                                  <button class="btn btn-success btnGuardar" id="Enviar">Guardar</button>
                              <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                            </div>
                          </form>
                          </div>
                         </div>
                        </div>
                      </div>
