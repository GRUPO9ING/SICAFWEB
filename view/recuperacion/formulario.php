<?php include('view/overall/header.php');?>
<div class="container col col-sm-offset-4 col-sm-4 col-md-offset-4 col-md-4">
  <center>
  <h2>Recuperacion de contraseña</h2>
  <br>
  </center>
    <div id="formulario">
      <form>
        <div class="form-group">
          <label for="email" required>Digite el username o email</label>
          <input type="text" class="form-control" id="email" placeholder="Digite el nombre de usuario" name="email">
        </div>
        <center>
          <button type="button" id="next" class="btn btn-success">Siguiente</button>
          <a href="?c=Login" type="button" id="back" class="btn btn-danger">Cancelar</a>
      </center>
      </form>
    </div>
    <div id="codigo">
      <form>
        <div class="form-group">
          <label for="ff" required>Digite el codigo de recuperacion</label>
          <input type="text" class="form-control" id="ff" placeholder="Digite el codigo de recuperacion" name="codigo">
        </div>
        <center>
          <button type="button" id="restaurar" class="btn btn-success">Siguiente</button>
          <a href="?c=Login" type="button" id="back1" class="btn btn-danger">Cancelar</a>
        </center>
      </form>
    </div>
    <div id="pass">
      <form>
        <div class="form-group">
          <label for="pw" required>Nueva contraseña</label>
          <input type="password" class="form-control" id="pw" placeholder="Digite la nueva contraseña" name="codigo">
        </div>
        <center>
          <button type="button" id="guardar" class="btn btn-success">Siguiente</button>
          <a href="?c=Login" type="button" id="cancl" class="btn btn-danger">Cancelar</a>
        </center>
      </form>
    </div>
</div>

<script src="assets/js/recuperacion.js" charset="utf-8"></script>
<?php include('view/overall/footer.php'); ?>
