$(document).on("ready", function(){
       listar();
       GuardarSiguiente();
       listarHE();
       ColLote();
       /**/
       $("#frm-colaborador").on("submit", function(e){
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
                                  'IdPersona': $("#idP").val(),
                                  'Cedula':  $("#Cedula").val(),
                                  'Nombre':  $("#Nombre").val(),
                                  'Apellido1': $("#ap1").val(),
                                  'Apellido2': $("#ap2").val(),
                                  'Telefono': $("#tel").val(),
                                  'Direccion': $("#dir").val(),
                                  'Correo': $("#cor").val()
                                },
                                success:function(result){
                                  console.log($("#IdCol").val());
                                  $.ajax({
                                     type: 'POST',
                                     url:"?c=Colaborador&a=Guardar",
                                     data: {
                                         'IdColaborador': $("#IdCol").val(),
                                         'IdPersona': $("#id").val(),
                                         'IdTipoColaborador':  $("#IdTC").val(),
                                         'FechaIngreso': $("#FechaIngreso").val(),
                                         'FechaBaja': "",
                                         'Horas':$('#horas').val(),
                                         'SalarioBase':$('#sal').val(),
                                         'SalarioBruto': __('salB').innerHTML
                                       }

                                     });
                                     $('#mGuardar').modal('hide');
                                     if(result == true)
                                     {
                                       swal({
                                           type: 'success',
                                           title: 'Operación ejecutada exitosamente',
                                           showConfirmButton: false,
                                           timer: 1500
                                         });

                                      listar();
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
/**/
$("#frm-horas").on("submit", function(e){
       e.preventDefault();
       //Guardamos la referencia al formulario
       var $f = $(this);
       //Comprobamos si el semaforo esta en verde (1)
       if ($f.data('locked') != undefined && !$f.data('locked')){
        //No esta bloqueado aun, bloqueamos, preparamos y enviamos la peticion

                         $.ajax({
                            type: 'POST',
                            url:"?c=Colaborador&a=NuevaHE",
                            data: {
                                'id': $("#idHe").val(),
                                'cant': $("#cHoas").val(),
                                'idCol': $("#IdTC").val(),
                                'fecha':  $("#FF").val()
                                },
                            beforeSend: function(){
                                $f.data('locked', true);  // (2)
                            },
                            success: function(result)
                            {
                              $('#mHoras').modal('hide');
                              if(result == true)
                              {
                                swal({
                                    type: 'success',
                                    title: 'Operación ejecutada exitosamente',
                                    showConfirmButton: false,
                                    timer: 1500
                                  });

                               listarHE();
                              }
                              else
                              {
                                console.log(result)
                                swal({
                                    type: 'error',
                                    title: 'No se encontro nomina en el rango de fecha',
                                    showConfirmButton: false,
                                    timer: 1500
                                  });

                              }
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

});
/**/

/**/
function __(id) {
  return document.getElementById(id);
}


function limpiar(){
  $('#id').val("");
  $('#Cedula').val("");
  $('#Nombre').val("");
  $('#ap1').val("");
  $('#ap2').val("");
  $('#tel').val("");
  $('#dir').val("");
  $('#cor').val("");
  __('nn').innerHTML = "Nuevo";
}



$("#tablahoras").on("click",".btnAplicar", function(){
  d = $(this).parents("tr").find("td");
  var valida = d[5].innerText;
   if(valida == "Pendiente"){
  $.ajax({
    type:'POST',
    url:'?c=Colaborador&a=AplicarHE',
    data:{"idP":d[2].innerText,
          "fecha":d[4].innerText,
          "idCol":d[0].innerText},
          success:function(result){
            if(result = true){
                  swal({
                    type: 'success',
                    title: 'Operación ejecutada exitosamente',
                    showConfirmButton: false,
                    timer: 1200
                  });
              }
              else {

                swal({
                  type: 'error',
                  title: 'No existe nomina en ese rango de fecha',
                  showConfirmButton: false,
                  timer: 1200
                });
            }
            listarHE();
        }
  });
  }
  else {

    swal({
      type: 'info',
      title: 'Ya ha sido aplicada la solicitud',
      showConfirmButton: false,
      timer: 1200
    });

  }
});


$("#tablahoras").on("click",".btnEditarSoli", function(){
  d = $(this).parents("tr").find("td");
  var a = d[5].innerText;
  if(a == "Pendiente")
  {
  $('#mHoras').modal('show');
  $("#idHe").val(d[2].innerText);
  $("#IdTC").val(d[0].innerText);
  $("#FF").val(d[4].innerText);
  $("#cHoas").val(d[3].innerText);
}else {
  swal({
      type: 'error',
      title: 'La solicitud ya fue aprobada, imposible editar',
      showConfirmButton: false,
      timer: 1000
    });
}
});

$("#tablaCol").on("click",".btnEditarColaborador", function(){
  d = $(this).parents("tr").find("td");

      $('#IdCol').val(d[0].innerText);
      $('#IdTC').val(d[1].innerText);
      $('#id').val(d[2].innerText);
      $('#idP').val(d[2].innerText);
      $('#Cedula').val(d[3].innerText);
      $('#Nombre').val(d[4].innerText);
      $('#ap1').val(d[5].innerText);
      $('#ap2').val(d[6].innerText);
      $('#tel').val(d[7].innerText);
      $('#dir').val(d[9].innerText);
      $('#cor').val(d[8].innerText);
      $('#FechaIngreso').val(d[11].innerText);
      $('#sal').val(d[12].innerText);
      $('#horas').val(d[14].innerText);

      var sal = d[12].innerText;
      var ho = d[14].innerText;
      var to = sal*ho;
      __('salB').innerHTML = to;
      __('nn').innerHTML = "Editar";

});


$("#sal").keyup(function(){
     var sal = $("#sal").val();
     var ho = $("#horas").val();
     var to = sal*ho;
     __('salB').innerHTML = to;
});

$("#horas").keyup(function(){
    var sal = parseFloat($("#sal").val());
    var ho = parseFloat($("#horas").val());
    var to = sal*ho;
    __('salB').innerHTML = to;

});

function GuardarSiguiente()
{
                    $("#Enviar").on("click",function(e){
                    if($("#id").val() == 0){
                      $.ajax({
                        type: 'POST',
                        url: "?c=Colaborador&a=Maximo",
                        success:function(result){
                          var ss = JSON.parse(result);
                          $("#id").val(ss.data[0].id);
                        }
                      })
                    }
                  });
  }

$("#Cedula").keyup(function(){
  if( $('#Cedula').val().length > 6){
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
          $('#idP').val(persona.data[0].IdPersona);
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

$("#tablaCol").on("click",".btnCam", function(){
  d = $(this).parents("tr").find("td");
  $('#loteCol').modal('show');
  $('#Nomb').text(d[4].innerText+' '+d[5].innerText);
  $('#idCol').val(d[0].innerText);
  $.ajax({
    type:'POST',
    url:'?c=Colaborador&a=CBOA',
    data:{
      'id':$('#idCol').val()
    },
    success:function(result){
      var as = JSON.parse(result);

      if(as.data.length > 0){
        $('.selectpicker').selectpicker('val', as.data[0].IdLote);
      }
      else {
        $('.selectpicker').selectpicker('deselect');
      }

    }
  });
});


  $("#tablaCol").on("click",".btnElinimarColaborador", function(){
    d = $(this).parents("tr").find("td");


          swal({
                    title: '¿Esta seguro que desea eliminar a '+d[4].innerText+'?',
                    text: "No se puede revertir!",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Si, Vuelelo!',
                    cancelButtonText: 'No, Cancelar!',
                    confirmButtonClass: 'btn btn-success',
                    cancelButtonClass: 'btn btn-danger',
                    buttonsStyling: false
                  }).then(function () {

                    $.ajax({
                              type: 'POST',
                              url:"?c=Colaborador&a=Eliminar",
                              data: {
                             'IdColaborador': d[0].innerText},
                              success: function(result){

                                if(result == true){
                                  swal({
                                      type: 'success',
                                      title: 'Eliminado exitosamente',
                                      showConfirmButton: false,
                                      timer: 1000
                                    });

                                }

                              listar();
                        }});


                  }, function (dismiss) {
                    // dismiss can be 'cancel', 'overlay',
                    // 'close', and 'timer'
                    if (dismiss === 'cancel') {
                      swal({
                          type: 'error',
                          title: 'Operacion Cancelada',
                          text : 'Su registro esta a salvo ☺',
                          showConfirmButton: false,
                          timer: 700
                        });

                    }
                  })


});

function ColLote(){

  $("#Asignar").on("submit", function(e){
         e.preventDefault();
         //Guardamos la referencia al formulario
         var $f = $(this);
         //Comprobamos si el semaforo esta en verde (1)
         if ($f.data('locked') != undefined && !$f.data('locked')){
          //No esta bloqueado aun, bloqueamos, preparamos y enviamos la peticion

                           $.ajax({
                              type: 'POST',
                              url:"?c=Colaborador&a=AsignarColALote",
                              data: {
                                  'IdLote': $("#cboLot").val(),
                                  'IdCol': $("#idCol").val()
                                  },
                              beforeSend: function(){
                                  $f.data('locked', true);  // (2)
                              },
                              success: function(result)
                              {
                                $('#loteCol').modal('hide');
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
                                      title: 'No se encontro nomina en el rango de fecha',
                                      showConfirmButton: false,
                                      timer: 1500
                                    });

                                }
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


function listar(){

  var table = $("#tablaCol").DataTable({
       "order": [[0, "desc" ]],
       "scrollY":"300px",
       "destroy": true,
       "responsive":true,
       "bDeferRender": true,
        "sPaginationType": "full_numbers",
        "ajax": {
          "type": "POST",
          "url": "?c=Colaborador&a=Listar"
              },
        "columns": [
          { "data": "IdColaborador" , "class": "hidden"},
          { "data": "IdTipoColaborador" , "class": "hidden"},
          { "data": "IdPersona" , "class": "hidden"},
          { "data": "Cedula" },
          { "data": "Nombre" },
          { "data": "Apellido1" },
          { "data": "Apellido2","class":"hidden"},
          { "data": "Telefono","class":"hidden"},
          { "data": "Correo","class":"hidden"},
          { "data": "Direccion","class":"hidden"},
          { "data": "FechaBaja","class":"hidden"},
          { "data": "FechaIngreso"},
          { "data": "SalarioBase"},
          { "data": "SalarioBruto"},
          { "data": "Horas"},
          { "data": "Tipo","class":"hidden"},
          {"data":null,"defaultContent": "<buttom class='btn btn-warning btnEditarColaborador' data-toggle='modal' data-target='#mGuardar'><span class='fa fa-pencil'></span></buttom>|<button class='btn btn-danger'><span class='fa fa-trash fa-lg  btnElinimarColaborador'></span></button>" }
          ],

 "language": idioma_espanol,
 dom: "<'row'<'form-inline' <'col-sm-offset-5'B>>>"
     +"<'row' <'form-inline' <'col-sm-1'f>>>"
     +"<rt>"
     +" <'row'<'form-inline'"
     +" <'col-sm-6 col-md-6 col-lg-6'l>"
     +"<'col-sm-6 col-md-6 col-lg-6'p>>>",

"buttons":[

          {
              extend:    'excelHtml5',
              text:      '<i class="fa fa-file-excel-o"></i>',
              className: 'btn btn-success',
              titleAttr: 'Excel'
          },

          {
              extend:    'pdfHtml5',
              text:      '<i class="fa fa-file-pdf-o"></i>',
              className: 'btn btn-danger',
              titleAttr: 'PDF'
          },

          {
              extend: 'print',
              text:   '<i class="fa fa-print"></i>',
              className: 'btn btn-info',
              autoPrint: true,
              titleAttr: 'Imprimir',
              exportOptions: {
              modifier: {
              page: 'current'
                        }
                              }
         }
          ]


  });
}


  function listarHE(){

    var table = $("#tablahoras").DataTable({
      "order": [[2, "desc" ]],
         "scrollY":"300px",
         "destroy": true,
         "responsive":true,
         "bDeferRender": true,
          "sPaginationType": "full_numbers",
          "ajax": {
            "type": "POST",
            "url": "?c=Colaborador&a=ListarHE"
                },
          "columns": [
            { "data": "IdColaborador","class":"hidden"},
            { "data": "Colaborador"},
            { "data": "IdHoras" },
            { "data": "Cantidad" },
            { "data": "Fecha" },
            { "data": "Estado" },
            {"data":null,"defaultContent": "<buttom class='btn btn-warning btnEditarSoli' title='Editar Solicitud'><span class='fa fa-pencil' id='edit'></span></buttom>|<button class='btn btn-danger' title='Cancelar Solicitud' id='Cancel'><span class='fa fa-times fa-lg  btnElinimarSoli'></span></button>|<buttom title='Aplicar' class='btn btn-info btnAplicar' id='Aplicar' ><span class='fa fa-check'></span></buttom>" }
            ],

   "language": idioma_espanol,
   dom: "<'row'<'form-inline' <'col-sm-offset-5'B>>>"
       +"<'row' <'form-inline' <'col-sm-1'f>>>"
       +"<rt>"
       +" <'row'<'form-inline'"
       +" <'col-sm-6 col-md-6 col-lg-6'l>"
       +"<'col-sm-6 col-md-6 col-lg-6'p>>>",

  "buttons":[

            {
                extend:    'excelHtml5',
                text:      '<i class="fa fa-file-excel-o"></i>',
                className: 'btn btn-success',
                titleAttr: 'Excel'
            },

            {
                extend:    'pdfHtml5',
                text:      '<i class="fa fa-file-pdf-o"></i>',
                className: 'btn btn-danger',
                titleAttr: 'PDF'
            },

            {
                extend: 'print',
                text:   '<i class="fa fa-print"></i>',
                className: 'btn btn-info',
                autoPrint: true,
                titleAttr: 'Imprimir',
                exportOptions: {
                modifier: {
                page: 'current'
                          }
                                }
           }
            ]


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
