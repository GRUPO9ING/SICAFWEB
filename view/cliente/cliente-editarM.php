

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
              <form id="frm-cliente" action="?c=Persona&a=Guardar" method="post" enctype="multipart/form-data">
                <input type="hidden" id="id" name="IdPersona" value="<?php echo $per->IdPersona; ?>" />

                      <div class="row">
                        <div class="col col-md-12">
                            <div class="form-group">
                              <label class="col col-md-3">Cedula</label>
                              <div class="col col-md-9">
                              <input type="number" class="form-control" id="Cedula"  placeholder="Ingrese el número de cédula" name="Cedula" required>
                              </div>
                            </div>
                          </div>
                        </div>

                        <button type="button" id="d" name="button">desplegar</button>

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
                                  <input type="text" class="form-control" id="ap1" name="Apellido1" placeholder="Ingrese primer apellido"  required>
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
                                    <input type="text" class="form-control" id="ap2" name="Apellido2" placeholder="Ingrese segundo apellido"  required>
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
                                      <input type="text" class="form-control" id="tel" name="Telefono" placeholder="Ingrese número de teléfono"  required>
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
                                       <input type="text" class="form-control" id="dir" name="Direccion" placeholder="Ingrese dirección" required>
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
                                                                 <input type="email" id="cor" class="form-control" name="Correo" placeholder="Ingrese Correo" required>
                                                              </div>
                                                        </div>
                                                    </div>

             </div>
      <div class="modal-footer">
            <button class="btn btn-success">Guardar</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
      </div>
    </form>
    </div>
   </div>
  </div>
</div>

<script type="text/javascript">
  $(function(){
   var form = $('#frm-cliente');
   var ced = $('#Cedula').val();
   var nom = $('#Nombre').val();
   var ap1 = $('#ap1').val();
   var ap2 = $('#ap2').val();
   var tel = $('#tel').val();
   var dir = $('#dir').val();
   var cor = $('#cor').val();
   //('#d').click(function(){
     /*ced+'&nom='+nom+'&ap1='+ap1+'&ap2='+ap2+'&tel='+tel+'&dir='+dir+'&cor='+cor*/
    //  var data = 'ced='+ced;
    //  $.ajax({
    //    url:'cargaModal.php',
    //    type:'POST',
    //    data:data,
    //    success:function(response){
    //         alert(response)
    //    },
    //    error:function(response,status,error){
    //      alert('no ecnontrado')
    //    }
    //  })
   /*alert('adsadds');
   })
*/
$( "#d" ).click(function() {



var data = 'ced='+ced;
 $.ajax({
   url:'model/cliente.php',
   type:'POST',
   data:data,
   success:function(response){
        alert(response)
   },
   error:function(response,status,error){
     alert('no ecnontrado')
   }
 })
 });

  });

</script>
