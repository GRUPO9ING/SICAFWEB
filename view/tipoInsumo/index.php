<?php include('view/overall/header.php'); ?>
<div class="row col-sm-12 col-md-12" >

    <div class="col col-sm-4 col-md-4" style="position:relative; right:30px;">
      <?php include('view/overall/navbar.php'); ?>
    </div>

    <div class="col col-sm-8 col-md-8">
       <?php include('view/tipoInsumo/tipoInsumo.php'); ?>
    </div>
  </div>
<script src="assets/js/ajax_TipoInsumo.js"></script>
<?php include('tipoInsumo-M.php'); ?>
<?php include('view/overall/footer.php'); ?>
