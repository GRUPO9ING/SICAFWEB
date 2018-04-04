$(document).on("ready", function(){
       listar();
       guardarTipo();
       editarTipo();
       eliminarTipo();
       /**/
       /**/
});
/**/

/**/
function __(id) {
  return document.getElementById(id);
}



function guardarTipo(){

    $("#Enviar").on('click',function(){

      validator = $("#frm-tipocol").validate();
      $.validator.addMethod("todos", function (value, element) {
      return this.optional(element) || /^[0-9@a-zA-ZáéíóúàèìòùÀÈÌÒÙÁÉÍÓÚñÑüÜ_.,\s]+$/.test(value);
      }, "No se permiten caracteres especiales o numeros");




        validatortipocol = $("#frm-tipocol").validate();
        validatortipocol.destroy();
        validatortipocol = $("#frm-tipocol").validate({
        event: "blur",
        errorElement: "span",
        rules: {
          Detalle :{required:true, todos:true, rangelength:[2,100]},
          tipo: {required:true, todos:true, rangelength:[2,15]}
        },
        messages: {
          Detalle: {required: 'Este datos es requerido', todos:'No se aceptan caracteres especiales', rangelength:'Máximo {1} caracteres'},
          tipo: {required:'Este dato es requerido', todos:'No se aceptan caracteres especiales', rangelength:'Máximo {1} caracteres'}
        },
        submitHandler: function (form)
        {

          $.ajax({
             type: 'POST',
             url:"?c=colaborador&a=IngresarTipo",
             data: {
               'id': $('#id').val(),
               'tipo':  $("#tipo").val(),
               'detalle':  $("#Detalle").val()
             },
             success:function(result){
               $('#mTipo').modal('hide');
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
               complete: function(){
                 $('.mensajes').html('');
              }
          });

        }
      })
    });
}


function editarTipo(){

  $("#tablaTipoCol").on("click",".btnEditarTipo", function(){
    d = $(this).parents("tr").find("td");
        $('#id').val(d[0].innerText);
        $('#tipo').val(d[1].innerText);
        $('#Detalle').val(d[2].innerText);
  });

}


function eliminarTipo(){
  $("#tablaTipoCol").on("click",".btnElinimarTipo", function(){
    d = $(this).parents("tr").find("td");


          swal({
                    title: '¿Esta seguro que desea eliminar este tipo?',
                    text: "No se puede revertir!",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Si, Eliminar!',
                    cancelButtonText: 'No, Cancelar!',
                    confirmButtonClass: 'btn btn-success',
                    cancelButtonClass: 'btn btn-danger',
                    buttonsStyling: false
                  }).then(function () {

                    $.ajax({
                              type: 'POST',
                              url:"?c=colaborador&a=EliminaTipo",
                              data: {
                             'id': d[0].innerText},
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

}

function listar(){

  var table = $("#tablaTipoCol").DataTable({
       "order": [[0, "desc" ]],
       "scrollY":"300px",
       "destroy": true,
       "responsive":true,
       "bDeferRender": true,
        "sPaginationType": "full_numbers",
        "ajax": {
          "type": "POST",
          "url": "?c=Colaborador&a=ListarTipo"
              },
        "columns": [
          { "data": "IdTipoColaborador" , "class": "hidden"},
          { "data": "Tipo"},
          { "data": "Detalle"},
          {"data":null,"defaultContent": "<button class='btn btn-warning btnEditarTipo' data-toggle='modal' data-target='#mTipo'><span class='fa fa-pencil'></span></button><button class='btn btn-danger'><Tipo class='fa fa-trash fa-lg  btnElinimarTipo'></span></button>" }
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
