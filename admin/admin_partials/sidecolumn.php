<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">Hello, <?php echo $_SESSION['email'] ?></li>

        <li>
          <a href="admin_index.php">
            <i class="fa"></i> <span>Home</span>
            </span>
          </a>
        </li>
        
        <li>
          <a href="categories.php">
            <i class="fa"></i> <span>Categories</span>
            </span>
          </a>
        </li>

        <li>
          <a href="products_show.php">
            <i class="fa"></i> <span>Products</span>
            </span>
          </a>
        </li>

        <li>
          <a href="orders.php">
            <i class="fa"></i> <span>Orders</span>
            </span>
          </a>
        </li>

        <li>
          <a href="admin_partials/logout.php">
            <i class="fa"></i> <span>Logout</span>
            </span>
          </a>
        </li>

      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>