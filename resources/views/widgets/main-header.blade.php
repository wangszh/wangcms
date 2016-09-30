      {{-- widget.main-header --}}

      <!-- Main Header -->
      <header class="main-header">

        <!-- Logo -->
        <a href="#" class="logo">
          <!-- mini logo for sidebar mini 50x50 pixels -->
          <span class="logo-mini"><b>W</b>angszh</span>
          <!-- logo for regular state and mobile devices -->
          <span class="logo-lg"><b>Wangszhcms</b></span>
        </a>
         
		    <!-- Header Navbar -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Sidebar toggle button-->
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
          </a>
          <!-- Navbar Right Menu -->
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">

              <li>
                <a href="{{ route('home') }}">
                  <i class="fa fa-home" title="前台首页"></i>
                  <span class="label label-info">H</span>
                </a>
              </li>

            
           
              
             
                  <!-- Menu Footer-->
                  <li class="user-footer">
                   
                      <a href="{{ route('admin.me.index') }}" class="btn btn-default btn-flat">个人资料</a>
                   
                     
                    
                  </li>
                  <li> <a href="{{ route('logout') }}" class="btn btn-default btn-flat">退出</a>
                   </li>
            
              <!-- Control Sidebar Toggle Button -->
              <li>
                <a href="#" data-toggle="control-sidebar"><i class="fa fa-outdent"></i></a>
              </li>
            </ul>
          </div>
        </nav>
     
      </header>
