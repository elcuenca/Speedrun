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
    <div class="row">
      <div class="col-sm-3">
      </div>

      <!--Form Starts-->
      <div class="col-sm-6">
      <h1>Products</h1>
      <form role="form" action="product_handler.php" method="POST" enctype="multipart/form-data">
                <div class="box-body">

                  <!--Product Name Field-->
                  <div class="form-group">
                    <label for="name">Product</label>
                    <input type="text" class="form-control" id="name" placeholder="Enter Product Name" name="product_name">
                  </div>
                  

                  <!--Product Price Field-->
                  <div class="form-group">
                    <label for="price">Price</label>
                    <input type="text" class="form-control" id="price" placeholder="Enter Price" name="price">
                  </div>
                  <div class="form-group">

                  <!--Product Color Field-->
                  <div class="form-group">
                    <label for="color">Color</label>
                    <input type="text" class="form-control" id="color" placeholder="Enter Color" name="color">
                  </div>

                  <!--Product Picture/s-->
                  <div class="form-group">
                    <label for="picture">Product Picture</label>
                    <input type="file" id="picture" name="file">
                    <p class="help-block">Please choose the highest resolution as possible for the product picture.</p>
                  </div>

                  <!--Product Description Field-->
                  <div class="form-group">
                    <label for="description">Product Description</label>
                    <textarea id="description" class="form-control" rows="10" placeholder="Enter description" name="product_description"></textarea>
                  </div>

                  <!--Categories -->
                  <div class="form-group">
                    <label for="category">Category</label>
                    <select id="category" name="category">
                      <!-- Showing Categories from categories_t (Dynamic) -->
                      <?php
                        include('../partials/connect.php');
                        $cat= "SELECT * from category_t";
                        $results=mysqli_query($connect,$cat);
                        while($row=mysqli_fetch_assoc($results)){
                          echo "<option value=".$row['id'].">".$row['category_name']."</option>";
                        }
                      ?>
                    </select>
                </div>
                <!-- /.box-body -->
                  <button type="submit" class="btn btn-primary">Submit</button>
                </div>
              </form>
      </div>
      <!-- Form Ends -->
      <div class="col-sm-3">
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
