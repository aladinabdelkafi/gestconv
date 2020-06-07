<%@page import="tn.iit.dao.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@page import="tn.iit.util.HibernateUtil"%>
<%@page import="org.hibernate.*"%>
<%@page import="tn.iit.model.*"%>
<%@page import="org.dom4j.*"%>
<%@page import="org.hibernate.*"%>
<%@include file="nav.jsp"%>
<%@page import="javax.servlet.http.HttpSession"%>
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

<title>Liste des Conventions</title>

<!-- Bootstrap Core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

<!-- DataTables CSS -->
<link href="vendor/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link href="vendor/datatables-responsive/dataTables.responsive.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">



</head>

<body>

	<div id="page-wrapper" class="content-wrapper">
	<br><br><br><br>
		<div class="row">
			<div class="col-lg-12">
				<div class="card card-primary card-outline">
					<div class="card-header">
						<h1>Liste des Types de Conventions</h1>
					</div>
					<!-- /.card-header -->
					<div class="card-body">
						<table id="example1" class="table table-bordered table-striped">
							<thead>
								<tr>
									<td>N°</td>
									<td>TYPE</td>
									<td>ACTION</td>

								</tr>
							</thead>
							<tbody>
								<%
									TypeConvDao typeConvDao = new TypeConvDao();
									List<TypeConv> lst = typeConvDao.getAllTypeConv();
									for (int i = 0; i < lst.size(); i++) {
								%>
								<tr>
									<td><%=lst.get(i).getIdType()%></td>
									<td><%=lst.get(i).getNameType()%></td>

									<%
										out.println("<td>  <a class='btn btn-info' href ='TypeControlleur?id=" + lst.get(i).getIdType()
													+ "&action=modifier"
													+ "'  onclick='return confirm(\"Voulez vous vraiment moifier  cette Convention ?\")'    >  <i class='fas fa-edit'></i> </a> ");
									%>
									<%
										out.println("  <a class='btn btn-danger' href ='TypeControlleur?id=" + lst.get(i).getIdType()
													+ "&action=supprimer"
													+ "'  onclick='return confirm(\"Voulez vous vraiment supprimer cette Convention ?\")'    >  <i class='fa fa-trash'></i> </a> </td>");
									%>

								</tr>
								<%
									}
								%>

							</tbody>
							<tfoot>
								<tr>
									<td>N°</td>
									<td>TYPE</td>
									<td>ACTION</td>

								</tr>
							</tfoot>
						</table>
					</div>
					<!-- /.card-body -->
				</div>
				<!-- /.card -->
			</div>
			<!-- /.col-lg-12 -->
		</div>

	</div>

	<!-- jQuery -->
	<script src="vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="vendor/metisMenu/metisMenu.min.js"></script>

	<!-- DataTables JavaScript -->
	<script src="vendor/datatables/js/jquery.dataTables.min.js"></script>
	<script src="vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
	<script src="vendor/datatables-responsive/dataTables.responsive.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="dist/js/sb-admin-2.js"></script>

	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	<script>
		$(document).ready(function() {
			$('#dataTables-example').DataTable({
				responsive : true
			});
		});
	</script>


</body>

</html>
