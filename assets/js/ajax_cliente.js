$( document ).ready(function() {

});

function guardarCol(){

    $("#Enviar").on('click',function(){


      validator = $("#frm-colaborador").validate();
      $.validator.addMethod("fechas", function (value, element) {
      return this.optional(element) || /^[0-9/-]+$/.test(value);
      }, "no se permiten letras");

      validator = $("#frm-colaborador").validate();
      $.validator.addMethod("ced", function (value, element) {
      return this.optional(element) || /^[a-z0-9-]+$/.test(value);
      }, "No se permiten caracteres especiales o numeros");

      validator = $("#frm-colaborador").validate();
      $.validator.addMethod("letras_espacios", function (value, element) {
      return this.optional(element) || /^[a-zA-ZáéíóúàèìòùÀÈÌÒÙÁÉÍÓÚñÑüÜ_.,\s]+$/.test(value);
      }, "No se permiten caracteres especiales o numeros");

      validator = $("#frm-colaborador").validate();
      $.validator.addMethod("todos", function (value, element) {
      return this.optional(element) || /^[0-9@a-zA-ZáéíóúàèìòùÀÈÌÒÙÁÉÍÓÚñÑüÜ_.,\s]+$/.test(value);
      }, "No se permiten caracteres especiales o numeros");

      validator = $("#frm-colaborador").validate();
      $.validator.addMethod("num", function (value, element) {
      return this.optional(element) || /^[0-9-]+$/.test(value);
      }, "No se permiten caracteres especiales o numeros");




    validatorcolaborador = $("#frm-colaborador").validate();
    validatorcolaborador.destroy();
    validatorcolaborador = $("#frm-colaborador").validate({
        event: "blur",
        errorElement: "span",
        rules: {
          Cedula :{required:true,ced:true, rangelength:[1,12]},
          Nombre :{required:true,letras_espacios:true, rangelength:[1,30]},
          ap1 :{required:true,letras_espacios:true, rangelength:[1,30]},
          ap2 :{required:true,letras_espacios:true, rangelength:[1,30]},
          tel :{required:true,ced:true, rangelength:[8,10]},
          dir :{required:true,letras_espacios:true, rangelength:[1,30]},
          cor :{required:true,todos:true, rangelength:[1,30]},
          IdTC :{required:1},
          FechaIngreso: {required: true, fechas: true, rangelength: [8, 10]},
          horas: {required:true, num:true, min:1},
          sal: {required: true, num:true, min:1}
        },
        messages: {
          Cedula : { required:'Digite la identificación',ced:'Digite la identificación', rangelength:"Máximo {1} caracteres"},
          Nombre : { required:'Espacio requerido',letras_espacios:'No se admiten caracteres especiales', rangelength:"Máximo {1} caracteres"},
          ap1 : { required:'Espacio requerido',letras_espacios:'No se admiten caracteres especiales', rangelength:"Máximo {1} caracteres"},
          ap2 : { required:'Espacio requerido',letras_espacios:'No se admiten caracteres especiales', rangelength:"Máximo {1} caracteres"},
          tel : { required:'Espacio requerido',ced:'Espacio requerido', rangelength:"Máximo {1} caracteres"},
          dir : { required:'Espacio requerido',letras_espacios:'No se admiten caracteres especiales', rangelength:"Máximo {1} caracteres"},
          cor : { required:'Espacio requerido',letras_espacios:'No se admiten caracteres especiales', rangelength:"Máximo {1} caracteres"},
          IdTC : { required:'Elija'},
          FechaIngreso: { required: 'Espacio requerido', fechas: 'Fecha invalida', rangelength:"Máximo {1} caracteres"},
          horas: { required:'Espacio requerido', num:'Espacio requerido', min:'Debe ser minimo 1 hora'},
          sal: { required: 'Espacio requerido', num:'Espacio requerido', min:'Debe ser minimo ₡ 1'}
        },
        submitHandler: function (form)
        {

          $.ajax({
             type: 'POST',
             url:"?c=Persona&a=Guardar",
             data: {
               'IdPersona': $("#idP").val(),
               'Cedula':  $("#Cedula").val(),
               'Nombre':  $("#Nombre").val(),
               'Apellido1': $("#ap1").val(),
               'Apellido2': $("#ap2").val(),
               'Telefono': $("#tel").val(),
               'Direccion': $("#dir").val(),
               'Correo': $("#cor").val()
             },
             success:function(result){
               console.log($("#IdCol").val());
               $.ajax({
                  type: 'POST',
                  url:"?c=Colaborador&a=Guardar",
                  data: {
                      'IdColaborador': $("#IdCol").val(),
                      'IdPersona': $("#id").val(),
                      'IdTipoColaborador':  $("#IdTC").val(),
                      'FechaIngreso': $("#FechaIngreso").val(),
                      'FechaBaja': "",
                      'Horas':$('#horas').val(),
                      'SalarioBase':$('#sal').val(),
                      'SalarioBruto': __('salB').innerHTML
                    }

                  });
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
                    console.log(result)
                    swal({
                        type: 'error',
                        title: 'Error',
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
