<?php include('view/overall/header.php'); ?>

<div class="row col-md-12 col-sm-12">
    <div class="col col-sm-4 col-md-4"  style="position:relative; right:30px;">
      <?php include('view/overall/navbar.php'); ?>
    </div>
    <div class="col col-sm-8 col-md-8 contenedor" id="persona">
       <?php include('view/persona/persona.php'); ?>
    </div>
  </div>
<?php include('persona-editarM.php'); ?>
<script src="assets/js/ajax_persona.js" charset="utf-8"></script>
<?php include('view/overall/footer.php'); ?>
