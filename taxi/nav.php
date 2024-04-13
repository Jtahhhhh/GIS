<?php
session_start();
require 'connect.php';						 
?>

<div class="container main-menu">
			    	<div class="row align-items-center justify-content-between d-flex">
			    		<a href="index.php"><img src="img/logo.png" alt="" title="" /></a>		
						<nav id="nav-menu-container">
							<ul class="nav-menu">
							  <li class="menu-active"><a href="index.php">Home</a></li>
							  <li><a href="about.php">About</a></li>
							  <li><a href="service.php">Services</a></li>
							  <li><a href="gallery.php">Gallery</a></li>
                <li><a href="elements.php">Elements</a></li>							  			          	          
							  <li><a href="contact.php">Contact</a></li>
							  <li class="menu-has-children"><a href="">My account</a>
							    <ul>
							      <!-- <li><a href="sign_in.php">Sign in</a></li>
							      <li><a href="registration.php">Registration</a></li> -->
							      <!-- <li class="menu-has-children"><a href="">Level 2</a>
							        <ul>
							          <li><a href="#">Item One</a></li>
							          <li><a href="#">Item Two</a></li>
							        </ul>
							      </li>					               -->

                    <?php
							 // require "login.php";

							      if(!isset($_SESSION["id"])) // If session is not set then redirect to Login Page
							       {
							           printf(' <li><a href="sign_in.php"><span class="glyphicon glyphicon-log-in"></span> Đăng nhập</a></li>');
                         printf(' <li><a href="registration.php"><span class="glyphicon glyphicon-log-in"></span> Đăng ký</a></li>');
							       }
							       else{
							       	echo '<li>  Xin chào ' ; echo '<span style="color:Tomato;"><a href="ttkh.php"><b>' . $_SESSION['name'] . '</b></a></span></li>' ;
									    echo '<li><span class="glyphicon glyphicon-log-out"></span><a href="logout.php"> Đăng xuất!</a></li>';
							       }

							?>

							    </ul>
							  </li>
							  
							</ul>
						</nav><!-- #nav-menu-container -->		
			    	</div>
			    </div>