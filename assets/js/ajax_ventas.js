$(document).on("ready", function(){
  $("#ff").show();
  $("#rep").hide();
  $("#vt").hide();
  cambio();
  vender();
  Limpiar();
  guardar();
  cboCliente();
  $("#Cedula").keyup(function(){
        if( $('#Cedula').val().length > 6){
          console.log("dasdas");
            $.ajax({
            type: 'POST',
            url:"?c=Colaborador&a=Desplegar",
            data: {'Cedula': $("#Cedula").val()},

            success:function(result)
            {
               var persona = JSON.parse(result);
               console.log(result);

               if(persona.data[0].Nombre == "")
               {

               }else {
                $('#id').val(persona.data[0].IdPersona);
                $('#Nombre').val(persona.data[0].Nombre);
                $('#ap1').val(persona.data[0].Apellido1);
                $('#ap2').val(persona.data[0].Apellido2);
                $('#tel').val(persona.data[0].Telefono);
                $('#dir').val(persona.data[0].Direccion);
                $('#cor').val(persona.data[0].Correo);
              }
            }

          });
        }
      });
});

function cambio(){
  $("#v").on("click",function(){
    $("#ff").show();
    $("#vt").hide();
    $("#rep").hide();

  });

  $("#tdv").on("click",function(){
    $("#ff").hide();
    $("#vt").show();
    $("#rep").hide();

  });

  $("#rpv").on("click",function(){

    $("#ff").hide();
    $("#vt").hide();
    $("#rep").show();

  });

}

function Limpiar(){
  $("#limpia").on("click",function(){
             $("#cbolote").val(0);
             $("#cbocliente").val(0);
             $("#txtMonto").val('');
             $("#txtObser").val('');


   });
}


function cboCliente(){
  $("#cbocliente").prop('selectedIndex', -1);
  $.ajax({
    type:'POST',
    url:'?c=Ventas&a=cboCliente',
    success:function(result){
      var a = JSON.parse(result);
      var i = 0;
      while(Object.keys(a.data).length > i){
        $("#cbocliente").append('<option value="'+a.data[i].IdCliente+'">'+a.data[i].Cedula+' -- '+a.data[i].Cliente+'</option>');
        i++;
      }
    }
  })

}

function guardar(){
  $("#frm-cliente").on("submit", function(e){
         e.preventDefault();
         //Guardamos la referencia al formulario
         var $f = $(this);
         //Comprobamos si el semaforo esta en verde (1)
         if ($f.data('locked') != undefined && !$f.data('locked')){
          //No esta bloqueado aun, bloqueamos, preparamos y enviamos la peticion
                        $.ajax({
                           type: 'POST',
                           url:"?c=Persona&a=Guardar",
                           data: {
                             'IdPersona': $("#id").val(),
                             'Cedula':  $("#Cedula").val(),
                             'Nombre':  $("#Nombre").val(),
                             'Apellido1': $("#ap1").val(),
                             'Apellido2': $("#ap2").val(),
                             'Telefono': $("#tel").val(),
                             'Direccion': $("#dir").val(),
                             'Correo': $("#cor").val()
                           },
                           success:function(result){
                             var rr = $("#id").val();
                             if(rr == ""){
                               rr=0;
                             }

                             $.ajax({
                                type: 'POST',
                                url:"?c=Cliente&a=Guardar",
                                data: {
                                    'id': rr
                                  },success:function(result){
                                    cboCliente();
                                  }
                                });
                                $('#mcliente').modal('hide');
                                if(result == true)
                                {
                                  swal({
                                      type: 'success',
                                      title: 'Operación ejecutada exitosamente',
                                      showConfirmButton: false,
                                      timer: 1500
                                    });
                                }
                                else
                                {
                                  console.log(result)
                                  swal({
                                      type: 'error',
                                      title: 'Error',
                                      showConfirmButton: false,
                                      timer: 1500
                                    });

                                }
                           },
                              beforeSend: function(){
                                  $f.data('locked', true);  // (2)
                              },
                             complete: function(){ $f.data('locked', false);  // (3)
                            }
                        });
                      }
                      else
                      {
                       //Bloqueado!!!
                       //alert("locked");
                      }

  });

}



function vender(){
  $('#btnGuardarVentas').on("click",function(){
    var idLote = $('#cbolote').val();
    var idCliente = $('#cbocliente').val();
    var dt = new Date();
    var month = dt.getMonth()+1;
    var day = dt.getDate();
    var year = dt.getFullYear();
    f1 = year + '-' + month + '-' + day;
    console.log(f1, idLote, idCliente);

    $.ajax({
      type:'POST',
      url:'?c=Ventas&a=vender',
      data:{
        'idl':idLote,
        'idc':idCliente,
        'mon':$('#txtMonto').val(),
        'fecha':f1,
        'ob':$('#txtObser').val()
      },
      success:function(result){
        if(result != null){
          cboCliente();
          swal({
              type: 'success',
              title: 'Operación ejecutada exitosamente',
              showConfirmButton: false,
              timer: 1500
            });

        }
      }
    });

  });
}
