$( document ).ready(function() {
GuardarHE();
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
