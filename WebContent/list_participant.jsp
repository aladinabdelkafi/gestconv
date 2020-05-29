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

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	
		<!-- Navigation -->
<section class="content">
		<div id="page-wrapper" class="content-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-header">
						<h1 id='lst' class="page-header">Liste des Types de Conventions</h1>
							
						</div>
						<!-- /.panel-heading -->
						<div class="card-body">
							<table width="100%" class="table table-bordered table-striped"
								id="dataTables-example">
								<thead>
									<tr>
										<td>    N°     </td>
										<td>     Nom     </td>
										<td>    ACTION     </td>
										
									</tr>
								</thead>
								<tbody>
									<%
									ParticipentDao participentDao = new ParticipentDao();
										List<Participant> lst = participentDao.getAllParticipant();
										for (int i = 0; i < lst.size(); i++) {
									%>
									<tr>
										<td><%=lst.get(i).getIdParticipant()%></td>
										<td><%=lst.get(i).getNameParticipant()%></td>
										
										<%
											out.println("<td>  <a class='btn btn-info' href ='ParticipentControlleur?id="
														+ lst.get(i).getIdParticipant() + "&action=modifier"
														+ "'  onclick='return confirm(\"Voulez vous vraiment moifier  cette Convention ?\")'    >  <i class='fas fa-edit'></i> </a> ");
										%>
										<%
											out.println(" <a class='btn btn-danger' href ='ParticipentControlleur?id="
														+ lst.get(i).getIdParticipant() + "&action=supprimer"
														+ "'  onclick='return confirm(\"Voulez vous vraiment supprimer cette Convention ?\")'    >  <i class='fas fa-trash'></i> </a> </td>");
										%>

									</tr>
									<%
										}
									%>

								</tbody>
							</table>
							<!-- /.table-responsive -->
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->

			<!-- /.table-responsive -->
		</div>
		<!-- /.panel-body -->
	</section>
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
