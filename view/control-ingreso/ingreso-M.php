

<div id="mGuardar" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <br>
        <h4 class="modal-title">Nuevo Usuario</h4>
      </div>
      <div class="modal-body">

        <form id="frm-insumo" action="?c=Insumo&a=Guardar" method="post" enctype="multipart/form-data">
          <input type="hidden" id="IdInsumo" name="IdInsumo" value="<?php echo $ins->IdInsumo; ?>" />


                <div class="row">
                  <div class="col col-md-12">
                    <label class="col col-md-3">Tipo</label>
                  <div class="col col-md-9">
                  <select id="IdTI" name="IdTI" class="form-control">
                      <option> SELECCIONE</option>
                      <?php foreach($this->model->Obtenercbo() as $r): ?>
                              <option value="<?php echo $r->IdTI; ?>"> <?php echo $r->Tipo;?> </option>
                      <?php endforeach; ?>
                  </select>
                  </div>

                </div>
              </div>
                     <br>
                      <div class="row">
                        <div class="col col-md-12">
                            <div class="form-group">
                              <label class="col col-md-3">Nombre</label>
                              <div class="col col-md-9">
                              <input type="text" class="form-control" id="Nombre"  placeholder="Ingrese el nombre" name="Nombre" required>
                              </div>
                            </div>
                          </div>
                        </div>

                        <br>

                        <div class="row">
                          <div class="col col-md-12">
                              <div class="form-group">
                                <label class="col col-md-3">Cantidad</label>
                                <div class="col col-md-9">
                                <input type="number" class="form-control" id="Cantidad" name="Cantidad" placeholder="Ingrese la Cantidad"  required>
                              </div>
                              </div>
                            </div>
                          </div>

                          <br>

                          <div class="row">
                            <div class="col col-md-12">
                              <div class="form-group">
                                <label class="col col-md-3">Fecha de compra</label>
                                <div class="col col-md-9">
                                  <div class="input-group date fj-date">
                                  <input type="text"  class="form-control fecha datepicker" name="FechaComp" id="FechaComp"><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>

                            <br>

                            <div class="row">
                              <div class="col col-md-12">
                                <div class="form-group">
                                      <label class="col col-md-3">Fecha de vencimiento</label>
                                  <div class="col col-md-9">
                                    <div class="input-group date fj-date">
                                      <input  type="text" class="form-control datepicker fecha" name="FechaVence" id="FechaVence" ><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                      </div>
                                    </div>
                                   </div>
                                  </div>
                                </div>
                            <br>

                            <div class="row">
                              <div class="col col-md-12">
                                  <div class="form-group">
                                    <label class="col col-md-3">Precio Unidad</label>
                                    <div class="col col-md-9">
                                    <input type="number" class="form-control" id="PrecioUnit" onKeyUp="up()" name="PrecioUnit" placeholder="Ingrese el precio unitario"  required>
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
                                      <input type="text" class="form-control" id="Detalle" name="Detalle" placeholder="Ingrese algun detalle"  required>
                                    </div>
                                  </div>
                                </div>
                              </div>

                              <br>

                          <div class="row">
                              <div class="col col-md-12">
                                  <div class="form-group">
                                    <label class="col col-md-3">Procedencia</label>
                                       <div class="col col-md-9">
                                       <input type="text" class="form-control" id="proce" name="proce" placeholder="Ingrese Procedencia" required>
                                    </div>
                              </div>
                          </div>
                          </div>

                                                        <br>

             </div>
      <div class="modal-footer">
            <button class="btn btn-success">Guardar</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
      </div>
      <script >

                  function up() {
                    var fecha =document.getElementById("FechaVence").value;
                      alert(fecha);
          		    }
      </script>
    </form>
    </div>
   </div>
  </div>
</div>
