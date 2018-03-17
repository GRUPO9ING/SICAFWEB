$(document).on("ready", function(){
  /*--------------------------------*/
  $("#fec").hide();
  $("#ss").hide();

  /*-------------------------------*/
  fecha();
  reporte();
  cancelar();
  aprobar();
  consl();
  listar();
  Planilla();
  $("#frm-Nomina").on("submit", function(e){
         e.preventDefault();
         //Guardamos la referencia al formulario
         var $f = $(this);
         //Comprobamos si el semaforo esta en verde (1)
         if ($f.data('locked') != undefined && !$f.data('locked')){
          //No esta bloqueado aun, bloqueamos, preparamos y enviamos la peticion

                           $.ajax({
                              type: 'POST',
                              url:"?c=Nomina&a=Generar",
                              data: {
                                  'FechaInicio': $("#FI").val(),
                                  'FechaFin': $("#FF").val(),
                                  },
                              beforeSend: function(){
                                  $f.data('locked', true);  // (2)
                              },
                              success: function(result)
                              {
                                $('#modalNomina').modal('hide');
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


function reporte(){
  $("#btnConsultarB").on("click",function(){
    $('#Lotes').empty();
    $('#Balance').empty();
    $('#Gastos').empty();
    $('#Ventas').empty();


    var idLote = $('#IdLL').val();

    if(idLote == ''){
      swal({
          type: 'error',
          title: 'Debe elegir un lote',
          showConfirmButton: false,
          timer: 1500
        });
    }else {
      $.ajax({
          type:'POST',
          url:'?c=Control&a=balance',
          data:{
            'fi':$('#FIR').val(),
            'ff':$('#FFR').val(),
            'op':idLote
          },success:function(result){
            var res = JSON.parse(result);
            var balance  = 0;
            var ventas  = 0;
            var gasto = 0;
            var balancet  = 0;
            var ventast = 0;
            var gastot = 0;
            var i = 0;

            console.log(Object.keys(res.data).length);
            $('#Lotes').append('<h2 class="Titulos"> Lotes </h2>');
            $('#Ventas').append('<h2 class="Titulos"> Ingresos </h2>');
            $('#Gastos').append('<h2 class="Titulos"> Gastos </h2>');
            $('#Balance').append('<h2 class="Titulos"> Balance </h2>');
            while (Object.keys(res.data).length > i) {
              ventas = res.data[i].Ventas;
              gasto = res.data[i].Gasto;

              if(ventas == null){
                ventas = 0;
              }

              if(gasto == null){
                gasto = 0;
              }
              $('#Lotes').append('<h5 class="Lotes">'+res.data[i].Nombre+' : '+' </h5> <br>');
              $('#Ventas').append('<h5 class="Montos1">₡ '+ventas+' </h5> <br>');
              $('#Gastos').append('<h5 class="Montos1">₡ '+gasto+' </h5> <br>');
              balance = parseFloat(ventas) - parseFloat(gasto);
               if(balance < 0){
                 balance = balance *-1;
                 $('#Balance').append('<h5 class="Nega"> - ₡ '+balance+' </h5> <br>');
               }
               else {
                 balancet += balance;
                 $('#Balance').append('<h5 class="Posi"> ₡ '+balance+' </h5> <br>');
               }
               gastot += parseFloat(gasto);
               ventast += parseFloat(ventas);
               balance =0;
              i++;
            }
            balancet = parseFloat(ventast) - parseFloat(gastot);
            $('#Lotes').append('<h5 class="Lotes">Totales : '+' </h5> <br>');
            $('#Ventas').append('<h5 class="Montos1">₡ '+ventast+' </h5> <br>');
            $('#Gastos').append('<h5 class="Montos1">₡ '+gastot+' </h5> <br>');
            if(balancet < 0){
              balancet = balancet *-1;
              $('#Balance').append('<h5 class="Nega"> - ₡ '+balancet+' </h5> <br>');
            }
            else {

              $('#Balance').append('<h5 class="Posi"> ₡ '+balancet+' </h5> <br>');
            }
          }
      });
    }

  });

}

function aprobar(){
      $("#tablaPlanilla").on("click",".btnAprobarPlanilla", function(){
      d = $(this).parents("tr").find("td");
      var estado = d[2].innerText;
      if(estado == "Pendiente"){

        swal({
          title: '¿Esta seguro(a) que desea aprobar la planilla?',
          type: 'warning',
          showCancelButton: true,
          confirmButtonColor: '#3085d6',
          cancelButtonColor: '#d33',
          confirmButtonText: 'Si, Aprobar!',
          cancelButtonText: 'No, Cancelar!',
          confirmButtonClass: 'btn btn-success',
          cancelButtonClass: 'btn btn-danger',
          buttonsStyling: false
        }).then(function () {

            $.ajax({
              type:"POST",
              url:"?c=nomina&a=AprobPl",
              data:{
                "Idpl":d[0].innerText,
                "op":1
              },
              success:function(result){
                if(result != null){
                         Planilla();
                          swal({
                              type: 'success',
                              title: 'Aprobado exitosamente',
                              showConfirmButton: false,
                              timer: 1500
                            });


                }
              }
            });

          } ,function (dismiss) {
            // dismiss can be 'cancel', 'overlay',
            // 'close', and 'timer'
            if (dismiss === 'cancel') {
                swal({
                    type: 'info',
                    title: 'Cancelado',
                    showConfirmButton: false,
                    timer: 1500
                  });
            }
          });

      }
      else
       {

         swal({
             type: 'error',
             title: 'Planilla ya fue aprobada',
             showConfirmButton: false,
             timer: 1500
           });

      }

    });
}


function cancelar(){
      $("#tablaPlanilla").on("click",".btnRechazar", function(){
      d = $(this).parents("tr").find("td");
      var estado = d[2].innerText;
      if(estado == "Aprobado"){

        swal({
          title: '¿Esta seguro(a) que desea cambiar el estado de la planilla?',
          type: 'warning',
          showCancelButton: true,
          confirmButtonColor: '#3085d6',
          cancelButtonColor: '#d33',
          confirmButtonText: 'Si, Cambiar',
          cancelButtonText: 'No',
          confirmButtonClass: 'btn btn-success',
          cancelButtonClass: 'btn btn-danger',
          buttonsStyling: false
        }).then(function () {

            $.ajax({
              type:"POST",
              url:"?c=nomina&a=AprobPl",
              data:{
                "Idpl":d[0].innerText,
                "op":2
              },
              success:function(result){
                if(result != null){
                         Planilla();
                          swal({
                              type: 'success',
                              title: 'La planilla ahora esta pendiente',
                              showConfirmButton: false,
                              timer: 1500
                            });


                }
              }
            });

          } ,function (dismiss) {
            // dismiss can be 'cancel', 'overlay',
            // 'close', and 'timer'
            if (dismiss === 'cancel') {
                swal({
                    type: 'info',
                    title: 'Cancelado',
                    showConfirmButton: false,
                    timer: 1500
                  });
            }
          });

      }
      else
       {

         swal({
             type: 'error',
             title: 'Planilla ya esta pediente',
             showConfirmButton: false,
             timer: 1500
           });

      }

    });
}


function fecha(){
  $("#Consul").on("change",function(){
   var des = $("#Consul").val();
       if(des < 0){
        $("#fec").show();
       }else {
         $("#fec").hide();
       }
  });
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

$("#NNomina").on("click",function(){
  $.ajax({
    type:'POST',
    url: '?c=Nomina&a=GenerarNomina',
    success:function(result) {

    }
  });
});


$("#tablaDC").on("click",".quitarC", function(){
d = $(this).parents("tr").find("td");
$.ajax({
  type:'POST',
  url:'?c=Nomina&a=QuitarC',
  data:{
    'IdCC': d[0].innerText,
    'idN': $('#idNomina').val()
  },
    success:function(){


                              $.ajax({
                                type:'POST',
                                url:'?c=Nomina&a=CalC',
                                data:{
                                  'IdCon': d[1].innerText
                                                },
                                success:function(result){
                                  var con = JSON.parse(result);
                                    console.log( result);
                                    var sal = $('#salBruto').val();
                                    var d = con.data[0].tot;
                                    var p = ( sal * ( con.data[0].Porce / 100 ));
                                 if( con.data[0].tot > 0 )
                                 {
                                       if(con.data[0].tipo = 'Deduccion'){
                                        console.log(d);
                                         __('SalBr').innerText = (parseInt(sal) + parseInt(d));
                                      }
                                       else {
                                         __('SalBr').innerText = (parseInt(sal) + parseInt(d));
                                       }
                                       console.log(d);
                                 }
                                 else {
                                       if(con.data[0].tipo = 'Deduccion'){

                                         __('SalBr').innerText = (parseInt(sal) + parseInt(p));
                                      }
                                       else {
                                          __('#SalBr').innerText = (parseInt(sal) + parseInt(p));
                                            }
                                 }
                                         $.ajax({
                                           type:'POST',
                                           url:'?c=Nomina&a=CaSalBR',
                                           data: {'IdNomina': $('#idNomina').val(),
                                                  'Monto':__('SalBr').innerText,
                                                   'idpl': __('pl').innerText},
                                                  success:function(result){
                                                    if(result = true){
                                                      listar();
                                                    }
                                                  }
                                         });
                                }
                                });

      listarCC($('#idCol1').val(), $('#idNomina').val());
      listarCop($('#idCol1').val(), $('#idNomina').val());
                    swal({
                title: 'Procesando datos',
                text: 'Espere',
                timer: 1000,
                onOpen: function () {
                  swal.showLoading()
                }
              }).then(
                function () {},
                // handling the promise rejection
                function (dismiss) {
                  if (dismiss === 'timer') {
                    console.log('I was closed by the timer')
                  }
                }
              )
     }
 });
});

$("#tablaD").on("click",".agreagCo", function(){
  d = $(this).parents("tr").find("td");
  $.ajax({
    type:'POST',
    url:'?c=Nomina&a=NuevoCol',
    data:{
      'IdCon': d[1].innerText,
      'IdCol': $('#idCol1').val(),
      'Total': $('#SalBr').val(),
      'IdNomina' : $('#idNomina').val()
    },
    success:function(){
                        $.ajax({
                          type:'POST',
                          url:'?c=Nomina&a=CalC',
                          data:{
                            'IdCon': d[1].innerText
                                          },
                          success:function(result){
                            var con = JSON.parse(result);

                              var sal = __('SalBr').innerText;
                              var d = con.data[0].tot;
                              var p = ( sal * (con.data[0].Porce/100) );
                           if( con.data[0].tot > 0 )
                           {
                                 if(con.data[0].tipo = 'Deduccion'){

                                   __('SalBr').innerHTML = sal - d;
                                }
                                 else {
                                   __('SalBr').innerText = sal + d;
                                 }
                           }
                           else {
                                 if(con.data[0].tipo = 'Deduccion'){

                                   __('SalBr').innerText = sal - p;
                                }
                                 else {
                                    __('#SalBr').innerText = sal + p;
                                      }
                           }
                           $.ajax({
                             type:'POST',
                             url:'?c=Nomina&a=CaSalBR',
                             data: {'IdNomina': $('#idNomina').val(),
                                    'Monto':__('SalBr').innerText,
                                     'idpl': __('pl').innerText},
                                    success:function(result){
                                      if(result = true){
                                        listar();
                                      }
                                    }
                           });
                          }
                          });
                listarCC($('#idCol1').val(), $('#idNomina').val());
                listarCop($('#idCol1').val(), $('#idNomina').val());
                swal({
                title: 'Procesando datos',
                text: 'Espere',
                timer: 1000,
                onOpen: function () {
                  swal.showLoading()
                }
              }).then(
                function () {},
                // handling the promise rejection
                function (dismiss) {
                  if (dismiss === 'timer') {
                    console.log('I was closed by the timer')
                  }
                }
              )
    }
  });
});

$("#tablaNomina").on("click",".btnEditarNomina", function(){
  d = $(this).parents("tr").find("td");
      $('#idNomina').val(d[0].innerText);
      $('#idCol1').val(d[1].innerText);
      $('#idCol').text(d[1].innerText);
      $('#Ced').text(d[2].innerText);
      $('#ENombre').text(d[3].innerText);
      $('#fInicio').text(d[6].innerText);
      $('#fFin').text(d[7].innerText);
      $('#SalB').text(d[4].innerText);
      $('#Horas').text(d[8].innerText);
      $('#SalBr').text(d[10].innerText);
      $('#pl').text(d[9].innerText);
      $('#salBruto').val(d[5].innerText);
      $('#HE').text(d[11].innerText);
      listarCC(d[1].innerText, $('#idNomina').val());
      listarCop(d[1].innerText, $('#idNomina').val());
      consultaHorasAprovechadas(d[1].innerText,d[6].innerText,d[7].innerText);

});


function consultaHorasAprovechadas(id,fi,ff){

  $.ajax({
    type:'POST',
    url:'?c=Nomina&a=HAprov',
    data:{
      'id':id,
      'fi':fi,
      'ff':ff
        },
      success:function(result){
        var a = JSON.parse(result);
        if(a.data[0].hxa != null){

          console.log(a.data[0].hxa);
          $('#hapr').text(a.data[0].hxa);

        }else {

          $('#hapr').text(0);
        }
    }
  });

}

  $("#tablaNomina").on("click",".btnElinimarNomina", function(){
    d = $(this).parents("tr").find("td");


          swal({
                    title: '¿Seguro que desea eliminar la nomina de '+d[3].innerText+' que inició fecha '+d[6].innerText+'?',
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
                              url:"?c=Nomina&a=Eliminar",
                              data: {
                             'IdNomina': d[0].innerText},
                              success: function(result){

                                if(result == true){

                                    swal({
                                        type: 'success',
                                        title: 'Operación ejecutada exitosamente',
                                        showConfirmButton: false,
                                        timer: 1500
                                      });
                                }

                              listar();
                             }
                      });

                  }, function (dismiss) {
                    // dismiss can be 'cancel', 'overlay',
                    // 'close', and 'timer'
                    if (dismiss === 'cancel') {
                        swal({
                            type: 'info',
                            title: 'Cancelado',
                            text: 'Su registro esta salvo ☺',
                            showConfirmButton: false,
                            timer: 1500
                          });
                    }
                  })


});

function Planilla(){

  var table = $("#tablaPlanilla").DataTable({
       "order": [[0, "desc" ]],
       "scrollY":"300px",
       "responsive" : true,
       "destroy": true,
       "bDeferRender": true,
        "sPaginationType": "full_numbers",
        "ajax": {
          "url": "?c=Nomina&a=Planilla",
          "type": "POST"
               },
        "columns": [
          { "data": "IdPlanilla"},
          { "data": "Total"},
          { "data": "Estado"},
          { "data": "FI"},
          { "data": "FF"},
          {"data":null,"defaultContent": "<buttom class='btn btn-primary btnAprobarPlanilla'><span class='fa fa-check'></span></buttom> \n\
          <button class='btn btn-danger btnRechazar' id='EPersona'><span class='fa fa-times'></span></button>" }
          ],
          "columnDefs": [
                            // El salario de la columna se vuelve rojo
                            {
                                "targets": [2], // El objetivo de la columna de posición, desde cero.
                                "data": "Estado", // La inclusión de datos
                                      "render": function(data, type, full) { // Devuelve el contenido personalizado
                                    if(data == 'Pendiente'){
                                        return "<span class='pendiente'>" + data + "</span>";
                                    }
                                    else {
                                      return "<span class='aprobado'>" + data + "</span>";
                                    }
                                }
                              }
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



function listarCop(id, id2){
  $('#tablaD').dataTable().fnDestroy();
  $.fn.dataTable.ext.errMode = 'none';
  var table = $("#tablaD").DataTable({
       "scrollY":"200px",
       "bPaginate": false,
       "destroy": true,
       "bFilter": false,
       "bDeferRender": true,
        "sPaginationType": "full_numbers",
        "ajax": {
          "url": "?c=Nomina&a=Concep",
          "type": "POST",
          "data":{'IdCol':id,
                  'i': id2}
        },
        "columns": [
          {"data":null,"defaultContent": "<buttom class='btn btn-success agreagCo'><span id='desk' class='fa fa-arrow-left desk'></span><span id='movil' class='fa fa-arrow-up movil'></span></buttom>" },
          { "data": "IdConcepto" , "class": "hidden"},
          { "data": "Nombre" },
          { "data": "Porcentaje", "class":"hidden" },
          { "data": "Total" , "class":"hidden"},
          { "data": "Tipo", }
          ],

 "language": idioma_espanol

  });


}


function listarCC(id, id2){
  $.fn.dataTable.ext.errMode = 'none';
  $('#tablaDC').dataTable().fnDestroy();
  var table = $("#tablaDC").DataTable({

       "scrollY":"200px",
       "bPaginate": false,
       "destroy": true,
       "bFilter": false,
       "bDeferRender": true,
        "sPaginationType": "full_numbers",
        "ajax": {
          "url": "?c=Nomina&a=CC",
          "type": "POST",
          "data" :{'IdCol':id,
                    'i' : id2}
        },
        "columns": [
          { "data": "IdCC" , "class": "hidden"},
          { "data": "IdConcepto" , "class": "hidden"},
          { "data": "Nombre" },
          { "data": "Porcentaje", "class":"hidden" },
          { "data": "Total" , "class":"hidden"},
          { "data": "Tipo"},
          {"data":null,"defaultContent": "<buttom class='btn btn-danger quitarC'><span id='desk' class='fa fa-arrow-right desk'></span><span id='movil' class='fa fa-arrow-down'></span></buttom>" }

          ],

 "language": idioma_espanol

  });


}


function consl(){
  $("#btnConsultar").on("click",function(){
    listar();
  });
}



function listar(){
 var ac = $("#Consul").val();
  var f1 = $("#FII").val();
  var f2 = $("#FFF").val();
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



  var table = $("#tablaNomina").DataTable({
       "order": [[ 0 , "desc" ]],
       "scrollY":"200px",
       "responsive" : true,
       "destroy": true,
       "bDeferRender": true,
        "sPaginationType": "full_numbers",
        "ajax": {
          "url": "?c=Nomina&a=Listar",
          "type": "POST",
          "data":{
            "f1":f1,
            "f2":f2,
            "cons":$("#Consul").val()
                }
               },
        "columns": [
          { "data": "IdNomina" , "class": "hidden"},
          { "data": "IdColaborador", "class":"hidden"},
          { "data": "Cedula" },
          { "data": "Nombre"},
          { "data": "SalarioBase", "class":"hidden"},
          { "data": "SalarioBruto","class":"hidden"},
          { "data": "fInicio"},
          { "data": "fFin"},
          { "data": "Horas","class":"hidden"},
          { "data": "IdPlanilla"},
          { "data": "MontoNomina"},
          { "data": "HE", "class":"hidden"},
          {"data":null,"defaultContent": "<button class='btn btn-primary btnEditarNomina ' data-toggle='modal' data-target='#EditarNomina'><span class='fa fa-pencil'></span></button><button class='btn btn-danger btnElinimarNomina' id='EPersona'><span class='fa fa-trash'></span></button>" }
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
