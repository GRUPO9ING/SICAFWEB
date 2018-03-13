$(document).on("ready", function(){
  listar();



});



function __(id) {
  return document.getElementById(id);
}



  $("#tabla").on("click",".btnEditarPersona", function(){
    d = $(this).parents("tr").find("td");

        $('#Cedula').val(d[1].innerText);
        $('#id').val(d[0].innerText);
        $('#Nombre').val(d[2].innerText);
        $('#ap1').val(d[3].innerText);
        $('#ap2').val(d[4].innerText);
        $('#tel').val(d[5].innerText);
        $('#dir').val(d[6].innerText);
        $('#cor').val(d[7].innerText);
        document.getElementById('nn').innerHTML = "Editar";

});

  function agregarT(datos){
    d = datos.split('--');
    $('#id').val(d[0]);
    $('#Tipo').val(d[1]);
    document.getElementById('nn').innerHTML = "Editar";
  }


  function limpiar(){
    document.getElementById('nn').innerHTML = "Nuevo";
    $('#id').val("");
    $('#Cedula').val("");
    $('#Nombre').val("");
    $('#ap1').val("");
    $('#ap2').val("");
    $('#tel').val("");
    $('#dir').val("");
    $('#cor').val("");
    document.getElementById('nn').innerHTML = "Nuevo";
  }

function limpiarTipo(){
        $('#id').val("");
        $('#Tipo').val("");
        document.getElementById('nn').innerHTML = "Nuevo";
  }

  function limpiarInsumo()
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

  function limpiarLote()
  {
    $('#IdLote').val("");
    $('#Nombre').val("");
    $('#AreaL').val("");
    $('#Produccion').val("");
    $('#Estado option[value='+0+']').attr("selected",true);
    document.getElementById('nn').innerHTML = "Nuevo";
  }


  function agregarLote(datos){
    d = datos.split('--');
    $('#IdLote').val(d[0]);
    $('#Nombre').val(d[1]);
    $('#AreaL').val(d[2]);
    $('#Produccion').val(d[4]);
    $('#Estado option[value='+d[3]+']').attr("selected",true);
    document.getElementById('nn').innerHTML = "Editar";
  }

  function CargarInsumo(datos)
  {
    d = datos.split('--');
    $('#IdInsumo').val(d[0]);
    $('#IdTI option[value='+d[1]+']').attr("selected",true);
    $('#Nombre').val(d[2]);
    $('#Cantidad').val(d[3]);
    $('#FechaComp').val(d[4]);
    $('#PrecioUnit').val(d[6]);
    $('#Detalle').val(d[7]);
    $('#proce').val(d[8]);
    $('#FechaVence').val(d[5]);
    document.getElementById('nn').innerHTML = "Editar";
  }


  $("#tabla").on("click",".btnElinimarPersona", function(){
    d = $(this).parents("tr").find("td");


          swal({
                    title: '¿Esta seguro que desea eliminar a '+d[2]+'?',
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
                              url:"?c=Persona&a=Eliminar",
                              data: {
                             'IdPersona': d[0].innerText},
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



  function eliInsumo(datos)
  {
      d = datos.split('--');swal({
                title: '¿Esta seguro que desea eliminar a '+d[2]+'?',
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
                  swal(
                  'Eliminado!',
                  'Su registro ha sido eliminado',
                  'success'
                )
                location.href="?c=Insumo&a=Eliminar&IdInsumo="+d[0];
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
  }



function eliTipo(datos)
  {

      d = datos.split('--');
      swal({
              title: '¿Esta Usted Seguro?',
              text: "ajsdkjsadkljd",
              type: 'warning',
              showCancelButton: true,
              confirmButtonColor: '#3085d6',
              cancelButtonColor: '#d33',
              confirmButtonText: 'Yes, delete it!',
            }).then(function (){
                    swal(
                      'Deleted!',
                      'Your file has been deleted.',
                      'success'
                      )
                      location.href="?c=TipoInsumo&a=Eliminar&IdTI="+d[0];
              })
  }
  function guardarp()
    {
     var d = __('nn').val
      if (d = 'Editar') {

        swal({
          position: 'top-center',
          type: 'success',
          title: 'Registro editado exitosamente',
          showConfirmButton: false,
          timer: 1000
        })

      }
      else {
        swal({
          position: 'top-center',
          type: 'success',
          title: 'Registrado exitosamente',
          showConfirmButton: false,
          timer: 1000
        })

      }

}


function listar(){

  var table = $("#tabla").DataTable({
       "destroy": true,
       "bDeferRender": true,
        "sPaginationType": "full_numbers",
        "ajax": {
          "url": "?c=Persona&a=Listar",
          "type": "POST"
        },
        "columns": [
          { "data": "IdPersona" , "class": "hidden"},
          { "data": "Cedula" },
          { "data": "Nombre" },
          { "data": "Apellido1" },
          { "data": "Apellido2" },
          { "data": "Telefono"},
          { "data": "Direccion"},
          { "data": "Correo"},
          {"data":null,"defaultContent": "<buttom class='btn btn-warning btnEditarPersona ' data-toggle='modal' data-target='#mGuardar'><span class='fa fa-pencil'></span></buttom> \n\
          <button class='btn btn-danger btnElinimarPersona' id='EPersona'><span class='fa fa-trash'></span></button>" }
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
