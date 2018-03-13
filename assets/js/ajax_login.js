$(document).on("ready", function(){
  $("#ir").on("click", function(){
    $.ajax({
      type: 'POST',
      url:"?c=Login&a=Autenticar",
      data: {
        'nombre': $('#email').val(),
        'pass': $('#pwd').val()},
        success: function(result){
                  var res = JSON.parse(result);
                  console.log(result);
                  var t = Object.keys(result).length;
                   if(t > 11)
                   {
                         if(res.data[0].userName == $('#email').val() && res.data[0].pass == $('#pwd').val()){
                            swal({
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
                                    location.href ="?c=colaborador";
                                    if (dismiss === 'timer')
                                    {
                                      console.log('I was closed by the timer')
                                    }
                                  }
                                )
                                $.ajax({
                                  type:'POST',
                                  url:'?c=Login&a=CreaSesion',
                                  data:{'user':res.data[0].username},
                                  success:function(result){
                                  console.log(result);
                                  }
                                });

                          }
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
