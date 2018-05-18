

<div id="mGuardar" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <br>
        <center>
        <h4 class="modal-title" id="nn" style="color : #426ef4;">Nuevo usuario</h4>
      </center>
        </div>
      <div class="modal-body">
              <form id="frm-usuario" method="post">
                <input type="hidden" id="id" name="IdUR" />

                      <div class="row">
                        <div class="col col-md-12">
                            <div class="form-group">
                              <label class="col col-md-4">Nombre</label>
                              <div class="col col-md-8">
                              <input type="text" class="form-control" name="nom" id="nom"  placeholder="Ingrese el nombre">
                              </div>
                            </div>
                          </div>
                        </div>

                        <br>

                        <div class="row">
                          <div class="col col-md-12">
                              <div class="form-group">
                                <label class="col col-md-4">Primer apellido</label>
                                <div class="col col-md-8">
                                <input type="text" class="form-control" name="ap1" id="ap1"  placeholder="primer apellido">
                                </div>
                              </div>
                            </div>
                          </div>

                         <br>

                         <div class="row">
                           <div class="col col-md-12">
                               <div class="form-group">
                                 <label class="col col-md-4">Segundo apellido</label>
                                 <div class="col col-md-8">
                                 <input type="text" class="form-control" name="ap2" id="ap2"  placeholder="segundo apellido">
                                 </div>
                               </div>
                             </div>
                           </div>

                           <br>

                           <div class="row">
                             <div class="col col-md-12">
                                 <div class="form-group">
                                   <label class="col col-md-4">Nombre de usuario</label>
                                   <div class="col col-md-8">
                                   <input type="text" class="form-control" name="user" id="user"  placeholder="username">
                                   </div>
                                 </div>
                               </div>
                             </div>

                             <br>

                             <div class="row">
                               <div class="col col-md-12">
                                   <div class="form-group">
                                     <label class="col col-md-4">Contraseña</label>
                                     <div class="col col-md-8">
                                     <input type="password" class="form-control" name="pw1" id="pass"  placeholder="ingrese una contraseña">
                                     </div>
                                   </div>
                                 </div>
                               </div>

                               <br>

                               <div class="row">
                                 <div class="col col-md-12">
                                     <div class="form-group">
                                       <label class="col col-md-4">Confirmar Contraseña</label>
                                       <div class="col col-md-8">
                                       <input type="password" class="form-control" name="pw2" id="pass2"  placeholder="Confirmar">
                                       </div>
                                     </div>
                                   </div>
                                 </div>
<br>
                                 <div class="row">
                                   <div class="col col-md-12">
                                       <div class="form-group">
                                         <label class="col col-md-4">Correo</label>
                                         <div class="col col-md-8">
                                         <input type="email" class="form-control" name="correo" id="correo"  placeholder="correo">
                                         </div>
                                       </div>
                                     </div>
                                   </div>

                                 <br>

                                 <div class="row">
                                   <div class="col col-md-12">
                                       <div class="form-group">
                                         <div class="col col-md-4">
                                           <input type="checkbox" class="form-check-input" id="admin">
                                           <label>Administrador</label>
                                         </div>
                                         </div>
                                       </div>
                                     </div>
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
                      </div>
