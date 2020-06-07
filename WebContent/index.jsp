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
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@include file="nav.jsp"%>

<%
	HttpSession sessions = request.getSession();

	if (sessions.getAttribute("login") == null && sessions.getAttribute("password") == null) {

		request.getRequestDispatcher("login.jsp").forward(request, response);
	}
%>

<%
	Gson gsonObj = new Gson();
	Map<Object, Object> map = null;
	List<Map<Object, Object>> list = new ArrayList<Map<Object, Object>>();
	ConventionDao convDao = new ConventionDao();
	TypeConvDao typeconvDao = new TypeConvDao();
	List<TypeConv> lst2 = typeconvDao.getAllTypeConv();
	for (int i = 0; i < lst2.size(); i++) {
		List<Convention> lst1 = convDao.getAllConventions_universitaire(lst2.get(i).getIdType());

		map = new HashMap<Object, Object>();
		map.put("label", lst2.get(i).getNameType());
		map.put("y", lst1.size());
		map.put("exploded", true);
		list.add(map);
	}

	String dataPoints = gsonObj.toJson(list);
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

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Gestion Convention</h1>
					<div class="col-lg-3 col-6">
				<!-- small box -->
				<div class="small-box bg-warning">
					<div class="inner">
					<% ParticipentDao partDao = new ParticipentDao(); 
					List<Participant> lstpart=partDao.getAllParticipant();
					%>
						<h3><% out.print(lstpart.size()); %></h3>

						<p>Participants</p>
					</div>
					<div class="icon">
						<i class="ion ion-person-add"></i>
					</div>
					<a href="list_participant.jsp" class="small-box-footer">More
						info <i class="fas fa-arrow-circle-right"></i>
					</a>
				</div>
			</div>
			<!-- ./col -->
<div class="col-lg-12">
			<div id="chartContainer" style="height: 370px; width: 100%;"></div>
			</div>
			<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
					
				</div>
				<!-- /.col-lg-12 -->
			</div>

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
	<script src="plugins/chart.js/Chart.min.js"></script>
	<script type="text/javascript">
		window.onload = function() {

			var chart = new CanvasJS.Chart("chartContainer", {
				theme : "light2",
				animationEnabled : true,
				exportFileName : "pourcentage de convention par Type",
				exportEnabled : true,
				title : {
					text : "Pourcentage de convention par Type"
				},
				data : [ {
					type : "pie",
					showInLegend : true,
					legendText : "{label}",
					toolTipContent : "{label}: <strong>{y}</strong>",
					indexLabel : "{label} {y}",
					dataPoints :
	<%out.print(dataPoints);%>
		} ]
			});

			chart.render();

		}
	</script>
</body>

</html>
