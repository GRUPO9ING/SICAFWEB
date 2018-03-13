$( document ).ready(function() {
listar();
Eliminar();
Editar();
Guardar();
var dt = new Date();
// Display the month, day, and year. getMonth() returns a 0-based number.
$("#tot").keyup(
  function(){
  var imp = $("#imp").val().replace(/\,/g,'');
  var tot = $("#tot").val().replace(/\,/g,'');
  console.log()
  var por = $("#por").val();
  if($("#imp").length > 0){

    if($("#por").length > 0){
      var pc = (parseFloat(por)/100);
      var gra = ((parseFloat(imp)) / (parseFloat(pc)));
      var ex = ((parseFloat(tot) - parseFloat(gra)) - parseFloat(imp));
      $('#ex').val(ex.toFixed(2));
      $('#gr').val(gra.toFixed(2));
      }
     }
});


/*********************************************************************************************/
$("#imp").keyup(
  function(){
  var imp = $("#imp").val().replace(/\,/g,'');
  var tot = $("#tot").val().replace(/\,/g,'');
  console.log()
  var por = $("#por").val();
  if($("#tot").length > 0){

    if($("#por").length > 0){

      var pc = (parseFloat(por)/100);
      var gra = ((parseFloat(imp)) / (parseFloat(pc)));
      var ex = ((parseFloat(tot) - parseFloat(gra)) - parseFloat(imp));
      $('#ex').val(ex.toFixed(2));
      $('#gr').val(gra.toFixed(2));

      }

     }
});
/**************************************************************************************************/
$("#por").keyup(
  function(){
  var imp = $("#imp").val().replace(/\,/g,'');
  var tot = $("#tot").val().replace(/\,/g,'');
  console.log()
  var por = $("#por").val();
  if($("#tot").length > 0){
    if($("#imp").length > 0){
      var pc = (parseFloat(por)/100);
      var gra = (parseFloat(imp) / parseFloat(pc));
      var ex = ((parseFloat(tot) - parseFloat(gra)) - parseFloat(imp));
      $('#ex').val(ex.toFixed(2));
      $('#gr').val(gra.toFixed(2));
      }
     }
});
/****************************************************************************************************/

});


function Guardar(){

  $("#frm-fac").on("submit", function(e){

            var tot = $('#tot').val().replace(/\,/g,'');
            var imp = $('#imp').val().replace(/\,/g,'');
            var ex = $('#ex').val().replace(/\,/g,'');
            var gr = $('#gr').val().replace(/\,/g,'');
            console.log(tot);
         e.preventDefault();

         //Guardamos la referencia al formulario
         var $f = $(this);
         //Comprobamos si el semaforo esta en verde (1)
         if ($f.data('locked') != undefined && !$f.data('locked')){
          //No esta bloqueado aun, bloqueamos, preparamos y enviamos la peticion

          if( $('#idProv').val() != 0 )
          {

                           $.ajax({
                             type: 'POST',
                             url:"?c=fact&a=Guardar",
                             data: {
                            'IdFac': $('#IdFac').val(),
                            'NumeroFac': $('#numfac').val(),
                            'IdProveedor': $('#idProv').val(),
                            'Monto': tot,
                            'IV': imp,
                            'Exento': ex,
                            'Gravado': gr,
                            'Fecha': $('#FechaFact').val(),
                            'Porcentaje': $('#por').val()
                               },
                              beforeSend: function(){
                                  $f.data('locked', true);  // (2)
                              },
                              success: function(result){

                                var rr = JSON.parse(result);

                                if( rr.data[0].msg == 'G')
                                {
                                           swal({
                                               type: 'success',
                                               title: 'Operación ejecutada exitosamente',
                                               showConfirmButton: false,
                                               timer: 1500
                                             });
                                         $('#mProveedor').modal('hide');
                                         listar();


                                 }
                                else
                                {
                                  swal({
                                      type: 'error',
                                      title: 'La Numero de factura ya existe con este mismo proveedor',
                                      showConfirmButton: false,
                                      timer: 1500
                                    });

                                }
                             },
                             complete: function(){ $f.data('locked', false);  // (3)
                            }
                        });

                          }else {
                            swal({
                                type: 'error',
                                title: 'Debe seleccionar un proveedor',
                                showConfirmButton: false,
                                timer: 1500
                              });
                          }

                      }
                      else
                      {
                       //Bloqueado!!!
                       //alert("locked");
                      }


  });
}

function Editar(){

  $("#tablaFacts").on("click",".btneditar", function(){
  d = $(this).parents("tr").find("td");
    $('#IdFac').val(d[0].innerText);
    $('#numfac').val(d[3].innerText);
    $('#idProv').val(d[1].innerText);
    $('#tot').val(d[5].innerText);
    $('#imp').val(d[6].innerText);
    $('#ex').val(d[7].innerText);
    $('#gr').val(d[8].innerText);
    $('#FechaFact').val(d[4].innerText);
    $('#por').val(d[9].innerText);
});

}



function verificar(Num,Prov){

  $.ajax({
    type:'POST',
    url:'?c=fact&a=verificar',
    data:{
      'NumFac':Num,
      'IdProv':Prov
    },
    success:function(result){
          var dia = JSON.parse(result);

          if ( dia.data[0].MSG1 == 'Existe' )
          {
             return 'Hay';
          }else
           {
             return 'No';
          }
    }
  });

}


function limpiar(){
  $('#IdFac').val('');
  $('#numfac').val('');
  $('#idProv').val('');
  $('#tot').val('');
  $('#imp').val('');
  $('#ex').val('');
  $('#gr').val('');
  $('#FechaFact').val('');
  $('#por').val('');
}

function Eliminar(){

  $("#tablaFacts").on("click",".btnElinimar", function(){
    d = $(this).parents("tr").find("td");
          swal({
                    title: '¿Esta seguro que desea eliminar la factura N° '+d[3].innerText+'?',
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
                              url:"?c=fact&a=Eliminar",
                              data: {
                             'IdFac': d[0].innerText},
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

}

$("#btnConsultar").on("click",function(){
  listar();
});


function listar(){
          var f1 = $("#FI").val();
          var f2 = $("#FF").val();
          var dt = new Date();
          if(f1 == ""){
            var month = dt.getMonth()+1;
            var day = dt.getDate();
            var year = dt.getFullYear();
            f1 = year + '-' + month + '-' + day;
            console.log(f1);
          }
          if(f2 == ""){
            var month = dt.getMonth()+1;
            var day = dt.getDate();
            var year = dt.getFullYear();
            f2 = year + '-' + month + '-' + day;
          }
  var table = $("#tablaFacts").DataTable({
       "scrollY":"300px",
       "destroy": true,
       "responsive":true,
       "bDeferRender": true,
        "sPaginationType": "full_numbers",
        "ajax": {
          "url": "?c=Fact&a=Listar",
          "type": "POST",
          "data": {
            "FI":f1,
            "FF":f2
          }
        },
        "columns": [
          { "data": "IdFac" , "class": "hidden"},
          { "data": "IdProveedor" , "class": "hidden"},
          { "data": "Nombre"},
          { "data": "NumeroFac"},
          { "data": "Fecha"},
          { "data": "Monto"},
          { "data": "IV" },
          { "data": "Exento" },
          { "data": "Gravado"},
          { "data": "Porcentaje" , "class": "hidden"},
          {"data":null,"defaultContent": "<buttom class='btn btn-warning btneditar' data-toggle='modal' data-target='#mProveedor'><span class='fa fa-pencil'></span></buttom>\
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
