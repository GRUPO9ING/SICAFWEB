$(document).on("ready", function(){
  listar();
  /*  */
    $("#frm-tipoInsumo").on("submit", function(e){
           e.preventDefault();
           //Guardamos la referencia al formulario
           var $f = $(this);
           //Comprobamos si el semaforo esta en verde (1)
           if ($f.data('locked') != undefined && !$f.data('locked')){
            //No esta bloqueado aun, bloqueamos, preparamos y enviamos la peticion
                             $.ajax({
                                type: 'POST',
                                url:"?c=TipoInsumo&a=Guardar",
                                data: {
                                    'IdTI': $("#id").val(),
                                    'Nombre':  $("#Tipo").val(),
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
                                        timer: 1000
                                      });

                                   listar();
                                  }
                                  else
                                  {
                                    swal({
                                        type: 'error',
                                        title: 'Error',
                                        showConfirmButton: false,
                                        timer: 1000
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
/**/
});

function __(id) {
  return document.getElementById(id);
}


function limpiar(){
  $('#id').val("");
  $('#Tipo').val("");
  __('nn').innerHTML = "Nuevo";
}

$("#tabla").on("click",".btnTipo", function(){
  d = $(this).parents("tr").find("td");
      $('#id').val(d[0].innerText);
      $('#Tipo').val(d[1].innerText);
      __('nn').innerHTML = "Editar";

});

  $("#tabla").on("click",".btnElinimar", function(){
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

                    $.ajax({
                              type: 'POST',
                              url:"?c=TipoInsumo&a=Eliminar",
                              data: {
                             'IdTI': d[0].innerText},
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
                          timer: 1500
                        });

                    }
                  })


});


function listar(){

  var table = $("#tabla").DataTable({
    "scrollY":"300px",
       "destroy": true,
       "responsive":true,
       "bDeferRender": true,
        "sPaginationType": "full_numbers",
        "ajax": {
          "url": "?c=tipoInsumo&a=Listar",
          "type": "POST"
        },
        "columns": [
          { "data": "IdTI" , "class": "hidden"},
          { "data": "Tipo" },
          {"data":null,"defaultContent": "<buttom class='btn btn-warning btnTipo' data-toggle='modal' data-target='#mGuardar'><span class='fa fa-pencil'></span></buttom>\
          <button class='btn btn-danger btnElinimar'><span class='fa fa-trash'></span></button>" }
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
