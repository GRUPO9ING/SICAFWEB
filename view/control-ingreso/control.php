<h1 class="page-header">Control de ingreso</h1>

<div class="text-left">
  <button class="btn btn-primary" data-toggle="modal" data-target="#mGuardar"><span class="fa fa-plus-square-o"></span> Nueva Compra</button>

</div>
<div class="table-responsive">
    <table id="tabla" class="table table-bordered table-hover" cellspacing="0" width="100%">
      <thead>
        <tr>
            <th style="width:100px;">Número factura</th>
            <th>Fecha</th>
            <th>Vendedor</th>
            <th style="width:100px;">Cliente</th>
            <th style="width:100px;">Total</th>
            <th style="width:60px;"></th>
        </tr>
    </thead>
    <tbody>
    <?php foreach($this->model->Listar() as $r): ?>
    <tr>
            <td><?php echo $r->IdFac; ?></td>
            <td><?php echo $r->FechaV; ?></td>
            <td><?php echo $r->IdUser; ?></td>
            <td><?php echo $r->IdCliente; ?></td>
            <td><?php echo $r->Totalfac; ?></td>
            <td>
                <buttom class="btn btn-warning" onclick="CargarInsumo('<?php echo $datos ?>');" data-toggle="modal" data-target="#mGuardar"><span class="fa fa-pencil"></span></buttom>

                <button class="btn btn-danger btnborrar" onclick="eli('<?php echo $datos ?>')" ><span class="fa fa-trash"></span></button>
            </td>
        </tr>
    <?php endforeach; ?>
    </tbody>
</table>
