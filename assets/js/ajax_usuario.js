$(document).on("ready", function(){
  listar();
  /**/
  limpiar();
  /**/
  contraIgual();
  contra2();
  /**/
    $("#frm-usuario").on("submit", function(e){
           e.preventDefault();
           //Guardamos la referencia al formulario
           var $f = $(this);
           //Comprobamos si el semaforo esta en verde (1)
           if ($f.data('locked') != undefined && !$f.data('locked')){

           if($("#admin").prop("checked")){
             var a = 1;
             console.log(a);
           }else {
             var a = 0;
             console.log(a);

           }
            //No esta bloqueado aun, bloqueamos, preparamos y enviamos la peticion
                             $.ajax({
                                type: 'POST',
                                url:"?c=Usuario&a=Guardar",
                                data: {
                                    'Id': $("#id").val(),
                                    'nom':  $("#nom").val(),
                                    'ap1': $("#ap1").val(),
                                    'ap2': $("#ap2").val(),
                                    'user': $("#user").val(),
                                    'pass': $("#pass").val(),
                                    'rol': a

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
                                    console.log(result);
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
/**/

});


function __(id) {
  return document.getElementById(id);
}


function limpiar(){
  $("#nw").on('click',function(){
    $("#id").val('');
    $("#nom").val('');
    $("#ap1").val('');
    $("#ap2").val('');
    $("#user").val('');
    $("#pass").val('');
    $("#pass2").val('');
    __('nn').innerHTML = "Nuevo usuario";
    $( "#Enviar" ).prop( "disabled", true );
    $( "#pass2" ).prop( "disabled", true );
  });
}

    function contraIgual()
    {

        $("#pass").keyup(function(){
          var p = $("#pass").val();
          console.log()

        if(p.length > 2){

          $( "#pass2" ).prop( "disabled", false );

        }else {
          $( "#pass2" ).prop( "disabled", true );
        }

      });

    }

    function contra2(){


            $("#pass2").keyup(function(){
              var p = $("#pass").val();
              var p2 = $("#pass2").val();

            if(p.length == p2.length){
              if(p == p2)
              {
                $( "#Enviar" ).prop( "disabled", false );
              }
              else {
                $( "#Enviar" ).prop( "disabled", true );
              }

            }
            else {
              $( "#Enviar" ).prop( "disabled", true );
            }

           });
    }

function listar(){

  var table = $("#TablaUsuario").DataTable({
       "destroy": true,
       "responsive":true,
       "bDeferRender": true,
        "sPaginationType": "full_numbers",
        "ajax": {
          "url": "?c=Usuario&a=Listar",
          "type": "POST"
        },
        "columns": [
          { "data": "IdUser" , "class": "hidden"},
          { "data": "Nombre" },
          { "data": "Apellido1" },
          { "data": "Apellido2" },
          {"data":null,"defaultContent": "<buttom class='btn btn-primary btnEditarUsuarioRoles ' data-toggle='modal' data-target='#mGuardar'><span class='fa fa-pencil'></span></buttom>\
          <button  class='btn btn-danger btnElinimarUsuarioRoles' id='EUsuarioRoles'><span class='fa fa-trash'></span></button>" }
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
