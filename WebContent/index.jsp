<%@page import="tn.iit.dao.*"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@page import="tn.iit.util.HibernateUtil"%>
<%@page import="org.hibernate.*"%>
<%@page import="tn.iit.model.*"%>
<%@page import="org.dom4j.*"%>
<%@page import="org.hibernate.*"%>
<%@include file="nav.jsp"%>
<%
	HttpSession sessions = request.getSession();

	if (sessions.getAttribute("login") == null && sessions.getAttribute("password") == null) {

		request.getRequestDispatcher("login.jsp").forward(request, response);
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Gestion Convention</title>

<!-- Bootstrap Core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="vendor/morrisjs/morris.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<div id="wrapper">

		<!-- Navigation -->

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Gestion Convention</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			
			
			
			
			<!-- /.row -->
			<div class="row">
				<div class="card">
					<div class="card-header border-0">
						<h3 class="card-title">Nombre de convention par Type</h3>
					</div>
					<div class="card-body">
						<%
							ConventionDao convDao = new ConventionDao();
							TypeConvDao typeconvDao = new TypeConvDao();
							List<TypeConv> lst2 = typeconvDao.getAllTypeConv();
							for (int i = 0; i < lst2.size(); i++) {
								List<Convention> lst1 = convDao.getAllConventions_universitaire(lst2.get(i).getIdType());
								int s1 = lst1.size();
						%>
						<div
							class="d-flex justify-content-between align-items-center border-bottom mb-3">
							<p class="text-success text-xl"></p>
							<p class="d-flex flex-column text-right">
							
								<span class="text-success"> </i> <%=s1%>
								</span> <b><span class="text-muted"> <%
 	out.print(lst2.get(i).getNameType());
 %>
								</span></b>
							</p>
						</div>
						<%
							}
						%>
					</div>
				</div>
			</div>
			<!-- /.row -->



			<div class="row"></div>
			<!-- /.row -->
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="vendor/metisMenu/metisMenu.min.js"></script>

	<!-- Morris Charts JavaScript -->
	<script src="vendor/raphael/raphael.min.js"></script>
	<script src="vendor/morrisjs/morris.min.js"></script>
	<script src="data/morris-data.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="dist/js/sb-admin-2.js"></script>

</body>

</html>
