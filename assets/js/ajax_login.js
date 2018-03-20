$(document).on("ready", function(){
  $("#ir").on("click", function(){
    $.ajax({
      type: 'POST',
      url:"?c=Login&a=Autenticar",
      data: {
        'nombre': $('#email').val(),
        'pass': $('#pwd').val()
      },
        success: function(result){
                  var res = JSON.parse(result);

                  if(res.data[0].Respuesta == 'MATCH')
                   {  swal({
                                  title: 'Espere',
                                  text: 'Iniciando sesión',
                                  timer: 1000,
                                  onOpen: function () {
                                    swal.showLoading()
                                  }
                                }).then(
                                  function () {},
                                  // handling the promise rejection
                                  function (dismiss) {

                                    $.ajax({
                                      type:'POST',
                                      url:'?c=Login&a=CreaSesion',
                                      data:{'user':res.data[0].Nombre,'ROL':res.data[0].Rol},
                                      success:function(result){
                                      console.log(result);
                                      }
                                    });
                                    location.href ="?c=colaborador";
                                    if (dismiss === 'timer')
                                    {
                                      console.log('I was closed by the timer')
                                    }
                                  }
                                )

                   }
                    else {
                      swal({
                             type: 'error',
                             title: 'El usuario o la contraseña es incorrecta',
                             showConfirmButton: false,
                             timer: 1500
                           })
                  }
        }
    });
  });
});

function __(id) {
  return document.getElementById(id);
}
