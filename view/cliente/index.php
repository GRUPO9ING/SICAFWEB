<?php include('view/overall/header.php'); ?>
<div class="row col-md-12 col-sm-12 col-lg-12">
    <div class="col col-sm-4 col-md-4 col-lg-4"  style="position:relative; right:30px;">
      <?php include('view/overall/navbar.php'); ?>
    </div>
    <div class="col col-sm-8 col-md-8 col-lg-8 contenedor" id="persona">
       <?php include('view/cliente/cliente.php'); ?>
    </div>
  </div>
<script src="assets/js/alertas.js"></script>
<?php include('cliente-editarM.php'); ?>
<?php include('view/overall/footer.php'); ?>
