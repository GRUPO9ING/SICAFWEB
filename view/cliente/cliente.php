
<h1 class="page-header">Clientes</h1>

<div class="text-left">
    <a class="btn btn-primary" onclick="limpiar();" data-toggle="modal" data-target="#mGuardar"><span class="fa fa-plus-square-o"></span> Nuevo Usuario</a>
</div>

<div class="table-responsive">
    <table id="tabla" class="table table-bordered table-hover" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>Cédula</th>
            <th>Nombre</th>
            <th>Primer Apellido</th>
            <th>Segundo Apellido</th>
            <th>Teléfono</th>
            <th>Dirección</th>
            <th>Correo</th>
            <th style="width :60px;"></th>

        </tr>
    </thead>
    <tbody>
    <?php foreach($this->model->Listar() as $r): ?>
      <?php $datos = $r->IdPersona."--".$r->Cedula."--".$r->Nombre."--".$r->Apellido1."--".$r->Apellido2."--".$r->Telefono."--".$r->Direccion."--".$r->Correo; ?>
        <tr>
            <td ><?php echo $r->Cedula; ?></td>
            <td><?php echo $r->Nombre; ?></td>
            <td><?php echo $r->Apellido1; ?></td>
            <td><?php echo $r->Apellido2; ?></td>
            <td><?php echo $r->Telefono; ?></td>
            <td><?php echo $r->Direccion; ?></td>
            <td><?php echo $r->Correo; ?></td>
            <td>
                <buttom class="btn btn-warning" onclick="agregar('<?php echo $datos ?>');" data-toggle="modal" data-target="#mGuardar"><span class="fa fa-pencil"></span></buttom>

                <button class="btn btn-danger btnborrar" id="EPersona" onclick="recarga('<?php echo $datos ?>')" ><span class="fa fa-trash"></span></button>
            </td>
        </tr>
    <?php endforeach; ?>
    </tbody>
</table>
</div>
