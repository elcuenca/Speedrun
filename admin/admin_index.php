<!DOCTYPE html>
<html>
<?php
  include('admin_partials/session.php');
  include('admin_partials/head.php');
?>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <?php
    include('admin_partials/header.php');
    include('admin_partials/sidecolumn.php');
  ?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Dashboard
        <small>Control panel</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
    
    <!-- Buttons for Admin to Use --> 
    <div class="row">
      <div class="col-sm-9">
      <a href="products.php">
         <button class="btn btn-primary">Add New Product</button>
        </a>
        <a href="categories.php">
         <button class="btn btn-primary">Add New Category</button><hr><br>
        </a>
      </div>
    </div>
      

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <?php
    include('admin_partials/footer.php');
  ?>
</body>
</html>
