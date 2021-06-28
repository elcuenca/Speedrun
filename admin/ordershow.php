<!DOCTYPE html>
<html>
<?php
  include('admin_partials/session.php'); 
?>

<!-- Dev Note: I did not implemented include function inside the php tag above because I will use a CSS style tag inside this head tag 
   - Dev El 

--> 

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | Dashboard</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
  <!-- Morris chart -->
  <link rel="stylesheet" href="bower_components/morris.js/morris.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="bower_components/jvectormap/jquery-jvectormap.css">
  <!-- Date Picker -->
  <link rel="stylesheet" href="bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="bower_components/bootstrap-daterangepicker/daterangepicker.css">
  <!-- bootstrap wysihtml5 - text editor -->
  <link rel="stylesheet" href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

<!--- CSS for the Card --> 
<style>
  .card{
    box-shadow:  0 8px 16px 0 rgba(0,0,0,0,0.2);
  }

  .container{
    padding:  1px 12px;
  }

  p{
    max-width:  50%;
  }
</style>
</head>


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
        Product List 
        <br>
        <small>Your complete list of all products saved</small>
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">

    <div class="row">
      <div class="col-sm-1">
      </div>
      <div class="col-sm-6">


        <!--Dev Note: 

        For this portion, I did not like the way they presented the data so I outsourced from different channel to display the data for the admin in a more pleasing way. The core code will be based on our original tutorial but for the aesthetic part will be coming from a w3schools tutorial: https://www.w3schools.com/howto/howto_css_cards.asp 

        -Dev El 
         -->

          <?php
          include('../partials/connect.php');

          $id=$_GET['pro_id'];
          $sql="SELECT * from orders_t WHERE id='$id'";
          $results=$connect->query($sql);

          $final=$results->fetch_assoc();
          ?>

          <!-- Presentation for the Product Details-->
          <div class="card">
            
            <div class="container">
              <h3><b>Customer ID: <?php echo $final['customer_id'] ?></b></h3>
              <!-- &#8369 stands for the html code for Peso Sign -->
              <h4>Total Amount: &#8369 <?php echo $final['total_amount'] ?></h4>
              <h4>Mode of Payment: <?php echo $final['pay_method'] ?></h4>
              <h4>Contact Number: <?php echo $final['phone_number'] ?></h4>
              <h4>Address: <?php echo $final['address'] ?></h4>
            </div>
          </div>
       
      </div>
      <!--- Order Details --> 
      <div class="col-sm-5">
        <div class="card">
          <?php
          include('../partials/connect.php');

          $id=$_GET['pro_id'];
          $sql="SELECT * from order_details_t WHERE id='$id'";
          $results=$connect->query($sql);

          $final=$results->fetch_assoc();
          ?>
            <div class="container">
              <h3><b>Product No: <?php echo $final['product_id'] ?></b></h3>
              <h4>Quantity: <?php echo $final['quantity'] ?></h4>
            </div>
          </div>
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
