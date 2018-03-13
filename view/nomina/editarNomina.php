
<div id="EditarNomina" class="modal fade" role="dialog">
  <div class="modal-dialog modal-lg">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <br>
        <center>
        <h4 class="modal-title">EDITAR NOMINA INDIVIDUAL</h4>
      </center>
        </div>
      <div class="modal-body">
              <form id="frm-Nomina" data-locked="false">

                  <div class="row">
                      <div class="col col-offset-md-4 col-md-4 col-sm-6"><label>Cedula : </label> <label id="Ced"></label></div>
                      <div class="col col-offset-md-4 col-md-4 col-sm-6"><label>Id Colaborador : </label> <label id="idCol"></label></div>
                      <input type="text" id="idCol1" class="hidden">
                      <input type="text" id="idNomina" class="hidden">
                      <input type="text" id="salBruto" class="hidden">
                  </div>


                <div class="row">
                  <div class="col col-offset-md-4 col-md-4 col-sm-4"><label>Nombre : </label> <label id="ENombre"></label></div>
                  <div class="col col-offset-md-4 col-md-4 col-sm-4"><label>Numero de planilla : </label> <label id="pl"></label></div>
                  <div class="col col-offset-md-4 col-md-4 col-sm-4"><label>Horas aprovechadas : </label> <label id="hapr"></label></div>
                </div>

                <div class="row">
                    <div class="col col-md-4 col-sm-4"><label>Fecha Inicio : </label> <label id="fInicio"></label></div>
                    <div class="col col-md-4 col-sm-4"><label>Fecha Fin : </label> <label id="fFin"></label></div>
                    <div class="col col-md-4 col-sm-4"><label>Horas Extras : </label> <label id="HE"></label></div>
                </div>

                <div class="row">
                  <div class="col col-md-4 col-sm-4"><label>Salario Base : ₡</label> <label id="SalB"></label></div>
                  <div class="col col-md-4 col-sm-4"><label>Salario Bruto : ₡</label> <label id="SalBr"></label></div>
                  <div class="col col-md-4 col-sm-4"><label>Horas : </label> <label id="Horas"></label></div>
                </div>

                <div class="row">
                      <center> <label> <strong> <h4>CONCEPTOS</h4></strong> </label> </center>
                </div>

                <div class="row">

                  <div class="col col-sm-12 col-md-6">
                    <center> <label> <strong>Conceptos del colaborador</strong> </label> </center>
                            <div class="table-responsive">
                                <table id="tablaDC" class="table table-bordered table-hover" cellspacing="0" width="100%">
                                  <thead>
                                                  <tr>
                                                    <th></th>
                                                    <th>Id</th>
                                                    <th>Nombre</th>
                                                    <th>Porcentaje</th>
                                                    <th>Total</th>
                                                    <th>Tipo</th>
                                                    <th></th>
                                                  </tr>
                                              </thead>
                                      <tbody>
                                    </tbody>
                                </table>
                              </div>
                  </div>

                  <div class="col col-sm-12 col-md-6">
                        <center> <label> <strong>Todos los conceptos</strong> </label> </center>
                          <div class="table-responsive">
                              <table id="tablaD" class="table table-bordered table-hover"width="100%">
                                            <thead>
                                                <tr>
                                                    <th></th>
                                                    <th>Id</th>
                                                    <th>Nombre</th>
                                                    <th>Porcentaje</th>
                                                    <th>Total</th>
                                                    <th>Tipo</th>
                                                </tr>
                                            </thead>
                                    <tbody>
                                  </tbody>
                              </table>
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
