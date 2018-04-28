<?php include('view/overall/header.php'); ?>

<div class="row col-sm-12 col-md-12">
    <div class="col col-sm-4 col-md-4"  style="position:relative; right:30px;">
      <?php include('view/overall/navbar.php'); ?>
    </div>
    <div class="col col-sm-8 col-md-8 contenedor" id="persona">
       <?php include('view/colaborador/horas.php'); ?>
    </div>
  </div>
<?php include('horas-m.php'); ?>
<script src="assets/js/validaH.js" charset="utf-8"></script>
<?php include('view/overall/footer.php'); ?>
