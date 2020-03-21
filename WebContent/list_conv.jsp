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
						<h1 id='lst' class="page-header">Liste des Conventions</h1>
							<button id="myBtn" type="button" onclick="printData()"
								class="fas fa-print">print</button>
						</div>
						<!-- /.panel-heading -->
						<div class="card-body">
							<table width="100%" class="table table-bordered table-striped"
								id="dataTables-example">
								<thead>
									<tr>
										<td>N°</td>
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
										<td>MODIFIER</td>
										<td>SUPPRIMER</td>
									</tr>
								</thead>
								<tbody>
									<%
										ConventionDao convDao = new ConventionDao();
										List<Convention> lst = convDao.getAllConventions();
										for (int i = 0; i < lst.size(); i++) {
									%>
									<tr>
										<td><%=lst.get(i).getIdConv()%></td>
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
										<%
											out.println("<td>  <a class='btn btn-block btn-social btn-bitbucket' href ='ConventionControlleur?id="
														+ lst.get(i).getIdConv() + "&action=modifier"
														+ "'  onclick='return confirm(\"Voulez vous vraiment moifier  cette Convention ?\")'    >  <i class='fa fa-trash-o'></i> Modifer</a> </td>");
										%>
										<%
											out.println("<td>  <a class='btn btn-block btn-social btn-bitbucket' href ='ConventionControlleur?id="
														+ ((Convention) lst.get(i)).getIdConv() + "&action=supprimer"
														+ "'  onclick='return confirm(\"Voulez vous vraiment supprimer cette Convention ?\")'    >  <i class='fa fa-trash-o'></i> Supprimer</a> </td>");
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

		function printData() {
			var divToPrint = document.getElementById("dataTables-example");
			var dPrint = document.getElementById("lst");
			newWin = window.open("ala");
			newWin.document.write(dPrint.outerHTML);

			var x = divToPrint.rows.length;
			var body = newWin.document.getElementsByTagName("body")[0];
			var tbl = newWin.document.createElement("table");
			var tblBody = newWin.document.createElement("tbody");

			for (var i = 0; i < x; i++) {
				var row = document.createElement("tr");
				var y = divToPrint.rows[i].cells.length;
				for (var j = 1; j < y; j++) {
					var cell = document.createElement("td");
					var cellText = document
							.createTextNode(divToPrint.rows[i].cells[j].innerHTML);
					cell.appendChild(cellText);
					row.appendChild(cell);
				}
				tblBody.appendChild(row);
			}

			tbl.appendChild(tblBody);
			body.appendChild(tbl);
			tbl.setAttribute("border", "2");

			newWin.print();
		}
	</script>


</body>

</html>
