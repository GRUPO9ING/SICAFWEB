$(document).on("ready", function(){
traercod();
$("#codigo").hide();
$("#pass").hide();
compararCodigo();
});

function traercod(){
  $( "#next" ).click(function() {
    $.ajax({
      type: 'POST',
      url:"?c=Login&a=TraerCodigo",
      data: {
        'username': $("#email").val()
      },
      success:function(result){
        var svalor = JSON.parse(result);
        if(svalor.data.length > 0){
          $.ajax({
            type: 'POST',
            url:"?c=Login&a=usuarios",
            data: {
              'correo':svalor.data[0].Correo,
              'codigo':svalor.data[0].Recuperacion,
              'nombre':$("email").val()
            },
            success:function(result){
              console.log(result);
              swal({
                     title: 'Enviando correo',
                     text: 'Enviando',
                     timer: 3000,
                     onOpen: function () {
                       swal.showLoading()
                     }
                   }).then(
                     function () {},
                     // handling the promise rejection
                     function (dismiss) {
                       $("#formulario").hide();
                       $("#codigo").show();
                      compararCodigo(svalor.data[0].Recuperacion);
                      change($(email).val());
                       if (dismiss === 'timer')
                       {
                         console.log('I was closed by the timer')
                       }
                     }
                   )
            }
            });
        }else{
          swal({
              type: 'error',
              title: 'Usuario no existe',
              showConfirmButton: false,
              timer: 1000
            });
        }
      }
    });
  });
}

function compararCodigo(variable){
  var eso = variable
  $("#restaurar").click(function(){
    console.log($('#ff').val());
    if($("#ff").val() == ""){
      swal({
          type: 'error',
          title: 'El codigo no puede estar en blanco',
          showConfirmButton: false,
          timer: 1000
        });
    }
    else{
      if($("#ff").val() == eso)
      {
        $("#codigo").hide();
        $("#pass").show();
      }
    }
  });
}

function change(valor){
  var usuario = valor;
  $("#guardar").click(function(){
    $.ajax({
      type:'POST',
      url:'?c=Login&a=cambiar',
      data:{
           'usuario':usuario,
           'newpw':$("#pw").val()
      },
      success:function(result){
        console.log(result);
        if(result == true){
          swal({
              type: 'success',
              title: 'Se cambio la contraseña',
              showConfirmButton: false,
              timer: 1000
            });
            window.location.href = "?c=login";
        }
        else {
          swal({
              type: 'error',
              title: 'No se pudo cambiar la contraseña',
              showConfirmButton: false,
              timer: 1000
            });
        }
      }
    });
  });
}
