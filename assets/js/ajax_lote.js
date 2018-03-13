$(document).on("ready", function(){
  listar();

  $("#frm-lote").on("submit", function(e){
         e.preventDefault();
         //Guardamos la referencia al formulario
         var $f = $(this);
         //Comprobamos si el semaforo esta en verde (1)
         if ($f.data('locked') != undefined && !$f.data('locked')){
          //No esta bloqueado aun, bloqueamos, preparamos y enviamos la peticion
                           $.ajax({
                             type: 'POST',
                             url:"?c=Lote&a=Guardar",
                             data: {
                            'IdLote': $('#IdLote').val(),
                            'Nombre': $('#Nombre').val(),
                            'AreaL': $('#AreaL').val(),
                            'Estado': $('#Estado').val(),
                            'Produccion': $('#Produccion').val()
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


function limpiar(){
        $('#IdLote').val('');
        $('#Nombre').val('');
        $('#AreaL').val('');
        $('#Estado').val('');
        $('#Produccion').val('');
            __('nn').innerHTML = "Nuevo";
          }


$("#tablaLote").on("click",".btnEditarLote", function(){
  d = $(this).parents("tr").find("td");

      $('#IdLote').val(d[0].innerText);
      $('#Nombre').val(d[1].innerText);
      $('#AreaL').val(d[2].innerText);
      $('#Estado').val(d[3].innerText);
      $('#Produccion').val(d[4].innerText);
          __('nn').innerHTML = "Editar";
});


  $("#tablaLote").on("click",".btnElinimarLote", function(){
    d = $(this).parents("tr").find("td");


          swal({
                    title: '¿Esta seguro que desea eliminar a '+d[1].innerText+'?',
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

                    //location.href="?c=Persona&a=Eliminar&IdPersona="+d[0];
                    $.ajax({
                              type: 'POST',
                              url:"?c=Lote&a=Eliminar",
                              data: {
                             'IdLote': d[0].innerText},
                              success: function(result){

                                if(result == true){
                                  swal(
                                  'Eliminado!',
                                  'Su registro ha sido eliminado',
                                  'success'
                                );
                                }

                              listar();
                        }});


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

  var table = $("#tablaLote").DataTable({
       "scrollY":"300px",
       "responsive" : true,
       "destroy": true,
       "bDeferRender": true,
        "sPaginationType": "full_numbers",
        "ajax": {
          "url": "?c=Lote&a=Listar",
          "type": "POST"
               },
        "columns": [
          { "data": "IdLote" , "class": "hidden"},
          { "data": "Nombre" },
          { "data": "AreaL" },
          { "data": "Estado"},
          { "data": "Produccion"},
          {"data":null,"defaultContent": "<buttom class='btn btn-warning btnEditarLote ' data-toggle='modal' data-target='#mGuardar'><span class='fa fa-pencil'></span></buttom> \n\
          <button class='btn btn-danger btnElinimarLote' id='EPersona'><span class='fa fa-trash'></span></button>" }
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
