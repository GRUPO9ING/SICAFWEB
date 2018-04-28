$( document ).ready(function() {
GuardarHE();
listarHE();
editar();
aplicar();
});
function GuardarHE(){

  $("#Enviar").on('click',function(){

    validator = $("#frm-horas").validate();
    $.validator.addMethod("fechas", function (value, element) {
    return this.optional(element) || /^[0-9/-]+$/.test(value);
    }, "no se permiten letras");


    $.validator.addMethod("horas", function (value, element) {
    return this.optional(element) || /^[0-9]+$/.test(value);}, "no se permiten letras");



      validatorhoras = $("#frm-horas").validate();
      validatorhoras.destroy();
      validatorhoras = $("#frm-horas").validate({
      event: "blur",
      errorElement: "span",
      rules: {
                cHoas :{required:true, horas:true, rangelength:[1,3], min:1, max:12},
                IdTC :{required:1},
                FF :{required:true, fechas:true, rangelength:[8,10]}
              },
      messages: {
        cHoas : { required:'Digite las horas', horas:'Solo numeros', rangelength:"Máximo {1} caracteres" ,min:'Debe ser por lo menos 1 hora' ,max:'Debe ser menos de 12'},
        IdTC : { required:'Elija uno'},
        FF : { required:'Espacio requerido', fechas:'Fecha valida', rangelength:"Máximo {1} caracteres"}
            },
      submitHandler: function (form)
      {

            $.ajax({
               type: 'POST',
               url:"?c=Colaborador&a=NuevaHE",
               data: {
                   'id': $("#idHe").val(),
                   'cant': $("#cHoas").val(),
                   'idCol': $("#IdTC").val(),
                   'fecha':  $("#FF").val()
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
              complete: function(){
                $('.mensajes').html('');
             }
            });

      }
    })
  });

}


function editar() {


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


}


function aplicar() {

  $("#tablahoras").on("click",".btnAplicar", function(){
    d = $(this).parents("tr").find("td");
    var valida = d[5].innerText;
     if(valida == "Pendiente"){
    $.ajax({
      type:'POST',
      url:'?c=Colaborador&a=AplicarHE',
      data:{
            "idP": d[2].innerText,
            "fecha":d[4].innerText,
            "idCol":d[0].innerText},
            success:function(result){
              if(result = true){
                console.log(d[2],d[4],d[0]);
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
