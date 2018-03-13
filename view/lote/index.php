<?php include('view/overall/header.php'); ?>
<link rel="stylesheet" href="assets/css/bootstrap-datepicker.min.css">
<div class="row col-md-12 col-sm-12">
    <div class="col col-sm-4 col-md-4" style="position:relative; right:30px;">
      <?php include('view/overall/navbar.php'); ?>
    </div>
    <div class="col col-sm-8 contenedor">
       <?php include('view/lote/lote.php'); ?>
    </div>
  </div>

<?php include('view/lote/lote-M.php'); ?>
<script src="assets/js/ajax_lote.js" charset="utf-8"></script>
<?php include('view/overall/footer.php'); ?>
