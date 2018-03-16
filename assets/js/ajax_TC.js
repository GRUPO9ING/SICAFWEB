$(document).on("ready", function(){
 porHora();
 validaLong();
  $("#jus").val('');

  QuitarInsumo();
  $('#creatc').on('click',function(){
    $(".empl").remove();
    $("#SalarioBruto").val(0);
  });
  listarTRC();
  listar($("#idTC").val());

  $("#tablaCols").on("click",".btnSeleccionar", function(){

    d = $(this).parents("tr").find("td");
    if($("#SalarioBruto").val() == ""){
      var valor = 0;
    }else {
      var valor = $("#SalarioBruto").val();
    }

    valor = parseFloat(valor)+parseFloat(d[4].innerText);

    console.log(valor);
    $("#SalarioBruto").val(valor);

    if($("#insumos").val() == ""){
      var insu = 0;
    }else {
      var insu = $("#insumos").val();
    }

     if($("#Hr").val() == ""){
       var hr = 0;
     }else {
       var hr = $("#Hr").val();
     }


var total = parseFloat(insu) + (parseFloat(valor)*parseFloat(hr));

$("#invert").text("₡ "+total);
$("#invert").val(total);
 console.log($("#invert").innerHTML);
    $.ajax({
      type:'POST',
      url:'?c=Tc&a=inColTc',
      data:{
        'idCol':d[0].innerText
      },
      success:function(result)
      {
        $("#ColDiv").after("<a onclick='hola("+d[0].innerText+","+d[4].innerText+");' id="+d[0].innerText+" class='btn btn-primary' value="+d[0].innerText+"><span class='fa fa-trash'> "+d[2].innerText+"</span> </a>");
        $("#COLS").modal('hide');
      }
    })

  });

      function validaLong()
      {

      $("#jus").keyup(function(){
        var long = $("#jus").val();

        if (long.length >= 100)
          {

           var msj = $("#jus").val();
           var newmsj = msj.slice(0,100);
           $("#jus").val(newmsj);

          }
      });

      }


function porHora(){
  $("#Hr").keyup(function(){

    if($("#SalarioBruto").val() == "")
    {
      var valor = 0;
    }
    else
     {
      var valor = $("#SalarioBruto").val();
    }

    if($("#insumos").val() == ""){
      var insu = 0;
    }else {
      var insu = $("#insumos").val();
    }

     if($("#Hr").val() == ""){
       var hr = 0;
     }else {
       var hr = $("#Hr").val();
     }


    var total = parseFloat(insu) + (parseFloat(valor)*parseFloat(hr));
    $("#invert").text("₡ "+total);
    $("#invert").val(total);

  })
}

  $("#frm-InsumoTC").on("submit", function(e){
         e.preventDefault();
         //Guardamos la referencia al formulario
         var $f = $(this);
         //Comprobamos si el semaforo esta en verde (1)
         if ($f.data('locked') != undefined && !$f.data('locked')){
          //No esta bloqueado aun, bloqueamos, preparamos y enviamos la peticion
                           $.ajax({
                             type: 'POST',
                             url:"?c=Tc&a=InINTC",
                             data: {
                              'IdInsumo': $('#IdInsu').val(),
                              'Cantidad': $('#Cant').val(),
                              'IDTC':  $("#idTC").val()
                              },
                              beforeSend: function(){
                                  $f.data('locked', true);  // (2)
                              },
                              success: function(result){
                                var re = JSON.parse(result);
                                if(re.data[0].dato == 1)
                                {
                                enjaula($("#idTC").val());
                                $('#Ins').modal('hide');
                              }
                              else {
                                swal({
                                    type: 'error',
                                    title: 'Cantidad Insuficiente',
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

          $("#frm-tc").on("submit", function(e){
                 e.preventDefault();
                 //Guardamos la referencia al formulario
                 var $f = $(this);
                 //Comprobamos si el semaforo esta en verde (1)
                 if ($f.data('locked') != undefined && !$f.data('locked')){
                  //No esta bloqueado aun, bloqueamos, preparamos y enviamos la peticion
                                   $.ajax({
                                     type: 'POST',
                                     url:"?c=Tc&a=InsertarTRC",
                                     data: {
                                      'IdLote': $('#IdLO').val(),
                                      'IDTC': $("#idTC").val(),
                                      'Fecha': $("#Fechatc").val(),
                                      'Horas': $("#Hr").val(),
                                      'Jus': $("#jus").val(),
                                      'in':$("#invert").val()
                                      },
                                      beforeSend: function(){
                                          $f.data('locked', true);  // (2)
                                      },
                                      success: function(result){
                                        if(result = true)
                                        {
                                          listarTRC();
                                          $('#TC').modal('hide');
                                          swal({
                                              type: 'success',
                                              title: 'Guardado exitosamente',
                                              showConfirmButton: false,
                                              timer: 1500
                                            });
                                      }
                                      else {
                                        swal({
                                            type: 'error',
                                            title: 'Sucedio algo inesperado',
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


          $("#aaa").on("click",function(){
            listar($("#idTC").val());
          });
});


function __(id) {
  return document.getElementById(id);
}


function hola(val,bb){

  $.ajax({
    type:'POST',
    url:'?c=Tc&a=ELiColTc',
    data:{
      'idCol':val,
      'idTc': $("#idTC").val()
    },
    success:function(result){
      console.log(result);
      $("#"+val+"").fadeTo(1000, 0.01, function(){
        $("#"+val+"").slideUp(150, function() {
                $("#"+val+"").remove();

                if($("#SalarioBruto").val() == "")
                {
                  var valor = 0;
                }
                else
                 {
                  var valor = $("#SalarioBruto").val();
                }

                valor = parseFloat(valor)-parseFloat(bb);

                console.log(valor);
                $("#SalarioBruto").val(valor);


                if($("#insumos").val() == ""){
                  var insu = 0;
                }else {
                  var insu = $("#insumos").val();
                }

                 if($("#Hr").val() == ""){
                   var hr = 0;
                 }else {
                   var hr = $("#Hr").val();
                 }


                var total = parseFloat(insu) + (parseFloat(valor)*parseFloat(hr));
                $("#invert").text("₡ "+total);
                $("#invert").val(total);
                console.log($("#invert").innerText);
              });
          });
          listar($("#idTC").val());
    }
  });

}

function QuitarInsumo(){

    $("#TablaIns").on("click",".btnElimi",function(){
     d = $(this).parents("tr").find("td");
     console.log(d[0].innerText);

      $.ajax({
        type:'POST',
        url:'?c=TC&a=QuitarIns',
        data:{
          'id':d[0].innerText
        },
        success:function(){
         enjaula($("#idTC").val());
        }

      });

    });
}

$("#TablatrC").on("click",".btnEditarTC", function(){

      $(".empl").remove();
      $("#col").empty();
      $('#TC').modal('show');
      d = $(this).parents("tr").find("td");
      console.log(d[3].innerText);
      enjaula(d[0].innerText);
      $("#idTC").val(d[0].innerText);
      $("#Fechatc").val(d[1].innerText);
      $('.selectpicker').selectpicker('val', d[3].innerText);
      $.ajax({
        type:'POST',
        url:'?c=Tc&a=ListarColcolTRC',
        data:{
          'IDTC':d[0].innerText
        },
        success:function(result){
        var a = JSON.parse(result);
        for (var i = 0; i < a.data.length; i++) {
          console.log(d[0].innerText)
          $("#ColDiv").after("<a onclick='hola("+a.data[i].IdCol+");' id="+a.data[i].IdCol+" class='btn btn-primary empl' value="+a.data[i].IdCol+"><span class='fa fa-trash'> "+a.data[i].Nombre+"</span> </a>");
        }
        }
      });

});



function enjaula(val)
{
listarINS(val);
actualiza(val);
}


function actualiza(val){
 $.ajax({
      type:'POST',
      url:'?c=tc&a=Actua',
      data:{
        'Id':val
      },
      success:function(result){
       var res = JSON.parse(result);
       var s = res.data[0].Inver;

       if($("#SalarioBruto").val() == "")
       {
         var valor = 0;
       }
       else
        {
         var valor = $("#SalarioBruto").val();
       }
        $("#insumos").val(s);

        if($("#Hr").val() == ""){
          var hr = 0;
        }else {
          var hr = $("#Hr").val();
        }


       var total = parseFloat(s) + (parseFloat(valor)*parseFloat(hr));
       $("#invert").text("₡ "+total);
      $("#invert").val(total);

     }
   });


}


$('#creatc').on("click",function(){
  $.ajax({
    type:'POST',
    url:'?c=Tc&a=CreaTdCampo',
    success:function(result){
      var id = JSON.parse(result);
      $("#idTC").val(id.data[0].IdTc);
      enjaula(id.data[0].IdTc);
    }
  });
});

$("#btnConsultar").on("click",function(){
  listarTRC ();
});




function listarTRC(){

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

  var table = $("#TablatrC").DataTable({
        "order": [[0, "desc" ]],
        "scrollY":"200px",
        "bPaginate": true,
        "destroy": true,
        "bDeferRender": true,
        "sPaginationType": "full_numbers",
        "ajax": {
          "url": "?c=Tc&a=ListarTRC",
          "type": "POST",
          "data":{
            "FI":f1,
            "FF":f2
          }
        },
        "columns": [
          { "data": "IdTdCampo" , "class": "hidden"},
          { "data": "FechaTC"},
          { "data": "Total" },
          { "data": "IdLote","class":"hidden" },
          { "data": "Nombre" },
          {"data":null,"defaultContent": "<button class='btn btn-warning btnEditarTC'><span class='fa fa-pencil'></span></button>"}
          ],

 "language": idioma_espanol
  });


}


function listarINS(val){

  var table = $("#TablaIns").DataTable({
        "bFilter": false,
        "scrollY":"100px",
        "bPaginate": false,
        "destroy": true,
        "bDeferRender": true,
        "sPaginationType": "full_numbers",
        "ajax": {
          "url": "?c=Tc&a=ListarIns",
          "type": "POST",
          "data":{
            'Id':val
          }
        },
        "columns": [
          { "data": "IdTCL", "class": "hidden"},
          { "data": "IdTC" , "class": "hidden"},
          { "data": "IdInsumo" , "class": "hidden"},
          { "data": "Nombre" },
          { "data": "Cantidad"},
          { "data": "Total"},
          {"data":null,"defaultContent": "<button class='btn btn-danger btnElimi'><span class='fa fa-trash'></span> Quitar</button>"}
          ],

 "language": idioma_espanol
  });


}

function listar(id){

  var table = $("#tablaCols").DataTable({
        "scrollY":"200px",
        "bPaginate": false,
        "destroy": true,
        "bDeferRender": true,
        "sPaginationType": "full_numbers",
        "ajax": {
          "url": "?c=Tc&a=ListarCols",
          "type": "POST",
          "data":{
            'IdTC':id
          }
        },
        "columns": [
          { "data": "IdColaborador" , "class": "hidden"},
          { "data": "Cedula" },
          { "data": "Nombre" },
          { "data": "Apellido1"},
          { "data": "SalarioBase","class":"hidden"},
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
