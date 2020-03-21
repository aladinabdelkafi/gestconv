<%@page import="tn.iit.dao.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@page import="tn.iit.util.HibernateUtil"%>
<%@page import="org.hibernate.*"%>
<%@page import="tn.iit.model.*"%>
<%@page import="org.dom4j.*"%>
<%@page import="org.hibernate.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Conventions</title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap 4 -->

<!-- Font Awesome -->
<link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="dist/css/adminlte.min.css">

<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">
</head>
<body>
	<div class="wrapper">
		<!-- Main content -->
		<section class="invoice">
			<!-- title row -->
			<div class="row">
				<div class="col-12">
					<h2 class="page-header">
						Liste Des Conventions <small class="float-right"> <script
								type="text/javascript">
							var now = new Date();
							var annee = now.getFullYear();
							var mois = now.getMonth() + 1;
							var jour = now.getDate();
							document.write("Imprimer le :"+ jour + "/" + mois
									+ "/" + annee);
						</script>
						</small>

					</h2>
				</div>
				<!-- /.col -->
				<br>
			</div>
			<!-- info row -->
			<!-- Table row -->
			<div class="row">
				<div >
				<br><br>
					<table class="table table-striped">
						<thead>
							<tr>
								<td>TYPE</td>
								<td>PARTICIPANT N1</td>
								<td>PARTICIPANT N2</td>
								<td>PARTICIPANT N3</td>
								<td>PARTICIPANT N4</td>
								<td>DATE D'EDITION</td>
								<td>DATE DE SIGNATURE</td>
								<td>OBJET</td>
								<td>DATE D'ENTRÉE EN VIGUEUR</td>
								<td>DATE D'EXPIRATION</td>
							</tr>
						</thead>
						<tbody>
							<%
								ConventionDao convDao = new ConventionDao();
								List<Convention> lst = convDao.getAllConventions();
								for (int i = 0; i < lst.size(); i++) {
							%>
							<tr>
								<td><%=lst.get(i).getTypeConv().getNameType()%></td>
								<td>
									<%
										out.print(lst.get(i).getParticipant1());
									%>
								</td>
								<td>
									<%
										out.print(lst.get(i).getParticipant2());
									%>
								</td>
								<td>
									<%
										out.print(lst.get(i).getParticipant3());
									%>
								</td>
								<td>
									<%
										out.print(lst.get(i).getParticipant4());
									%>
								</td>
								<td><%=lst.get(i).getDateEditionConv()%></td>
								<td><%=lst.get(i).getSateSigConv()%></td>
								<td><%=lst.get(i).getObjetConv()%></td>
								<td><%=lst.get(i).getDateVigueurConv()%></td>
								<td><%=lst.get(i).getDateExpConv()%></td>
							</tr>
							<%
								}
							%>

						</tbody>
					</table>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->


			<!-- /.row -->
		</section>
		<!-- /.content -->
	</div>
	<!-- ./wrapper -->

	<script type="text/javascript">
		window.addEventListener("load", window.print());
	</script>
</body>
</html>
