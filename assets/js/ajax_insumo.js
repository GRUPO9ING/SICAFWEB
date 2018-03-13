
$(document).on("ready", function(){
  listar();


    $("#frm-insumo").on("submit", function(e){
           e.preventDefault();
           //Guardamos la referencia al formulario
           var $f = $(this);
           //Comprobamos si el semaforo esta en verde (1)
           if ($f.data('locked') != undefined && !$f.data('locked')){
            //No esta bloqueado aun, bloqueamos, preparamos y enviamos la peticion
                             $.ajax({
                               type: 'POST',
                               url:"?c=Insumo&a=Guardar",
                               data: {
                                'IdInsumo': $('#IdInsumo').val(),
                                'IdTI': $('#IdTI').val(),
                                'Nombre': $('#Nombre').val(),
                                'Cantidad': $('#Cantidad').val(),
                                'FechaComp' : $('#FechaComp').val(),
                                'PrecioUnit' : $('#PrecioUnit').val(),
                                'Detalle' : $('#Detalle').val(),
                                'Procedencia' : $('#proce').val(),
                                'FechaVence': $('#FechaVence').val()
                                },
                                beforeSend: function(){
                                    $f.data('locked', true);  // (2)
                                },
                                success: function(result){
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
                                    swal({
                                        type: 'error',
                                        title: 'Error',
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

function __(id) {
  return document.getElementById(id);
}


  function limpiar()
  {
    $('#IdInsumo').val("");
    $('#Nombre').val("");
    $('#Cantidad').val("");
    $('#FechaComp').val("");
    $('#PrecioUnit').val("");
    $('#Detalle').val("");
    $('#proce').val("");
    $('#FechaVence').val("");
    document.getElementById('nn').innerHTML = "Nuevo";
  }


  $("#tablaInsumo").on("click",".btnAgregarInventario", function(){
    d = $(this).parents("tr").find("td");

    $('#Inve').modal('show');
    $("#titulo").text(d[3].innerText);
  });





$("#tablaInsumo").on("click",".btnEditarInsumo", function(){
  d = $(this).parents("tr").find("td");
    $('#IdInsumo').val(d[0].innerText);
    $('#IdTI').val(d[1].innerText);
    $('#Nombre').val(d[3].innerText);
    $('#Cantidad').val(d[4].innerText);
    $('#FechaComp').val(d[5].innerText);
    $('#FechaVence').val(d[6].innerText);
    $('#PrecioUnit').val(d[7].innerText);
    $('#proce').val(d[8].innerText);
    $('#Detalle').val(d[9].innerText);
      __('nn').innerHTML = "Editar";

});


  $("#tablaInsumo").on("click",".btnElinimarInsumo", function(){
    d = $(this).parents("tr").find("td");


          swal({
                    title: '¿Esta seguro que desea eliminar a '+d[3].innerText+'?',
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
                              url:"?c=Insumo&a=Eliminar",
                              data: {
                             'IdInsumo': d[0].innerText},
                              success: function(result){

                                if(result == true){
                                  swal(
                                  'Eliminado!',
                                  'Su registro ha sido eliminado',
                                  'success'
                                );
                                }

                              listar();
                        },
                        error: function(){
                          swal(
                          'Ooops!',
                          'Su registro no puede ser eliminado',
                          'danger'
                        )
                        }
                      });


                  }, function (dismiss) {
                    // dismiss can be 'cancel', 'overlay',
                    // 'close', and 'timer'
                    if (dismiss === 'cancel') {
                      swal(
                        'Cancelado',
                        'Su registro esta salvo ☺',
                        'error'
                      )
                    }
                  })


});


function listar(){

  var table = $("#tablaInsumo").DataTable({
       "scrollY":"300px",
       "destroy": true,
       "bDeferRender": true,
        "sPaginationType": "full_numbers",
        "ajax": {
          "url": "?c=Insumo&a=Listar",
          "type": "POST"
        },
        "columns": [
          { "data": "IdInsumo" , "class": "hidden"},
          { "data": "IdTI","class":"hidden" },
          { "data": "Tipo","class":"hidden" },
          { "data": "Nombre" },
          { "data": "Cantidad" },
          { "data": "FechaComp" },
          { "data": "FechaVence"},
          { "data": "PrecioUnit"},
          { "data": "Procedencia"},
          { "data": "Detalle","class":"hidden"},
          {"data":null,"defaultContent": "<button class='btn btn-warning btnEditarInsumo ' data-toggle='modal' data-target='#mGuardar'><span class='fa fa-pencil'></span></button> <button class='btn btn-danger btnElinimarInsumo'><span class='fa fa-trash'></span></button> <button class='btn btn-success btnAgregarInventario'><span class='fa fa-plus-square aa'></span></button>" }
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
