<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Gestion Convention</title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Font Awesome -->
<link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Tempusdominus Bbootstrap 4 -->
<link rel="stylesheet"
	href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<!-- iCheck -->
<link rel="stylesheet"
	href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- JQVMap -->
<link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="dist/css/adminlte.min.css">
<!-- overlayScrollbars -->
<link rel="stylesheet"
	href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<!-- Daterange picker -->
<link rel="stylesheet"
	href="plugins/daterangepicker/daterangepicker.css">
<!-- summernote -->
<link rel="stylesheet" href="plugins/summernote/summernote-bs4.css">
<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">
</head>




<nav class="navbar navbar-expand-lg navbar-dark bg-primary rounded">
	<a class="navbar-brand" href="#">Navbar</a>

	<ul class="navbar-nav ml-auto">

		<li class="nav-item dropdown">
		<a class="nav-link dropdown-toggle"
			href="#" id="navbarDropdown" role="button" 
			data-toggle="dropdown"
			aria-haspopup="true" aria-expanded="false"> 
			<i class="fa fa-user fa-fw"></i>
         </a>
			<div class="dropdown-menu" aria-labelledby="navbarDropdown">
				<a class="dropdown-item" href="#"><i class="fa fa-user fa-fw"></i>
					User Profile</a> <a class="dropdown-item" href="#"><i
					class="fa fa-gear fa-fw"></i> Settings</a> <a class="dropdown-item"
					href="LogoutControlleur"><i class="fa fa-sign-out fa-fw"></i>
					Logout</a>

			</div></li>
	</ul>
</nav>





<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
	<!-- Brand Logo -->
	<a href="index3.html" class="brand-link"> <span
		class="brand-text font-weight-light">Gestion Convention</span>
	</a>

	<!-- Sidebar -->
	<div class="sidebar">
		<!-- Sidebar Menu -->
		<nav class="mt-2">
			<ul class="nav nav-pills nav-sidebar flex-column"
				data-widget="treeview" role="menu" data-accordion="false">
				<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
				<li class="nav-item"><a href="index.jsp"
					class="nav-link active"> <i
						class="nav-icon fas fa-tachometer-alt"></i>
						<p>Dashboard</p>
				</a></li>
				<li class="nav-item has-treeview"><a href="#" class="nav-link">
						<i class="nav-icon fas fa-table"></i>
						<p>
							Gestion Convention <i class="fas fa-angle-left right"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a href="convention.jsp"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>Ajout Convention</p>
						</a></li>
						<li class="nav-item"><a href="list_conv.jsp" class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p>Liste Convention</p>
						</a></li>
						<li class="nav-item"><a href="invoice-print.jsp"
							class="nav-link" target="_blank"> <i
								class="far fa-circle nav-icon"></i>
								<p>Imprimer Convention</p>
						</a></li>
					</ul></li>



				<li class="nav-item has-treeview"><a href="#" class="nav-link">
						<i class="nav-icon fas fa-table"></i>
						<p>
							Gestion Type Convention <i class="fas fa-angle-left right"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a href="typeConv.jsp" class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p>Ajout Type Convention</p>
						</a></li>
						<li class="nav-item"><a href="list_TypeConv.jsp"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>Liste Type Convention</p>
						</a></li>

					</ul></li>


				<li class="nav-item has-treeview"><a href="#" class="nav-link">
						<i class="nav-icon fas fa-table"></i>
						<p>
							Gestion Participant <i class="fas fa-angle-left right"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a href="Participant.jsp"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>Ajout Participant</p>
						</a></li>
						<li class="nav-item"><a href="list_participant.jsp"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>Liste Participant</p>
						</a></li>

					</ul></li>

			</ul>
		</nav>
		<!-- /.sidebar-menu -->
	</div>
	<!-- /.sidebar -->
</aside>

<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
	$.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="plugins/chart.js/Chart.min.js"></script>
<!-- Sparkline -->
<script src="plugins/sparklines/sparkline.js"></script>
<!-- JQVMap -->
<script src="plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
<!-- jQuery Knob Chart -->
<script src="plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="plugins/moment/moment.min.js"></script>
<script src="plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script
	src="plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script
	src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>

</html>
