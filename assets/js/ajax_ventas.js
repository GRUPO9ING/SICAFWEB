$(document).on("ready", function(){
  $("#ff").show();
  $("#rep").hide();
  $("#vt").hide();
  cambio();
  vender();
  Limpiar();
  guardar();
  consl();
  listar();
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
             $('.selectpicker').selectpicker('val', '');
             $("#txtMonto").val('');
             $("#txtObser").val('');


   });
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


function limpia(){
$('.selectpicker').selectpicker('val', '');
$('#txtMonto').val('');
$('#txtObser').val('');
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
          limpia();
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


function consl(){
  $("#btnConsultar").on("click",function(){
    listar();
  });
}





function listar(){

  var f1 = $("#FI").val();
  var f2 = $("#FF").val();
  var dt = new Date();

  if(f1 == ""){
    var month = dt.getMonth()+1;
    var day = dt.getDate();
    var year = dt.getFullYear();
    f1 = year + '-' + month + '-' + day;
  }

  if(f2 == ""){
    var month = dt.getMonth()+1;
    var day = dt.getDate();
    var year = dt.getFullYear();
    f2 = year + '-' + month + '-' + day;
  }


  var table = $("#tablaVentas").DataTable({
        "order": [[0, "desc" ]],
        "scrollY":"200px",
        "bPaginate": false,
        "destroy": true,
        "bDeferRender": true,
        "sPaginationType": "full_numbers",
        "ajax": {
          "url": "?c=Ventas&a=ListarCompras",
          "type": "POST",
          "data":{
            'FI':f1,
            'FF':f2
          }
        },
        "columns": [
          { "data": "IdFac"},
          { "data": "Cliente" },
          { "data": "FechaCompra" },
          { "data": "Monto"},
          { "data": "Lote"},
          { "data": "IdCliente","class":"hidden"},
          { "data": "Observacion","class":"hidden"},
          { "data": "IdCliente","class":"hidden"},
          { "data": "IdLote","class":"hidden"},
          {"data":null,"defaultContent": "<button class='btn btn-info btnSeleccionar'><span class='fa fa-check'></span>Seleccionar</button>"}
          ],

 "language": idioma_espanol
  });


}


    var idioma_espanol = {

      "sProcessing":     "Procesando...",
      "sLengthMenu":     "Mostrar _MENU_ registros",
      "sZeroRecords":    "No se encontraron resultados",
      "sEmptyTable":     "Ningún dato disponible en esta tabla",
      "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
      "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
      "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
      "sInfoPostFix":    "",
      "sSearch":         "Buscar:",
      "sUrl":            "",
      "sInfoThousands":  ",",
      "sLoadingRecords": "Cargando...",
      "oPaginate": {
          "sFirst":    "Primero",
          "sLast":     "Último",
          "sNext":     "Siguiente",
          "sPrevious": "Anterior"
      },
      "oAria": {
          "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
          "sSortDescending": ": Activar para ordenar la columna de manera descendente"
    }
}
