<?php
include ('admin_partials/head.php');

if(isset($_POST['login'])){
	include('../partials/connect.php');

	$email=$_POST['email'];
	$password=$_POST['password'];
	$sql="SELECT * FROM admin_t WHERE username='$email' AND password='$password'";
	$results=$connect->query($sql);
	$final=$results->fetch_assoc();

	if ($email=$final['username'] AND $password=$final['password']){
		header('location: admin_index.php');
	}else{
		header('location: admin_login.php');
	}

}


?>
<!-- TODO: [Design] create a header for our brand logo Speedrun -->
<!-- Header --> 
<div class="row">

</div>

<!--Login Col-->
<div class="row">
	
	<div class="col-sm-4">
	</div>
	<!-- Login Form -->
	<div class="col-sm-4">
		<div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">Welcome Admin!</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form class="form-horizontal" action="admin_login.php"method="POST">
              <div class="box-body">
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">Email</label>

                  <div class="col-sm-10">
                    <input type="email" class="form-control" id="inputEmail3" placeholder="Email" name="email">
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">Password</label>

                  <div class="col-sm-10">
                    <input type="password" class="form-control" id="inputPassword3" placeholder="Password" name="password">
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-sm-offset-2 col-sm-10">
                  </div>
                </div>
              </div>
              <!-- /.box-body -->
              <div class="box-footer">
                <button type="submit" class="btn btn-info pull-right" name="login">Login</button>
              </div>
	</div>

	<!--Free Space-->
	<div class="col-sm-4">
	</div>

</div>